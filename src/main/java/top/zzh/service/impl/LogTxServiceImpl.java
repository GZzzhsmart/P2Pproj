package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.dao.LogTxDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.LogTxService;
/**
 * @author 陈桢
 * created time 2017-12-20 10:10
 */
@Service
public class LogTxServiceImpl extends AbstractService implements LogTxService {
    private LogTxDAO logTxDAO;
    @Autowired
    public void setLogTxDAO(LogTxDAO logTxDAO) {
        super.setBaseDAO(logTxDAO);
        this.logTxDAO = logTxDAO;
    }

}
