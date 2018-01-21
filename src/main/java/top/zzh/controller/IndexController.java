package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.Friend;
import top.zzh.bean.Notice;
import top.zzh.common.Pager;
import top.zzh.service.*;
import top.zzh.vo.BorrowDetailVO;
import top.zzh.vo.YdateVo;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 首页控制器
 */
@Controller
@RequestMapping("/")
public class IndexController {



    @Autowired
    private FriendService friendService;

    @Autowired
    private UserService userService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private BorrowApplyService borrowApplyService;

    @Autowired
    private HomeService homeService;

    @Autowired
    private MediaService mediaService;

    @Autowired
    private DynamicService dynamicService;

    @Autowired
    private TzbService tzbService;

    @Autowired
    private YdateService ydateService;

    @RequestMapping("")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //首页显示投资列表
        List<BorrowDetailVO> borrow1 = (List)borrowApplyService.souye1();
        List<BorrowDetailVO> borrow2 = (List)borrowApplyService.souye2();
        List<BorrowDetailVO> borrow3 = (List)borrowApplyService.souye3();
        List<BorrowDetailVO> borrow4 = (List)borrowApplyService.souye4();
        //首页统计用户人数
        Long user = (Long)userService.count();
        //首页统计贷款人数
        Long tz = (Long)tzbService.count();
        //首页统计投资总额和月投资总额
        YdateVo list1 = ydateService.getByMaxDate();
        List<Friend> friendList = new ArrayList<Friend>();
        friendList = friendService.listFriend();
        List<Object> homeList = new ArrayList<>();
        homeList = homeService.listAll();
        List<Object> noticeList = new ArrayList<>();
        int pageIndex = 0;
        int pageSize = 5;
        //首页显示网站公告信息
        Pager noticePager = noticeService.listPager(1,5);
        for(Object o:noticePager.getRows()){
            Notice notice =(Notice)o;
            noticeList.add(notice);
        }

        Pager mediaPager = mediaService.listPager(1,5);
        Pager dynamicPager = dynamicService.listPager(1,5);
        modelAndView.addObject("user",user);
        modelAndView.addObject("tz",tz);
        modelAndView.addObject("list1",list1);
        modelAndView.addObject("noticeList",noticeList);
        modelAndView.addObject("friendList",friendList);
        modelAndView.addObject("homeList",homeList);
        modelAndView.addObject("mediaPager",mediaPager);
        modelAndView.addObject("dynamicPager",dynamicPager);
        modelAndView.addObject("borrow1",borrow1);
        modelAndView.addObject("borrow2",borrow2);
        modelAndView.addObject("borrow3",borrow3);
        modelAndView.addObject("borrow4",borrow4);
        modelAndView.addObject("noticeList",noticeList);

        modelAndView.addObject("friendList",friendList);
        modelAndView.setViewName("index");
        return modelAndView;
    }

}
