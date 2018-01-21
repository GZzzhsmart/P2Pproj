package top.zzh.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.HUser;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.HuserService;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Huser")
public class HUserController {

    @Autowired
    private HuserService huserService;


    private Logger logger = LoggerFactory.getLogger(HUserController.class);

    @RequestMapping("logout")
    public String logout(HttpSession session){
        logger.info("安全退出");
        session.invalidate();
        return "manager/login";
    }

    //后台用户中心页面
    @RequestMapping("page")
    @ResponseBody
    public ControllerStatusVO page(String pwd, String phone,HttpSession session){
        ControllerStatusVO statusVO = null;
        HUser hUser = huserService.getByNamePwd(phone, EncryptUtils.md5(pwd));
        Subject subject = SecurityUtils.getSubject();
        if(hUser != null && hUser.getState()==1){
            //标记为后台用户登陆
            session.setAttribute(Constants.ADMIN_LOGIN_SESSION,"后台用户登录");
            subject.login(new UsernamePasswordToken(phone,pwd));
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
            session.setAttribute("HUser",hUser);
        }else{
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_PHONEFAIL);
        }
        return  statusVO;
    }

    @RequestMapping("checkPhone")
    @ResponseBody
    public ControllerStatusVO checkPhone(String phone){
        ControllerStatusVO statusVO=null;
        HUser user=huserService.getByPhone(phone);
        if(user!=null){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_ALREADYEXIST);
        }

        return  statusVO;
    }

    @PostMapping("registerSave")
    @ResponseBody
    public ControllerStatusVO  registerSave(HUser hUser){
        ControllerStatusVO statusVO=null;
        String pwd=EncryptUtils.md5(hUser.getHpwd());
        hUser.setHpwd(pwd);
        huserService.register(hUser);
        statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("index")
    private String index(HttpSession session){
        HUser hUser=(HUser) session.getAttribute("HUser");
        if(hUser==null){
            return "manager/login";
        }else if(hUser!=null){
            return "manager/index";
        }
        return "";

    }
       //后台用户登录页面
    @RequestMapping("login")
    public String login(){
        return "manager/login";
    }

    //后台用户注册页面
    @RequestMapping("register")
    public String register(){
        return "manager/register";
    }

    @RequestMapping("forgerView")
    private String forgerView(){
        return "manager/forgetPwd";
    }

    @RequestMapping("husercheckPhone")
    @ResponseBody
    public ControllerStatusVO husercheckPhone(String phone){
        ControllerStatusVO statusVO=null;
        HUser user=huserService.getByPhone(phone);
        if(user==null){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_EXIST);
        }

        return  statusVO;
    }

    @RequestMapping("huserLogin")
    @ResponseBody
    public ControllerStatusVO huserLogin(String phone,HttpSession session){
        ControllerStatusVO statusVO=null;
        HUser user=huserService.getByPhone(phone);
        if(user==null){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_EXIST_POWER);
        }

        if(user!=null && user.getState()==1){
            session.setAttribute("HUser",user);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);

        }

        return  statusVO;
    }

    @RequestMapping("findMessage")
    public String findMessage(HttpSession session, HttpServletRequest request){
        HUser hUser=(HUser) session.getAttribute("HUser");
        HUser hUser1=(HUser) huserService.getById(hUser.getHuid());
        request.setAttribute("hUser",hUser1);
        return  "manager/findManagerMessage";
    }

    @PostMapping("updateMessage")
    public String updateMessage(HttpSession session,HttpServletRequest request,HUser hUser){
        HUser hUser1=(HUser)session.getAttribute("HUser");
        hUser.setHuid(hUser1.getHuid());
        huserService.update(hUser);
        HUser hUser2=(HUser) huserService.getById(hUser1.getHuid());
        request.setAttribute("hUser",hUser2);
        request.setAttribute("update","恭喜您，修改资料成功！");
        return "manager/findManagerMessage";
    }

    @RequestMapping("updatePwdView")
    public String updatePwdView(){
        return "manager/updateHpwd";
    }

    @PostMapping("updatePwd")
    public String updatePwd(HttpSession session,HttpServletRequest request,String xpwd,String hpwd){
        HUser hUser=(HUser)session.getAttribute("HUser");
        String jpwd=huserService.findPwd(hUser.getHuid());
        String jm=EncryptUtils.md5(hpwd);
        if(!jpwd.equals(jm)){
            request.setAttribute("update","原密码错误，请重新输入！");
            return "manager/updateHpwd";
        }
        if(jpwd.equals(jm)){
            huserService.updatePwd(hUser.getHuid(),EncryptUtils.md5(xpwd));
            request.setAttribute("update","恭喜您，修改密码成功！");
            return "manager/updateHpwd";
        }
        return "";
    }




}
