package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.Recommend;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.RecommendService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.RecommendData;
import top.zzh.vo.RecommendVO;
import top.zzh.vo.RecommendViewVO;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 谢学培 on 2017/12/21.
 */
@Controller
@RequestMapping("/recommend")
public class RecommendController {
    private Logger logger = LoggerFactory.getLogger(RecommendController.class);

    @Autowired
    private RecommendService recommendService;

    @RequestMapping("page")
    public String page() {
        return "recommend/recommend";
    }

    @RequestMapping("tuijian")
    public ModelAndView tuijian(HttpSession session) {
        long uid=(long)session.getAttribute(Constants.USER_ID_SESSION);
        String tzm=recommendService.getByUid(uid);
        ModelAndView m=new ModelAndView();
        m.setViewName("user/tuijian");
        m.addObject("tzm",tzm);
        return m;
    }
    @RequestMapping("listByUid")
    public ModelAndView listByUid(HttpSession session,int pageNo, RecommendViewVO recommend) {
        //long uid=(long)session.getAttribute(Constants.USER_ID_SESSION);O

        recommend.setUid(36);
        if (pageNo==0){
            pageNo=1;
        }
        Pager obj=(Pager)recommendService.listPagerUid(pageNo, 3, recommend);
        List<RecommendData> recommendList=new ArrayList<>();
        for(Object o:obj.getRows()){
            RecommendData recommend2 =(RecommendData)o;
            recommendList.add(recommend2);
        }
        ModelAndView m=new ModelAndView();
        m.setViewName("user/recommendList");
        m.addObject("obj",recommendList);
        m.addObject("page",obj);
        return m;
    }
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize, RecommendVO recommend) {
        logger.info("推进管理条件查询");
        return recommendService.listPagerCriteria(pageIndex, pageSize, recommend);
    }

    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO remove(long id) {
        logger.info("推进记录删除");
        ControllerStatusVO statusVO = null;
        try {
            recommendService.remove(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("/delMany")
    @ResponseBody
    public ControllerStatusVO delEduList(Long[] ids) {
        logger.info("推进记录批量删除");
        ControllerStatusVO statusVO = null;
        try {
            for (Long id : ids) {
                recommendService.remove(id);
            }
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_DELETE_SUCCESS);
        return statusVO;
    }
}
