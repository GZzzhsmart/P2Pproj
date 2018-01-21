package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Sway;
import top.zzh.dao.SwayDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.SwayService;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 14:33
 * @authro :LH
 */
@Service
public class SwaySeriveImpl extends AbstractService implements SwayService {
    private SwayDAO swayDAO;

    @Autowired
    public void setSwayService(SwayDAO swayDAO) {
        super.setBaseDAO(swayDAO);
        this.swayDAO = swayDAO;
    }

    @Override
    public void updateState(Sway sway) {
        swayDAO.updateState(sway);
    }
}
