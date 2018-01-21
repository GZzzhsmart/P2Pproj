package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.LogMoney;
import top.zzh.bean.Reward;
import top.zzh.bean.UserMoney;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.query.RewardQuery;
import top.zzh.service.LogMoneyService;
import top.zzh.service.RewardService;
import top.zzh.service.UserMoneyService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.UserMoneyVO;

import java.math.BigDecimal;
import java.util.Calendar;

/**
 * Created by Administrator on 2018/1/9 0009.
 */
@Controller
@RequestMapping("/reward")
public class RewardController {

    @Autowired
    private RewardService rewardService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private LogMoneyService logMoneyService;

    @RequestMapping("rewardList")
    public String rewardList(){
        return  "manager/RewardList";
    }

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize, RewardQuery rewardQuery) {

        return rewardService.listPagerCriteria(pageIndex,pageSize,rewardQuery);
    }

    @PostMapping("updateState/{uid}/{state}/{money}")
    @ResponseBody
    public ControllerStatusVO updateState(@PathVariable("uid")Long uid, @PathVariable("state") Integer state, @PathVariable("money")BigDecimal money){
        ControllerStatusVO statusVO=null;

        Calendar calendar=Calendar.getInstance();
        Reward reward4=new Reward();
        reward4.setUid(uid);
        reward4.setState((byte)2);
        reward4.setDate(calendar.getTime());
        rewardService.updateState(reward4);

        UserMoney userMoney=userMoneyService.findJlmoney(uid);
        BigDecimal yjlmoney=null;
        BigDecimal jlmoney=null;
        if(userMoney==null){
            yjlmoney=BigDecimal.valueOf(0);
            jlmoney=money.subtract(yjlmoney);
        }

        if(userMoney!=null){
            yjlmoney=userMoney.getJlmoney();
            jlmoney=money.subtract(yjlmoney);
        }

        LogMoney logMoney=new LogMoney();
        logMoney.setUid(uid);
        logMoney.setType((byte)3);
        logMoney.setIn(jlmoney);
        logMoneyService.save(logMoney);

        userMoneyService.updateJlmoney(money,uid);

        UserMoneyVO userMoneyVO =new UserMoneyVO();
        userMoneyVO.setUid(String.valueOf(uid));
        userMoneyVO.setZmoney(jlmoney.add(userMoney.getZmoney()));
        userMoneyVO.setKymoney(jlmoney.add(userMoney.getKymoney()));
        userMoneyService.updateZmoney(userMoneyVO);

        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SWAY_UPDATE_STATE_SUCCESS);
        return statusVO;
    }

}
