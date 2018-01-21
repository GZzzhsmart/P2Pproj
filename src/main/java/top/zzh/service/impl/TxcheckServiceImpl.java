package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.dao.TxcheckDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.TxcheckService;

/**
 * cander 陈桢 2017/12/22
 */
@Service
public class TxcheckServiceImpl extends AbstractService implements TxcheckService {

    private TxcheckDAO txcheckDAO;

    @Autowired
    public void setTxcheckDAO(TxcheckDAO txcheckDAO) {
        super.setBaseDAO(txcheckDAO);
        this.txcheckDAO = txcheckDAO;
    }
}
