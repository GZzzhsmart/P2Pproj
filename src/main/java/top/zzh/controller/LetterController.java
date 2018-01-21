package top.zzh.controller;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.LetterService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.LetterVO;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 谢学培 on 2017/1/15.
 */
@Controller
@RequestMapping("/letter")
public class LetterController {
    private Logger logger = LoggerFactory.getLogger(LetterController.class);

    @Autowired
    private LetterService letterService;

    @RequestMapping("page")
    public String page() {
        return "recommend/letter";
    }

    @RequestMapping("letterAdd")
    public String letterAdd() {
        return "recommend/letterSave";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(LetterVO letterVO) {
        logger.info("消息发送");
        ControllerStatusVO statusVO = null;
        try {
            letterService.save(letterVO);
            System.out.println("主键id" + letterVO.getLid());
            letterService.letterUserUpdate(letterVO.getLid());
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("listByUid/{pageNo}/{lState}")
    public ModelAndView listByUid(HttpSession session, @PathVariable("pageNo") int pageNo, @PathVariable("lState") int lState) {
        long uid = (long) session.getAttribute(Constants.USER_ID_SESSION);
        if (pageNo == 0) {
            pageNo = 1;
        }
        LetterVO letterVO = new LetterVO();
        letterVO.setlState(lState);
        letterVO.setUid(uid);
        Pager pageObj = (Pager) letterService.listPagerUid(pageNo, 10, letterVO);
        List<LetterVO> letterList = new ArrayList<>();
        for (Object o : pageObj.getRows()) {
            LetterVO letter2 = (LetterVO) o;
            letterList.add(letter2);
        }
        ModelAndView m = new ModelAndView();
        m.setViewName("recommend/letterView");
        m.addObject("obj", letterList);
        m.addObject("page", pageObj);
        m.addObject("1State", lState);
        return m;
    }

    @RequestMapping("checkContent")
    @ResponseBody
    public String checkContent(HttpSession session, long letterId) {
        logger.info("加载消息内容");
        long uid = (long) session.getAttribute(Constants.USER_ID_SESSION);
        return letterService.checkContent(uid, letterId);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Integer pageIndex, Integer pageSize, LetterVO letter) {
        logger.info("推进管理条件查询");
        return letterService.listPagerCriteria(pageIndex, pageSize, letter);
    }

    @RequestMapping("empty")
    @ResponseBody
    public ControllerStatusVO empty(HttpSession session) {
        logger.info("消息记录清空");
        long uid = (long) session.getAttribute(Constants.USER_ID_SESSION);
        ControllerStatusVO statusVO = null;
        try {
            if (letterService.countByRead(uid) <= 0) {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.LETTER_DELETE_FAIL);
                return statusVO;
            }
            letterService.removeById(uid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("updateLetterState")
    @ResponseBody
    public ControllerStatusVO updateLetterState(Long[] lids,int state) {
        logger.info("消息记录清空");
        ControllerStatusVO statusVO = null;
        try {
            for (Long lid : lids) {
                letterService.updateLetterState(lid, state);
            }
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.LETTER_UPDATE_SUCCESS);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.LETTER_UPDATE_FAIL);
        }
        return statusVO;
    }
}
