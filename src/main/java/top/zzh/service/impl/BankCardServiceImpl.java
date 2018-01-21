package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.BankCard;
import top.zzh.dao.BankCardDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BankCardService;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 绑定银行卡表
 */
@Service
public class BankCardServiceImpl extends AbstractService implements BankCardService {


    private BankCardDAO bankCardDAO;

    @Autowired
    public void setBankCardDAO(BankCardDAO bankCardDAO) {
        super.setBaseDAO(bankCardDAO);
        this.bankCardDAO = bankCardDAO;
    }


    @Override
    public void updateState(BankCard bankCard) {
        bankCardDAO.updateState(bankCard);
    }

    @Override
    public Long countDank(Long uid) {
        return bankCardDAO.countDank(uid);
    }

    @Override
    public String getDank(Long uid) {
        return bankCardDAO.getDank(uid);
    }

    @Override
    public String getType(Long uid) {
        return bankCardDAO.getType(uid);
    }
}
