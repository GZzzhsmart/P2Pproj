package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Bz;
import top.zzh.dao.BzDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BzService;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 15:37
 * @authro :LH
 */
@Service
public class BzServiceImpl extends AbstractService implements BzService {

    private  BzDAO bzDAO;

    @Autowired
    public void setBzDAO(BzDAO bzDAO) {
        super.setBaseDAO(bzDAO);
        this.bzDAO = bzDAO;
    }

    @Override
    public void updateState(Bz bz) {
        bzDAO.updateState(bz);
    }
}
