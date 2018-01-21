package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.*;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.service.*;
import top.zzh.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/page")
public class PageController {

    private Logger logger = LoggerFactory.getLogger(PageController.class);
    @Autowired
    private LoginLogService loginLogService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private LogMoneyService logMoneyService;

    @Autowired
    private BorrowApplyService borrowApplyService;

    @Autowired
    private BorrowDetailService borrowDetailService;

    @Autowired
    private BzService bzService;

    @Autowired
    private TzbService tzbService;

    @Autowired
    private  BankCardService bankCardService;

    @Autowired
    private  BankService bankService;

    @Autowired
    private  UserTicketService userTicketService;

    @Autowired
    private NoticeService noticeService;

    @Autowired MediaService mediaService;

    @Autowired DynamicService dynamicService;

    @Autowired
    private YdateService ydateService;

    //前台投资理财计算器
    @RequestMapping("cal")
    public String cal() {
        return "common/calculator";
    }

    @RequestMapping("welcome")
    public String welcome() {
        return "manager/welcome";
    }

    //管理员主界面
    @RequestMapping("managerindex")
    public String managerindex() {
        return "manager/welcome";
    }

    @RequestMapping("users")
    public String users() {
        return "manager/borrowapply";
    }

    @RequestMapping("user")
    public String user(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Constants.USER_IN_SESSION) == null || session.getAttribute(Constants.USER_IN_SESSION) == "") {
            return "user/nopower";
        } else {
            Long uid = (Long) session.getAttribute(Constants.USER_ID_SESSION);
            String name = (String) session.getAttribute(Constants.USER_IN_SESSION);
            String time = loginLogService.getByloginTime(name);
            User user = userService.getByface(name);
            UserMoneyVO userMoneyVO = (UserMoneyVO)userMoneyService.listMoney(uid);
            request.setAttribute("userMoneyVO",userMoneyVO);
            request.setAttribute("time", time);
            request.setAttribute("face", user.getFace());
            return "user/userindex";
        }
    }

    @RequestMapping("chongzhi")
    public String chongzhi(HttpSession session) {
        Long id =(Long)session.getAttribute(Constants.USER_ID_SESSION);
        User user=(User)userService.getById(id);
        session.setAttribute("users",user);
        String cardno =(String)bankCardService.getDank(id);//银行卡号
        session.setAttribute("cardno",cardno);
        String type =bankCardService.getType(id);//所属银行
        String deposit=bankService.getDeposit(type);//银行商标
        session.setAttribute("deposit",deposit);
        return "user/chongzhi";
    }

    @RequestMapping("disanfang")
    public String disanfang(HttpSession session) {
        Long id =(Long)session.getAttribute(Constants.USER_ID_SESSION);
        User user=(User)userService.getById(id);
        session.setAttribute("users",user);
        String cardno =(String)bankCardService.getDank(id);//银行卡号
        session.setAttribute("cardno",cardno);
        String type =bankCardService.getType(id);//所属银行
        String deposit=bankService.getDeposit(type);//银行商标
        session.setAttribute("deposit",deposit);
        return "user/disanfang";
    }

    @RequestMapping("gu")
    public String guod(HttpSession session) {
        Long id =(Long)session.getAttribute(Constants.USER_ID_SESSION);
        User user=(User)userService.getById(id);
        session.setAttribute("users",user);
        String cardno =(String)bankCardService.getDank(id);//银行卡号
        session.setAttribute("cardno",cardno);
        String type =bankCardService.getType(id);//所属银行
        String deposit=bankService.getDeposit(type);//银行商标
        session.setAttribute("deposit",deposit);
        return "user/guodu";
    }


    @RequestMapping("guodu")
    public String guodu(HttpSession session) {

        return "user/guodu";
    }


    @RequestMapping("history")
    public String history() {
        return "user/history";
    }

    @RequestMapping("hongbao")
    public ModelAndView hongbao(HttpSession session) {
        userTicketService.updateEGold();//更新体验券使用状态，本应该在quize定时任务中使用，暂时放在这里看效果
        List<UserTicketVo> unuseList=userTicketService.unuse((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        List<UserTicketVo> usedList=userTicketService.used((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        List<UserTicketVo> overList=userTicketService.overed((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        Integer unuseCount=userTicketService.unuseCount((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        Integer usedCount=userTicketService.usedCount((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        Integer overCount=userTicketService.overedCount((Long)(session.getAttribute(Constants.USER_ID_SESSION)));
        ModelAndView mv=new ModelAndView();
        mv.addObject("unuseList",unuseList);
        mv.addObject("usedList",usedList);
        mv.addObject("overList",overList);
        mv.addObject("unuseCount",unuseCount);
        mv.addObject("usedCount",usedCount);
        mv.addObject("overCount",overCount);
        mv.setViewName("/user/hongbao");
        return mv;
    }

    @RequestMapping("hong/{kid}")
    public ModelAndView hong(@PathVariable("kid") Long kid, HttpSession session){
        logger.info("红包现金劵转入余额");
        ModelAndView modelAndView = new ModelAndView();
        Long uid = (Long)session.getAttribute(Constants.USER_ID_SESSION);
        UserMoneyVO userMoneyVO = userMoneyService.getByUid(uid);
        UserTicketVo userTicketVo=userTicketService.list(uid);
        //可用余额和总金额增加
        userMoneyVO.setKymoney(userMoneyVO.getKymoney().add(userTicketVo.getTkmoney()));
        userMoneyVO.setZmoney(userMoneyVO.getZmoney().add(userTicketVo.getTkmoney()));
        //改变资金流水记录
        LogMoney logMoney = new LogMoney();
        logMoney.setType((byte)6);
        logMoney.setIn(userTicketVo.getTkmoney());
        logMoney.setOut(BigDecimal.valueOf(0));
        logMoney.setUid(uid);
        userMoneyService.updateKymoney(userMoneyVO);
        userTicketService.updateState(userTicketVo);
        logMoneyService.save(logMoney);
        modelAndView.setViewName("user/userindex");
        return modelAndView;
    }

    //前台用户反馈
    @RequestMapping("feedBackAdd")
    public String feedBackAdd(){
        return "user/feedBackAdd";
    }

    //前台关于我们里的运营数据页面
    @RequestMapping("rundata")
    public ModelAndView rundata(){
        List<YdateVo> ydateList=ydateService.selectIdAndDate();
        YdateVo nowYdate=ydateService.getByMaxDate();
        ModelAndView mv=new ModelAndView();
        mv.addObject("nowYdate",nowYdate);
        mv.addObject("ydateList",ydateList);
        mv.setViewName("index/rundata");
        return mv;
    }
    @RequestMapping("huikuan")
    public String huikuan(HttpSession session,HttpServletRequest request) {
        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        request.setAttribute("uid",uid);
        return "user/huikuan";
    }

    @RequestMapping("login")
    public String login() {
        return "user/login";
    }

    //推荐链接注册
    @RequestMapping("register?userCode={userCode}")
    public String recommendReg() {
        return "user/register";
    }

    @RequestMapping("register")
    public String register() {
        return "user/register";
    }

    @RequestMapping("registerSuccess")
    public String registerSuccess() {
        return "user/registerSuccess";
    }

    @RequestMapping("tixian")
    public String tixian(HttpSession session) {
        Long id = (Long) session.getAttribute(Constants.USER_ID_SESSION);
        //用户当前可用余额
        Long bigDecimal = userMoneyService.getMoney(id.toString());
        String cardno =(String)bankCardService.getDank(id);//银行卡号
        session.setAttribute("kymoney",bigDecimal);
        session.setAttribute("cardno",cardno);
        return "user/tixian";
    }


    @RequestMapping("xitong")
    public String xitong() {
        return "user/xitong";
    }

    @RequestMapping("zhanghu")
    public String zhanghu() {
        return "user/zhanghu";
    }

    @RequestMapping("zijin")
    public ModelAndView zijin(HttpSession session,int pageNo, LogMoney logMoney) {
        long uid=(long)session.getAttribute(Constants.USER_ID_SESSION);
        logMoney.setUid(uid);
        if (pageNo==0){
            pageNo=1;
        }
        Pager obj=(Pager)logMoneyService.listPagerUid(pageNo, 5, logMoney);
        List<LogMoneydate> logMoneyList=new ArrayList<>();
        for(Object o:obj.getRows()){
            LogMoneydate logMoney1 =(LogMoneydate)o;
            logMoneyList.add(logMoney1);
        }
        ModelAndView m=new ModelAndView();
        m.setViewName("user/zijin");
        m.addObject("obj",logMoneyList);
        m.addObject("page",obj);
        return m;
    }

    @RequestMapping("touzi")
    public ModelAndView touzi(HttpSession session,int pageNo,Tzb tzb) {
        Long uid = (Long) session.getAttribute(Constants.USER_ID_SESSION);
        tzb.setUid(uid);
        if(pageNo==0){
            pageNo = 1;
        }
        Pager obj = (Pager)tzbService.listPagerByUId(pageNo,5,tzb);
        List<TzbVO> tzbVOList = new ArrayList <>();
        for(Object o:obj.getRows()){
            TzbVO tzbVO = (TzbVO)o;
            tzbVOList.add(tzbVO);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user/touzi");
        modelAndView.addObject("obj",tzbVOList);
        modelAndView.addObject("page",obj);
        return modelAndView;
    }

    @RequestMapping("about")
    public String about() {
        return "index/about";
    }

    @RequestMapping("ad/{pageNo}")
    public String ad(HttpServletRequest request,@PathVariable("pageNo") int pageNo) {
        List<Object> noticeList = new ArrayList<>();
        if (pageNo==0){
            pageNo=1;
        }
        Pager noticePager = noticeService.listPager(pageNo,5);
        for(Object o:noticePager.getRows()){
            Notice notice =(Notice)o;
            noticeList.add(notice);
        }
        request.setAttribute("noticeList",noticeList);
        request.setAttribute("noticePager",noticePager);

        return "index/ad";
    }

    @RequestMapping("ad1")
    public String ad1() {
        return "index/ad1";
    }

    @RequestMapping("contract")
    public String contract() {
        return "index/contract";
    }

    @RequestMapping("fl1")
    public String f1() {
        return "index/fl1";
    }

    @RequestMapping("fl2")
    public String f2() {
        return "index/fl2";
    }

    @RequestMapping("help")
    public String help() {
        return "index/help";
    }

    @RequestMapping("hezuo")
    public String hezuo() {
        return "index/hezuo";
    }

    @RequestMapping("info/{baid}")
    public ModelAndView info(HttpSession session, HttpServletRequest request, @PathVariable("baid") Long baid) {
        logger.info("首页查看投标详情");
        ModelAndView modelAndView = new ModelAndView();
        BorrowDetailVO borrow = borrowDetailService.findDetails(baid);
        List<TzbVO> tzbVOList = (List)tzbService.listAll();
        Long userid = (Long) session.getAttribute(Constants.USER_ID_SESSION);
        UserVO users = (UserVO) userService.getByUid(userid);
        modelAndView.addObject("borrow",borrow);
        modelAndView.addObject("tzbVOList",tzbVOList);
        modelAndView.addObject("users",users);
        modelAndView.setViewName("index/info");
        return modelAndView;
    }


    @RequestMapping("list")
    public ModelAndView list(Integer term,String cpname,Float nprofit,Integer pageNo,Long kid) {
        logger.info("前台投资列表搜索+分页功能");
        BorrowDetailVO borrow =new BorrowDetailVO();
        borrow.setTerm(term);
        borrow.setCpname(cpname);
        borrow.setNprofit(nprofit);
        if(pageNo==0){
            pageNo = 1;
        }
        Pager obj = borrowApplyService.listPagerByUId(pageNo,5,borrow);
        List<BorrowDetailVO> borrowDetailVOList = new ArrayList <>();
        List<Bz> bzList = (List)bzService.listAll();
        for(Object o:obj.getRows()){
            BorrowDetailVO borrowDetailVO = (BorrowDetailVO) o;
            borrowDetailVOList.add(borrowDetailVO);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index/list");
        modelAndView.addObject("obj",borrowDetailVOList);
        modelAndView.addObject("page",obj);
        modelAndView.addObject("bzList",bzList);
        modelAndView.addObject("term",term);
        modelAndView.addObject("cpname",cpname);
        modelAndView.addObject("nprofit",nprofit);
        if(kid!=null){
            modelAndView.addObject("kid",kid);
        }
        return modelAndView;
    }

    @RequestMapping("managerTuandui")
    public String managerTuandui() {
        return "index/managerTuandui";
    }

    @RequestMapping("notice")
    public String notice() {
        return "index/notice";
    }

    @RequestMapping("report/{pageNo}")
    public String report(HttpServletRequest request,@PathVariable("pageNo")int pageNo) {
        if(pageNo == 1){
           pageNo = 1;
        }
        Pager mediaPager = mediaService.listPager(pageNo,5);
        request.setAttribute("mediaPager",mediaPager);
        return "index/report";
    }

    @RequestMapping("dynamic/{pageNo}")
    public String dynamic(HttpServletRequest request,@PathVariable("pageNo")int pageNo){
        if(pageNo == 0){
            pageNo = 1;
        }
        Pager dynamicPager = dynamicService.listPager(pageNo,5);
        request.setAttribute("dynamicPager",dynamicPager);
        return "index/dynamic";
    }

    @RequestMapping("tuandui")
    public String tuandui() {
        return "index/tuandui";
    }

    @RequestMapping("zhaopin")
    public String zhaopin() {
        return "index/zhaopin";
    }

    @RequestMapping("zifei")
    public String zifei() {
        return "index/zifei";
    }
}
