package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.common.Pager;
import top.zzh.dao.LogMoneyDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.LogMoneyService;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 */
@Service
public class LogMoneyServiceImpl extends AbstractService implements LogMoneyService{

    private LogMoneyDAO logMoneyDAO;

    @Autowired
    public void setLogMoneyDAO(LogMoneyDAO logMoneyDAO) {
        super.setBaseDAO(logMoneyDAO);
        this.logMoneyDAO = logMoneyDAO;
    }

    //用户
    @Override
    public Pager listPagerById(int pageNo, int pageSize, Long id) {
        Pager pager =new Pager(pageNo,pageSize);
        pager.setRows(logMoneyDAO.listPagerById(pager,id));
        pager.setTotal(logMoneyDAO.countById(id));
        return pager;
    }

    @Override
    public Pager listPagerUid(int pageNo, int pageSize, Object obj) {
        Pager pager =new Pager(pageNo,pageSize);
        pager.setRows(logMoneyDAO.listPagerUid(pager, obj));
        pager.setTotal(logMoneyDAO.getCount(obj));
        return pager;
    }

    @Override
    public Long getCount(Object obj) {
        return logMoneyDAO.getCount(obj);
    }
}
