package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.common.Pager;
import top.zzh.dao.LetterDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.LetterService;

/**
 * Created by 谢学培 on 2017/1/15.
 */
@Service
public class LetterServiceImpl extends AbstractService implements LetterService {

    private LetterDAO letterDAO;

    @Autowired
    public void setLetterDAO(LetterDAO letterDAO) {
        super.setBaseDAO(letterDAO);
        this.letterDAO = letterDAO;
    }

    @Override
    public void save(Object obj) {
        letterDAO.letterUserSave();
        letterDAO.save(obj);
    }

    @Override
    public void removeById(Long obj) {
        letterDAO.removeById(obj);
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(letterDAO.listPagerCriteria(pager, obj));
        pager.setTotal(letterDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public Pager listPagerUid(Integer pageNo, Integer pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(letterDAO.listPagerUid(pager, obj));
        pager.setTotal(letterDAO.countByUid(obj));
        return pager;
    }

    @Override
    public Long countByUid(Integer obj) {
        return letterDAO.countByUid(obj);
    }

    @Override
    public void letterUserUpdate(long letterId) {
        letterDAO.letterUserUpdate(letterId);
    }

    @Override
    public String checkContent(long uid, long lid) {
        letterDAO.updateState(uid, lid);
        return letterDAO.checkContent(lid);
    }

    @Override
    public Long countByRead(long l) {
        return letterDAO.countByRead(l);
    }

    @Override
    public void updateLetterState(Long lid, int state) {
        letterDAO.updateLetterState(lid, state);
    }
}
