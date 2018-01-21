package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.BankCard;
import top.zzh.dao.BankCardDAO;
import top.zzh.dao.BankDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BankCardService;
import top.zzh.service.BankService;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 绑定银行卡表
 */
@Service
public class BankServiceImpl extends AbstractService implements BankService {

    private BankDAO bankDAO;

    @Autowired
    public void setBankDAO(BankDAO bankDAO) {
        super.setBaseDAO(bankDAO);
        this.bankDAO = bankDAO;
    }

    @Override
    public String getDeposit(String id) {
        return bankDAO.getDeposit(id);
    }

    @Override
    public String getBankName(String id) {
        return bankDAO.getBankName(id);
    }

}
