package top.zzh.controller;


import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.LogMoney;
import top.zzh.bean.User;
import top.zzh.bean.UserMoney;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.common.Pager;
import top.zzh.enums.BankUtils;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.*;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.UserMoneyVO;

import javax.servlet.http.HttpSession;

/**
 * Cander 陈桢 2017/12/28
 */
@RequestMapping("/userMoney")
@Controller
public class UserMoneyController {

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private LogMoneyService logMoneyService;

    @Autowired
    private BankCardService bankCardService;

    private ControllerStatusVO statusVO;

    @Autowired
    private BankService bankService;

    @Autowired
    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(LogMoneyController.class);

    @PostMapping("save")
    @ResponseBody
    public ControllerStatusVO save(UserMoney userMoney){
        logger.info("新增提现记录！");
        try {
            userMoneyService.save(userMoney);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL);
        }
        return statusVO;
    }

    @PostMapping("chongzhi/{pass}")
    @ResponseBody
    public JSONObject chongzhi(HttpSession session, UserMoney userMoney, @PathVariable("pass")String pass){
        logger.info("充值！");

        //获取用户Id
        Long id=(Long)session.getAttribute(Constants.USER_ID_SESSION);
        System.out.println("ID:"+id);
        User user=(User)userService.getById(id);
        String cardao=bankCardService.getDank(id);
        String p =user.getZpwd().toString();
        String pa=EncryptUtils.md5(pass);
        String c=userMoney.getZmoney().toString();
        if (!p.equals(pa)){//密码错误
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.UERS_ERROR_ERROR);
            JSONObject.fromObject(statusVO);
            return JSONObject.fromObject(statusVO);
        }else if(!c.equals(cardao)){//银行卡错误
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.UERS_BANK_ERROR);
            JSONObject.fromObject(statusVO);
            return JSONObject.fromObject(statusVO);
        }
        try {
            String cardno =(String)bankCardService.getDank(id);//银行卡号
            String type =bankCardService.getType(id);//所属银行
            String bank=bankService.getBankName(type);//银行
            String params="realName="+user.getRname()+"&bank="+bank+"&bankCardNo="+cardno+"&phone="+user.getPhone()+"&money="+userMoney.getKymoney().longValue();
            JSONObject jsonObject= BankUtils.jsonObject("http://localhost:8081/bank/recharge",params);
            System.out.println(jsonObject);
            if(userMoneyService.getMoney(id.toString())!=null){
                if(jsonObject.getString("code").equals("3000")) {
                    //用户当前可用余额
                    Long kymoney = userMoneyService.getMoney(id.toString());
                    kymoney = userMoney.getKymoney().longValue() + kymoney;
                    //用户总资产
                    Long zmoney = userMoneyService.getZmoney(id.toString());
                    zmoney = userMoney.getKymoney().longValue() + zmoney;
                    System.out.println(kymoney.toString());
                    userMoneyService.updateMoney(kymoney.toString(), zmoney.toString(), id.toString());//充值
                }else {
                    return jsonObject;
                }
            }else {
                if(jsonObject.getString("code").equals("3000")) {
                    //用户总资产
                    Long zmoney = userMoneyService.getZmoney(id.toString());
                    zmoney = userMoney.getKymoney().longValue() + zmoney;
                    userMoneyService.updateMoney(userMoney.getKymoney().toString(), zmoney.toString(), id.toString());//充值
                }else {
                    return jsonObject;
                }
            }

            //用户资金流向
            LogMoney logMoney =new LogMoney();
            logMoney.setUid(id);
            logMoney.setType((byte)0);
            logMoney.setOut(userMoney.getKymoney());
            logMoneyService.save(logMoney);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.UESR_CHONG_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.UESR_CHONG_FAIL);
        }
        JSONObject.fromObject(statusVO);
        return JSONObject.fromObject(statusVO);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager listPager(int pageIndex, int pageSize,UserMoneyVO userMoney){
        logger.info("用户资金分页！");
        return userMoneyService.listPagerCriteria(pageIndex,pageSize,userMoney);
    }

    @RequestMapping("init")
    public String  list(){

        return "manager/userMoney";
    }
}
