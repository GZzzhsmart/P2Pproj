package top.zzh.service;

import top.zzh.common.Pager;
import top.zzh.dao.BaseDAO;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/21.
 */
public abstract class AbstractService implements BaseService {


    private BaseDAO baseDAO;

    public void setBaseDAO(BaseDAO baseDAO) {
        this.baseDAO = baseDAO;
    }

    @Override
    public void save(Object obj) {
        baseDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {
        baseDAO.remove(obj);
    }

    @Override
    public void removeById(Long id) {
        baseDAO.removeById(id);
    }

    @Override
    public void update(Object obj) {
        baseDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return baseDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return baseDAO.listAll();
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(baseDAO.listPager(pager));
        pager.setTotal(baseDAO.count());
        return pager;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseDAO.listPagerCriteria(pager, obj));
        pager.setTotal(baseDAO.countCriteria(obj));
        return pager;
    }
}
