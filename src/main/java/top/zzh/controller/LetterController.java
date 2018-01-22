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
            System.out.println("主键id"+letterVO.getLid());
            letterService.letterUserUpdate(letterVO.getLid());
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        return statusVO;
    }
        @RequestMapping("listByUid/{pageNo}/{lState}")
    public ModelAndView listByUid(HttpSession session, @PathVariable("pageNo") int pageNo,@PathVariable("lState") int lState) {
        //long uid=(long)session.getAttribute(Constants.USER_ID_SESSION);O
        if (pageNo==0){
            pageNo=1;
        }
        Pager pageObj=(Pager)letterService.listPagerUid(pageNo, 3, lState);
        List<LetterVO> letterList=new ArrayList<>();
        for(Object o:pageObj.getRows()){
            LetterVO letter2 =(LetterVO)o;
            letterList.add(letter2);
        }
        ModelAndView m=new ModelAndView();
        m.setViewName("recommend/letterView");
        m.addObject("obj",letterList);
        m.addObject("page",pageObj);
        m.addObject("1State",lState);
        return m;
    }
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Integer pageIndex, Integer pageSize, LetterVO letter) {
        logger.info("推进管理条件查询");
        return letterService.listPagerCriteria(pageIndex, pageSize, letter);
    }

    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO remove(long lid) {
        logger.info("消息记录删除");
        ControllerStatusVO statusVO = null;
        try {
            letterService.remove(lid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("delMany")
    @ResponseBody
    public ControllerStatusVO delEduList(@Param("ids") long[] ids) {
        logger.info("消息记录批量删除");
        ControllerStatusVO statusVO = null;
        try {
            for (long lid : ids) {
                letterService.remove(lid);
            }
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        return statusVO;
    }
}
