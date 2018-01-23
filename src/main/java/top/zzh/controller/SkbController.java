package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.LogMoney;
import top.zzh.bean.Skb;
import top.zzh.calculator.ACMLoanCalculator;
import top.zzh.calculator.ACPIMLoanCalculator;
import top.zzh.calculator.LoanByMonth;
import top.zzh.calculator.LoanUtil;
import top.zzh.common.Constants;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.BorrowApply;
import top.zzh.bean.Hkb;
import top.zzh.bean.Skb;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.BorrowDetailService;
import top.zzh.service.LogMoneyService;
import top.zzh.service.SkbService;
import top.zzh.service.UserMoneyService;
import top.zzh.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import top.zzh.vo.HkbVO;
import top.zzh.vo.SkbVO;


import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 曾志湖 on 2018/1/3.
 * 收款表
 */
@Controller
@RequestMapping("/sk")
public class SkbController {

    private Logger logger = LoggerFactory.getLogger(SkbController.class);
    @Autowired
    private SkbService skbService;

    @Autowired
    private BorrowDetailService borrowDetailService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private LogMoneyService logMoneyService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize, SkbVO skbVO) {
        logger.info("收款基本信息分页+条件查询");
        return skbService.listPagerCriteria(pageIndex, pageSize, skbVO);
    }




    @RequestMapping("skDetail/{uid}/{juid}/{baid}/{money}")
    public String skDetail(HttpServletRequest request,@PathVariable("uid")Long uid, @PathVariable("juid")Long juid,
                           @PathVariable("baid")Long baid, @PathVariable("money")BigDecimal money){


        BorrowDetailVO borrowDetailVO=borrowDetailService.findWay(uid, juid,baid);

        //收款期数
        Integer term = borrowDetailVO.getTerm();

        Float nprofit = (Float)borrowDetailVO.getNprofit().floatValue();
        //月利率
        Float monthNpro = nprofit / 12;

        BigDecimal syMoney = BigDecimal.valueOf(0);

        BigDecimal sqmoney=borrowDetailVO.getMoney();
        BigDecimal tzmoney=borrowDetailVO.getMmoney();
        if(sqmoney.compareTo(tzmoney)==0){

            Skb skb2=skbService.findSkb(uid, juid);

            if(skb2==null){

                if (borrowDetailVO.getWay().equals("一次性还本付息")) {
                    Skb skb = new Skb();
                    skb.setUid(uid);
                    skb.setJuid(juid);
                    skb.setYbj(money);
                    skb.setDjq(term);
                    skb.setState(1);
                    skb.setTnum(term);

                    syMoney = money.multiply(BigDecimal.valueOf(monthNpro / 100)).multiply(new BigDecimal(term)).setScale(2, BigDecimal.ROUND_HALF_UP);

                    skb.setYlx(syMoney);
                    skb.setYbx(syMoney.add(money));
                    skb.setBaid(baid);
                    skbService.save(skb);

                } else {
                    List<Skb> hkbList = new ArrayList<>();
                    for (int i = 1; i <= term; i++) {
                        Skb skb = new Skb();
                        skb.setUid(uid);
                        skb.setJuid(juid);
                        skb.setState(1);
                        skb.setTnum(term);
                        skb.setDjq(i);

                        Float np2= nprofit / 100;
                        Float monthNpro2 = np2 / 12;

                        //每月利息金额
                        BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro2);
                        //先息后本收款表
                        if (borrowDetailVO.getWay().equals("先息后本")) {
                            //每月利息等于总借款乘以月利率
                            skb.setYlx(money.multiply(bigMonthNpro));

                            skb.setYbj(BigDecimal.valueOf(0));
                            //最后一个月还本金加利息
                            if (i == term) {
                                //应还本金
                                skb.setYbj(money);
                            }

                        }
                        // 等额本金收款算法
                        else if (borrowDetailVO.getWay().equals("等额本金")) {
                            LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(money, term, nprofit, LoanUtil.RATE_TYPE_YEAR).getAllLoans().get(i - 1);
                            // 月还本金
                            skb.setYbj(loanByMonth.getPayPrincipal());
                            // 月利息
                            skb.setYlx(loanByMonth.getInterest());

                        }
                        // 等额本息还款算法
                        else if (borrowDetailVO.getWay().equals("等额本息")) {

                            LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(money, term, nprofit, LoanUtil.RATE_TYPE_YEAR).getAllLoans().get(i - 1);
                            //每月利息
                            skb.setYlx(loanByMonth.getInterest());
                            //每月还款本金
                            skb.setYbj(loanByMonth.getPayPrincipal());

                        }
                        skb.setYbx(skb.getYlx().add(skb.getYbj()));

                        skb.setBaid(baid);
                        hkbList.add(skb);
                    }
                    skbService.saveSkb(hkbList);
                }

            }

        }

        request.setAttribute("juid",juid);

        return "user/shoukuanDetail";
    }

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize, Long juid,HttpSession session) {
        Long userid = (Long)session.getAttribute(Constants.USER_ID_SESSION);
        return skbService.listPager(pageIndex,pageSize,juid,userid);
    }


    @RequestMapping("querenShoukuan/{ybx}/{ylx}/{ybj}/{djq}/{juid}/{baid}/{state}")
    @ResponseBody
    public ControllerStatusVO querenShoukuan(HttpSession session,@PathVariable("ybx") BigDecimal ybx,@PathVariable("ylx") BigDecimal ylx,
    @PathVariable("ybj") BigDecimal ybj,@PathVariable("djq") Integer djq,@PathVariable("juid") Long juid,@PathVariable("baid") Long baid,@PathVariable("state") Integer state){
        ControllerStatusVO statusVO = null;
        if(state==1){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SK_State_FAIL);
            return statusVO;
        }
        if(state==2){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.SK_Money_FAIL);
            return statusVO;
        }

        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);

        //收款表
        SkbUpdate skbUpdate=new SkbUpdate();
        skbUpdate.setUid(uid);
        skbUpdate.setJuid(juid);
        skbUpdate.setBaid(baid);
        skbUpdate.setDjq(djq);
        skbUpdate.setRbx(ybx);
        skbUpdate.setRlx(ylx);
        skbUpdate.setRbj(ybj);
        skbUpdate.setRnum(djq);
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(date);
        skbUpdate.setDate(time);
        skbUpdate.setState(2);
        skbService.updateDsk(skbUpdate);


        UserMoneyVO userMoneyVO=userMoneyService.getByUid(uid);
        UserMoneyVO userMoneyVO1=new UserMoneyVO();
        userMoneyVO1.setUid(String.valueOf(uid));
        userMoneyVO1.setZmoney(userMoneyVO.getZmoney().add(ybx));
        userMoneyVO1.setKymoney(userMoneyVO.getKymoney().add(ybx));
        userMoneyVO1.setSymoney(userMoneyVO.getSymoney().add(ybx));
        userMoneyService.updateZmoney(userMoneyVO1);

        LogMoney logMoney = new LogMoney();
        logMoney.setType((byte) 2);
        logMoney.setIn(ybx);
        logMoney.setOut(new BigDecimal(0));
        logMoney.setUid(uid);
        logMoneyService.save(logMoney);

        statusVO = ControllerStatusVO.status(ControllerStatusEnum.SK_Money_SUCCESS);
        return statusVO;
    }


    @RequestMapping("refurbish/{juid}")
    public  String refurbish(HttpServletRequest request,@PathVariable("juid") Long juid){
        request.setAttribute("juid",juid);
        return "user/shoukuanDetail";
    }


    @RequestMapping("skDetail/{juid}")
    public ModelAndView soukuan(HttpSession session, Integer pageNo, SkbVO skb, @PathVariable("juid") Long juid) {
        logger.info("后台管理员查看收款详情");
        skb.setJuid(juid);
        if(pageNo==0){
            pageNo = 1;
        }
        Pager obj = skbService.find(pageNo,15,skb);
        List<SkbVO> skbVOList = new ArrayList<>();
        for(Object o:obj.getRows()){
            SkbVO skbVO = (SkbVO) o;
            skbVOList.add(skbVO);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manager/skdetail");
        modelAndView.addObject("obj",skbVOList);
        modelAndView.addObject("page",obj);
        return modelAndView;
    }

}
