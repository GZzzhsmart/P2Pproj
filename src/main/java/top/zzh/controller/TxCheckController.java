package top.zzh.controller;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.HUser;
import top.zzh.bean.LogTx;
import top.zzh.bean.TxCheck;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.LogTxService;
import top.zzh.service.TxcheckService;
import top.zzh.service.UserMoneyService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.LogTxVO;
import top.zzh.vo.TxCheckVO;

import javax.servlet.http.HttpSession;

/**
 * Cander 陈桢 2017/12/27
 */
@RequestMapping("/txCheck")
@Controller
public class TxCheckController {

    @Autowired
    private TxcheckService txcheckService;

    @Autowired
    private  LogTxService logTxService;

    @Autowired
    private UserMoneyService userMoneyService;

    private ControllerStatusVO statusVO;

    private org.slf4j.Logger logger = LoggerFactory.getLogger(LogMoneyController.class);

    @PostMapping("save")
    @ResponseBody
    public ControllerStatusVO save(TxCheck txCheck){
        logger.info("新增提现记录！");
        try {
            txcheckService.save(txCheck);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_FAIL);
        }
        return statusVO;
    }

    @PostMapping("leaveShenHe")
    @ResponseBody
    public ControllerStatusVO leaveShenHe(TxCheck txCheck,String money, HttpSession session){
        logger.info("审核提现！");
        HUser hUser =(HUser)session.getAttribute("HUser");
        txCheck.setHuid(hUser.getHuid());
        //用户当前可用余额
        Long bigDecimal = userMoneyService.getMoney(txCheck.getTxid().toString());
        Double kymoney = Double.valueOf(bigDecimal);
        //用户总资产
        Long zmoney=userMoneyService.getZmoney(txCheck.getTxid().toString());
        Double zmone = Double.valueOf(zmoney);
        Double mone=Double.valueOf(money);
        if(txCheck.getIsok()==(byte)0) {
            if (kymoney < mone) {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.UERS_MONEY_FAIL);
                return statusVO;
            }
        }
        try {
            txcheckService.update(txCheck);
            kymoney = kymoney - mone;
            zmone=zmone - mone;
            userMoneyService.updateMoney(kymoney.toString(),zmone.toString(),txCheck.getTxid().toString());
            LogTx logTx=new LogTx();
            logTx.setState((byte)0);
            logTx.setId(txCheck.getTxid());
            logTxService.update(logTx);
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CHECK_USER_SUCCESS);
        }catch (Exception e){
            statusVO=ControllerStatusVO.status(ControllerStatusEnum.CHECK_USER_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager listPager(int pageIndex, int pageSize,TxCheckVO txCheck){

        return txcheckService.listPagerCriteria(pageIndex,pageSize,txCheck);
    }

    @RequestMapping("init")
    public String  list(){

        return "manager/txCheck";
    }
}
