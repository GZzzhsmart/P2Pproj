package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Jklx;
import top.zzh.dao.JklxDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BaseService;
import top.zzh.service.JklxService;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 19:31
 * @authro :LH
 */
@Service
public class JklxServiceImpl extends AbstractService implements JklxService {

    private JklxDAO jklxDAO;

    @Autowired
    public void setJklxDAO(JklxDAO jklxDAO) {
        super.setBaseDAO(jklxDAO);
        this.jklxDAO = jklxDAO;
    }

    @Override
    public void updateState(Jklx jklx) {
        jklxDAO.updateState(jklx);
    }
}
