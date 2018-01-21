package top.zzh.controller;


import jdk.internal.instrumentation.Logger;
import net.sf.json.JSONObject;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.LogTx;
import top.zzh.bean.TxCheck;
import top.zzh.bean.User;
import top.zzh.common.Constants;
import top.zzh.common.EncryptUtils;
import top.zzh.common.Pager;
import top.zzh.enums.BankUtils;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.*;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.LogTxVO;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 * Cander 陈桢 2017/12/27
 */
@RequestMapping("/logTx")
@Controller
public class LogTXController {

    @Autowired
    private LogTxService logTxService;

    @Autowired
    private TxcheckService txcheckService;

    @Autowired
    private UserService userService;

    @Autowired
    private BankCardService bankCardService;

    @Autowired
    private BankService bankService;

    private ControllerStatusVO statusVO;

    private org.slf4j.Logger logger = LoggerFactory.getLogger(LogMoneyController.class);

    @PostMapping("save")
    @ResponseBody
    public ControllerStatusVO save(LogTx logTx){
        logger.info("新增提现记录！");
        try {
            logTxService.save(logTx);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("tixian/{pass}")
    @ResponseBody
    public JSONObject tixian(HttpSession session, String actualMoney, @PathVariable("pass")String pass) {
        Long id = (Long) session.getAttribute(Constants.USER_ID_SESSION);
        User user=(User)userService.getById(id);
        String p =user.getZpwd().toString();
        String pa= EncryptUtils.md5(pass);
        if (!p.equals(pa)){//密码错误
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.UERS_ERROR_ERROR);
            JSONObject.fromObject(statusVO);
            return JSONObject.fromObject(statusVO);
        }
        try{
            String cardno =(String)bankCardService.getDank(id);//银行卡号
            String type1 =bankCardService.getType(id);//所属银行
            String bank=bankService.getBankName(type1);//银行
            String params="realName="+user.getRname()+"&bank="+bank+"&bankCardNo="+cardno+"&phone="+user.getPhone()+"&money="+actualMoney;
            JSONObject jsonObject= BankUtils.jsonObject("http://localhost:8081/bank/mention",params);
            System.out.println(jsonObject);
            String candno=bankCardService.getDank(id);
            String type =bankCardService.getType(id);
            LogTx logTx=new LogTx();
            logTx.setMoney(BigDecimal.valueOf(Long.valueOf(actualMoney)));
            logTx.setUid(id);
            logTx.setBanktype(type);
            logTx.setBankcard(candno);
            logTxService.save(logTx);
            TxCheck txCheck =new TxCheck();
            txCheck.setHuid(id);
            txCheck.setTxid(logTx.getId());
            txCheck.setIsok((byte)2);
            if(jsonObject.getString("code").equals("4000")) {
                txcheckService.save(txCheck);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.BORROW_SAVE_WAIT);
            }else {
                return jsonObject;
            }
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CHECK_ERR_FAIL);
        }
        JSONObject.fromObject(statusVO);
        return JSONObject.fromObject(statusVO);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager listPager(int pageIndex, int pageSize,LogTxVO logTx){

        return logTxService.listPagerCriteria(pageIndex,pageSize,logTx);
    }

    @RequestMapping("init")
    public String  list(){

        return "manager/logTx";
    }
}
