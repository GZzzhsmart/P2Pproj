package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.dao.RzVipDAO;
import top.zzh.query.RzvipDetails;
import top.zzh.service.AbstractService;
import top.zzh.service.RzVipService;

/**
 * Created by 赖勇健 on 2017/12/27.
 * 认证
 */
@Service
public class RzVipServiceImpl extends AbstractService implements RzVipService {

    private RzVipDAO rzVipDAO;

    @Autowired
    public void setBankCardDAO(RzVipDAO rzVipDAO) {
        super.setBaseDAO(rzVipDAO);
        this.rzVipDAO = rzVipDAO;
    }

    @Override
    public void save(Object obj) {
        rzVipDAO.save(obj);
    }

    @Override
    public Object getById(Long id) {
        return rzVipDAO.getById(id);
    }

    @Override
    public void update(Object obj) {
        rzVipDAO.update(obj);
    }

    @Override
    public RzvipDetails findDetails(Long uid) {
        return rzVipDAO.findDetails(uid);
    }
}
