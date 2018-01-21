package top.zzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.zzh.bean.HUser;
import top.zzh.bean.RzVip;
import top.zzh.bean.RzVipCheck;
import top.zzh.bean.User;
import top.zzh.common.Constants;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.query.RzvipDetails;
import top.zzh.query.RzvipQuery;
import top.zzh.service.RzVipService;
import top.zzh.service.RzvipcheckService;
import top.zzh.service.UserService;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/28 0028.
 */
@Controller
@RequestMapping("/rzvip")
public class RzvipController {

    @Autowired
    private UserService userService;

    @Autowired
    private RzVipService rzVipService;

    @Autowired
    private RzvipcheckService rzvipcheckService;



    @GetMapping("rzvipaddView")
    public String rzvipaddView(HttpSession session,HttpServletRequest request){
        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);

        RzVip rzVip= (RzVip) rzVipService.getById(uid);
        RzVipCheck rzVipCheck=rzvipcheckService.shResult(uid);

        if(rzVip==null || rzVipCheck==null){
            return "/user/rzvipAdd";
        }
        if(rzVipCheck.getHuid()!=null){
            request.setAttribute("rzVipCheck",rzVipCheck);
            return  "user/shResult";
        }
        if(rzVip.getUid()!=null){
            request.setAttribute("rzVip",rzVip);
            return "/user/rzvipUpdate";
        }

        return  "";
    }

    @GetMapping("rzvipaddView2")
    public String rzvipaddView2(){
        return  "/user/rzvipAdd";
    }

    @GetMapping("findMesage")
    public String findMesage(HttpSession session,HttpServletRequest request){
        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        RzVip rzVip= (RzVip) rzVipService.getById(uid);
        request.setAttribute("rzVip",rzVip);
        return  "/user/rzvipUpdate";
    }




    @PostMapping("rzvipSave")
    public String rzvipSave(HttpSession session, RzVip rzVip, HttpServletRequest request){

        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        rzVip.setUid(uid);
        rzVipService.save(rzVip);
        RzVipCheck rzVipCheck=new RzVipCheck();
        rzVipCheck.setUid(uid);
        rzVipCheck.setIsok((byte) 1);
        rzvipcheckService.add(rzVipCheck);
        request.setAttribute("rzVip",rzVip);

        return  "/user/rzvipUpdate";
    }

    @PostMapping("update")
    public String update(HttpSession session, RzVip rzVip, HttpServletRequest request){
        Long uid=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        rzVip.setUid(uid);
        rzVipService.update(rzVip);
        request.setAttribute("rzVip",rzVip);
        request.setAttribute("exist","恭喜你，修改成功！");
        return "/user/rzvipUpdate";
    }

    @RequestMapping("pager")
    @ResponseBody
    public Pager pager(int pageIndex, int pageSize, RzvipQuery rzvipQuery) {

        return rzVipService.listPagerCriteria(pageIndex,pageSize,rzvipQuery);
    }

    @RequestMapping("rzvipList")
    public String rzvipList() {
        return "manager/RzvipList";
    }


    @RequestMapping("detailView")
    public  String detailView(HttpServletRequest request, String row){

        String uid=null;
        if(row.contains(",")){
            String rowstring[]= row.split(",");
            for(int i=0;i<rowstring.length;i++){

               uid=rowstring[i];
            }
            RzvipDetails rzvipDetails=rzVipService.findDetails(Long.valueOf(uid));
            request.setAttribute("rzvipDetails",rzvipDetails);
            return "manager/findDetails";

        }

        RzvipDetails rzvipDetails=rzVipService.findDetails(Long.valueOf(row));
        request.setAttribute("rzvipDetails",rzvipDetails);
        return "manager/findDetails";
    }


    @PostMapping("examineAndverify")
    public String examineAndverify(HttpSession session,RzVipCheck rzVipCheck){
        HUser huser=(HUser) session.getAttribute("HUser");
        rzVipCheck.setUid(rzVipCheck.getRows().getUid());
        rzVipCheck.setHuid(huser.getHuid());
        rzvipcheckService.examineAndverify(rzVipCheck);

        return "manager/RzvipList";
    }


}
