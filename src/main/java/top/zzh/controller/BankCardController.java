package top.zzh.controller;

import com.alibaba.fastjson.JSON;
import com.sun.deploy.net.HttpUtils;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.BankCard;
import top.zzh.bean.User;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.common.Pager;
import top.zzh.enums.BankUtils;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.BankCardService;
import top.zzh.service.BankService;
import top.zzh.service.UserService;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpSession;

/**
 * Created by 曾志湖 on 2017/12/24.
 */
@Controller
@RequestMapping("/bankcard")
public class BankCardController {

    private Logger logger = LoggerFactory.getLogger(BankCardController.class);

    @Autowired
    private BankCardService bankCardService;

    @Autowired
    private UserService userService;

    @Autowired
    private BankService bankService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, BankCard bankCard) {
        logger.info("绑卡信息分页+条件查询");
        return bankCardService.listPagerCriteria(page, rows, bankCard);
    }

    @RequestMapping("save")
    @ResponseBody
    public JSONObject save(BankCard bankCard, String pwd, HttpSession session){
        logger.info("绑定银行卡");
        Long uid=(Long) session.getAttribute(Constants.USER_ID_SESSION);
        User user =(User)session.getAttribute("users");
        String bank=bankService.getBankName(bankCard.getType());//银行
        String params="realName="+user.getRname()+"&bank="+bank+"&bankCardNo="+bankCard.getCardno()+"&phone="+user.getPhone();
        JSONObject jsonObject=BankUtils.jsonObject("http://localhost:8081/bank/bind",params);
        ControllerStatusVO statusVO = null;
        Long lo=(Long)bankCardService.countDank(uid);
        if (lo==1){//已经绑定银行卡
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_BANK_FAIL);
            JSONObject.fromObject(statusVO);
            return JSONObject.fromObject(statusVO);
        }


        if(user.getRname()==null || user.getIdno()==null){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_KEREN_ERROR);
            JSONObject.fromObject(statusVO);
            return JSONObject.fromObject(statusVO);
        }
        bankCard.setUid(uid);
        bankCard.setRname(user.getRname());
        bankCard.setIdno(user.getIdno());
        bankCard.setState((byte)0);
        try{
            if(jsonObject.getString("code").equals("1000")) {
                bankCardService.save(bankCard);
                System.out.println(pwd);
                userService.updatepwd(uid, EncryptUtils.md5(pwd));//支付密码
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_BANK_SUCCESS);
            }else {
                return jsonObject;
            }
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_ERROR_FAIL);
        }
        JSONObject.fromObject(statusVO);
        return JSONObject.fromObject(statusVO);
    }

    @RequestMapping("remove")
    @ResponseBody
    public JSONObject remove(HttpSession session){
        logger.info("删除绑定的银行卡");
        ControllerStatusVO statusVO = null;
        Long uid=(Long) session.getAttribute(Constants.USER_ID_SESSION);
        User user =(User)session.getAttribute("users");
        String cardno =(String)bankCardService.getDank(uid);//银行卡号
        String type =bankCardService.getType(uid);//所属银行
        String bank=bankService.getBankName(type);//银行
        String params="realName="+user.getRname()+"&bank="+bank+"&bankCardNo="+cardno+"&phone="+user.getPhone();
        JSONObject jsonObject=BankUtils.jsonObject("http://localhost:8081/bank/unbind",params);
        System.out.println(jsonObject);
        try{
            if(jsonObject.getString("code").equals("2000")) {
                bankCardService.removeById(uid);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_JCDIN_SUCCESS);
            }else {
                return jsonObject;
            }
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_JCDIN_ERROR);
        }
        JSONObject.fromObject(statusVO);
        return JSONObject.fromObject(statusVO);
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(BankCard bankCard){
        logger.info("修改绑定的银行卡");
        ControllerStatusVO statusVO = null;
        try{
            bankCardService.update(bankCard);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_UPDATE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("updateState")
    @ResponseBody
    public ControllerStatusVO updateState(BankCard bankCard){
        logger.info("修改绑定的银行卡的状态");
        ControllerStatusVO statusVO = null;
        try{
            bankCardService.updateState(bankCard);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_ACTIVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_ACTIVE_SUCCESS);
        return statusVO;
    }
}
