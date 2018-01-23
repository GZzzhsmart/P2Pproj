package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Reward;
import top.zzh.bean.User;
import top.zzh.bean.UserMoney;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.common.JLff;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.RewardService;
import top.zzh.service.TzbService;
import top.zzh.service.UserMoneyService;
import top.zzh.service.UserService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.TzbVO;
import top.zzh.vo.UserMoneyVO;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;


/**
 * Created by 曾志湖 on 2017/12/26.
 * 投资表
 */
@Controller
@RequestMapping("/tz")
public class TzbController {

    private Logger logger = LoggerFactory.getLogger(TzbController.class);
    @Autowired
    private TzbService tzbService;

    @Autowired
    private RewardService rewardService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private UserService userService;


    @RequestMapping("save/{uid}/{xmoney}/{pass}/{maxMoney}/{baid}")
    @ResponseBody
    public ControllerStatusVO save(@PathVariable("uid") Long uid,@PathVariable("xmoney") BigDecimal xmoney,@PathVariable("pass") String pass,
    @PathVariable("maxMoney") BigDecimal maxMoney,@PathVariable("baid") Long baid, TzbVO tzb, HttpSession session){
        ControllerStatusVO statusVO = null;
        String name = (String) session.getAttribute(Constants.USER_IN_SESSION);
        Long userid = (Long)session.getAttribute(Constants.USER_ID_SESSION);
        //判断投资金额是否大于投标金额
        if(xmoney.compareTo(maxMoney)==1){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.TZ_SAVE_maxMoney_FAIL);
            return statusVO;
        }


        //判断是否是自己发布的标
        if(uid.equals(userid)) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_TZ_FAIL);
            return statusVO;
        }
        String zpwd=userService.getByZpwd(name);
        String xpwd= EncryptUtils.md5(pass);
        //判断支付密码是否正确
        if(!zpwd.equals(xpwd)){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_ERROR_ERROR);
            return statusVO;
        }

        logger.info("用户正在开始投资");


        if(name!=null){
            tzb.setUid(userid);
            tzb.setBaid(baid);
            tzb.setMoney(xmoney);
            statusVO=tzbService.add(tzb);
        }


        //投资奖励的发放
        Reward reward=rewardService.findTmoney(userid);
        Timer timer=new Timer();
        Calendar calendar=Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH)+4,calendar.get(Calendar.DAY_OF_MONTH)
                ,calendar.get(Calendar.HOUR_OF_DAY),calendar.get(Calendar.MINUTE),0);//calendar.get(Calendar.SECOND)秒
        JLff jLff=new JLff();
        Reward reward1=new Reward();
        BigDecimal ymoney=null;
        BigDecimal tmoney=null;
        if(reward==null){
            ymoney=BigDecimal.valueOf(0);
            tmoney=ymoney.add(xmoney);
            reward1.setUid(userid);
            reward1.setMoney(jLff.jlj(xmoney));
            reward1.setState((byte) 1);
            reward1.setTmoney(tmoney);
            reward1.setDate(calendar.getTime());
            rewardService.save(reward1);
        }

        if(reward!=null){
            Reward reward3=new Reward();
            reward3.setUid(userid);
            reward3.setState((byte)1);
            reward3.setDate(calendar.getTime());
            rewardService.updateState(reward3);
            ymoney=reward.getTmoney();
            tmoney= ymoney.add(xmoney);
            Reward reward2=new Reward();
            reward2.setUid(userid);
            reward2.setTmoney(tmoney);
            BigDecimal jl=reward.getMoney();
            BigDecimal zjl=jl.add(jLff.jlj(xmoney));
            reward2.setMoney(zjl);
            rewardService.updateTjmoney(reward2);
        }


        timer.schedule(new TimerTask() {
            @Override
            public void run() {

                System.out.println("定时任务启动！");
                Reward reward5=rewardService.findTmoney(userid);
                if(reward5.getState()==1){
                    Reward reward4=new Reward();
                    reward4.setUid(userid);
                    reward4.setState((byte)2);
                    reward4.setDate(calendar.getTime());
                    rewardService.updateState(reward4);

                    UserMoney userMoney=userMoneyService.findJlmoney(userid);
                    BigDecimal xjlmoney=jLff.jlj(xmoney);
                    BigDecimal yjlmoney=null;
                    BigDecimal jlmoney=null;
                    if(userMoney==null){
                        yjlmoney=BigDecimal.valueOf(0);
                        jlmoney=yjlmoney.add(xjlmoney);
                    }

                    if(userMoney!=null){
                        yjlmoney=userMoney.getJlmoney();
                        jlmoney=yjlmoney.add(xjlmoney);
                    }

                    userMoneyService.updateJlmoney(jlmoney,userid);


                    UserMoneyVO userMoneyVO =new UserMoneyVO();
                    userMoneyVO.setUid(String.valueOf(userid));
                    userMoneyVO.setZmoney(jlmoney.add(userMoney.getZmoney()));
                    userMoneyVO.setKymoney(jlmoney.add(userMoney.getKymoney()));
                    userMoneyService.updateZmoney(userMoneyVO);

                }

            }
        },calendar.getTime());

        return statusVO;

    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex,int pageSize, TzbVO tzbVO) {
        logger.info("投资信息+条件查询");
        return tzbService.listPagerCriteria(pageIndex, pageSize, tzbVO);
    }

    @RequestMapping("pageById")
    @ResponseBody
    public Pager pageById(int pageIndex, int pageSize, HttpSession session) {
        logger.info("前台用户查看投资进度");
        Long id=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        return tzbService.listPagerById(pageIndex,pageSize,id);
    }



    @RequestMapping("page")
    public String page(){
        logger.info("管理员查看用户投资情况");
        return "manager/tz";
    }



}
