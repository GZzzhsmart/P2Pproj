package top.zzh.controller;

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
import top.zzh.service.RecommendService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.RecommendData;
import top.zzh.vo.RecommendVO;
import top.zzh.vo.RecommendViewVO;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        long uid = (long) session.getAttribute(Constants.USER_ID_SESSION);
        String tzm = recommendService.getByUid(uid);
        Date date=recommendService.dateGet();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        String dateStr=sdf.format(date);
        ModelAndView m = new ModelAndView();
        m.setViewName("user/tuijian");
        m.addObject("tzm", tzm);
        m.addObject("date",dateStr);
        return m;
    }

    @RequestMapping("listByUid/{pageNo}/{byDate}")
    public ModelAndView listByUid(HttpSession session, @PathVariable("pageNo") int pageNo, @PathVariable("byDate") int byDate) {
        long uid = (long) session.getAttribute(Constants.USER_ID_SESSION);
        RecommendViewVO recommendViewVO = new RecommendViewVO();
        recommendViewVO.setUid(uid);
        recommendViewVO.setByDate(byDate);
        if (pageNo <= 0) {
            pageNo = 1;
        }
        Pager obj = (Pager) recommendService.listPagerUid(pageNo, 3, recommendViewVO);
        List<RecommendData> recommendList = new ArrayList<>();
        int count = 0, i = 0;
        double sumMoney;
        for (Object o : obj.getRows()) {
            RecommendData recommend2 = (RecommendData) o;
            BigDecimal big = recommendService.tzByUid(recommend2.getUid());
            if (big != null) {
                sumMoney = big.doubleValue();
                if (sumMoney > 10000) {
                    recommend2.setMoney(50);
                    count++;
                } else {
                    recommend2.setMoney(0);
                }
                recommendList.add(recommend2);
            }else {
                recommend2.setMoney(0);
            }
        }
        if (count > recommendService.countTicketByUid(uid, 27)) {
            recommendService.userTicketSave(uid, 27);
        }
        if(count>=5&&recommendService.countTicketByUid(uid, 28)<1){
            recommendService.userTicketSave(uid, 28);
        }
        ModelAndView m = new ModelAndView();
        m.setViewName("user/recommendList");
        m.addObject("obj", recommendList);
        m.addObject("page", obj);
        m.addObject("byDate", byDate);
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
