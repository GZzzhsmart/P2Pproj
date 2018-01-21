package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.Hkb;
import top.zzh.bean.LogMoney;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.common.Pager;
import top.zzh.query.HkbQuery;
import top.zzh.service.*;
import top.zzh.vo.HkbVO;
import top.zzh.vo.SkbUpdate;
import top.zzh.vo.UserMoneyVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 曾志湖 on 2018/1/3.
 * 还款表
 */
@Controller
@RequestMapping("/hk")
public class HkbController {

    private Logger logger = LoggerFactory.getLogger(HkbController.class);

    @Autowired
    private HkbService hkbService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private LogMoneyService logMoneyService;

    @Autowired
    private SkbService skbService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize, HkbVO hkbVO) {
        logger.info("后台查看用户还款基本信息分页+条件查询");
        return hkbService.listPagerCriteria(pageIndex, pageSize, hkbVO);
    }



    @RequestMapping("hk_page")
    public String hkbPage() {
        return "manager/hkb";
    }

    @RequestMapping("hkDetail/{uid}")
    public ModelAndView touzi(HttpSession session, Integer pageNo, Hkb hkb,@PathVariable("uid") Long uid) {
        logger.info("后台管理员查看用户还款详情");
        hkb.setUid(uid);
        if(pageNo==0){
            pageNo = 1;
        }
        Pager obj = hkbService.find(pageNo,5,hkb);
        List<HkbVO> hkbVOList = new ArrayList<>();
        for(Object o:obj.getRows()){
            HkbVO hkbVO = (HkbVO) o;
            hkbVOList.add(hkbVO);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manager/hkdetail");
        modelAndView.addObject("obj",hkbVOList);
        modelAndView.addObject("page",obj);
        return modelAndView;

    }


    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize, Long uid) {

        return hkbService.listPager(pageIndex,pageSize,uid);
    }


    @PostMapping("huanmoney")
    public String huanmioney(String password,HttpServletRequest request, HkbQuery hkbQuery, HttpSession session){

        String name=(String)session.getAttribute(Constants.USER_IN_SESSION);
        Long uid=hkbQuery.getRows().getUid();

        if(hkbQuery.getRows().getState()==1){
            request.setAttribute("uid",uid);
            request.setAttribute("check","state");
            return "user/huikuan";
        }

        String zpwd=userService.getByZpwd(name);
        String xpwd= EncryptUtils.md5(password);
        //判断支付密码是否正确
        if(!zpwd.equals(xpwd)){
            request.setAttribute("check","pwd");
            request.setAttribute("uid",uid);
            return "user/huikuan";
        }

        UserMoneyVO userMoneyVO=userMoneyService.getByUid(uid);

        BigDecimal rl=hkbQuery.getRows().getYlx();
        BigDecimal rb=hkbQuery.getRows().getYbj();
        BigDecimal jg=rl.add(rb);

        if(userMoneyVO.getKymoney().compareTo(jg)==-1){
            request.setAttribute("check","money");
            request.setAttribute("uid",uid);
            return  "user/huikuan";
        }

        UserMoneyVO userMoneyVO1=new UserMoneyVO();
        userMoneyVO1.setUid(String.valueOf(uid));
        userMoneyVO1.setZmoney(userMoneyVO.getZmoney().subtract(jg));
        userMoneyVO1.setKymoney(userMoneyVO.getKymoney().subtract(jg));
        userMoneyService.updateZmoney(userMoneyVO1);


        HkbQuery hkbQuery1=new HkbQuery();
        hkbQuery1.setRnum(hkbQuery.getRows().getDjq());
        hkbQuery1.setRbx(hkbQuery.getRows().getYbx());
        hkbQuery1.setRlx(hkbQuery.getRows().getYlx());
        hkbQuery1.setRbj(hkbQuery.getRows().getYbj());
        hkbQuery1.setState((byte)1);
        hkbQuery1.setHkid(hkbQuery.getRows().getHkid());

        hkbService.updateHmoney(hkbQuery1);


        SkbUpdate skbUpdate=new SkbUpdate();
        skbUpdate.setJuid(uid);
        skbUpdate.setBaid(hkbQuery.getRows().getBaid());
        skbUpdate.setDjq(hkbQuery.getRows().getDjq());
        skbUpdate.setState(3);
        skbService.updateSk(skbUpdate);


        //新增流水记录
        LogMoney logMoney = new LogMoney();
        logMoney.setType((byte) 5);
        logMoney.setIn(new BigDecimal(0));
        logMoney.setOut(jg);
        logMoney.setUid(uid);
        logMoneyService.save(logMoney);

        request.setAttribute("uid",uid);
        request.setAttribute("check","success");

        return "user/huikuan";
    }


}
