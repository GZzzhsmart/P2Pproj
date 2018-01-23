package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.RzVipCheck;
import top.zzh.dao.RzvipcheckDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.RzvipcheckService;

/**
 * Created by 赖勇健 on 2018/1/3 0003.
 */
@Service
public class RzvipcheckServiceImpl  extends AbstractService implements RzvipcheckService {

    private RzvipcheckDAO rzvipcheckDAO;

    @Autowired
    public void setBankCardDAO(RzvipcheckDAO rzvipcheckDAO) {
        super.setBaseDAO(rzvipcheckDAO);
        this.rzvipcheckDAO = rzvipcheckDAO;
    }


    @Override
    public void add(RzVipCheck rzVipCheck) {
        rzvipcheckDAO.add(rzVipCheck);
    }

    @Override
    public void examineAndverify(RzVipCheck rzVipCheck) {
        rzvipcheckDAO.examineAndverify(rzVipCheck);
    }

    @Override
    public RzVipCheck shResult(Long uid) {
        return rzvipcheckDAO.shResult(uid);
    }

}
