package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.BankCard;
import top.zzh.bean.LogMoney;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.BankCardService;
import top.zzh.service.LogMoneyService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.LogMoneyVO;

import javax.servlet.http.HttpSession;

/**
 * Created by 陈桢 on 2017/12/26.
 */
@Controller
@RequestMapping("/logMoney")
public class LogMoneyController {

    private Logger logger = LoggerFactory.getLogger(LogMoneyController.class);

    @Autowired
    private LogMoneyService LogMoneyService;

    @RequestMapping("list")
    public String list() {
        logger.info("资金流向记录");
        return "manager/logMoney";
    }

    @RequestMapping("listPager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize) {
        logger.info("资金流向记录分页");
        return LogMoneyService.listPager(pageIndex,pageSize);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize,LogMoneyVO logMoneyVO) {
        logger.info("资金流向记录分页+条件查询");
        return LogMoneyService.listPagerCriteria(pageIndex, pageSize, logMoneyVO);
    }

    @RequestMapping("pageById")
    @ResponseBody
    public Pager pageById(int pageIndex, int pageSize, HttpSession session) {

        logger.info("用户资金流向记录分页+条件查询");
        Long id=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        return LogMoneyService.listPagerById(pageIndex,pageSize,id);
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(LogMoney logMoney){
        logger.info("添加资金流向记录！");
        ControllerStatusVO statusVO = null;
        try{
            LogMoneyService.save(logMoney);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        return statusVO;
    }


}
