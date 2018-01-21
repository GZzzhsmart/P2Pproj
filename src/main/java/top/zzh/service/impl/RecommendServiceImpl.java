package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.common.Pager;
import top.zzh.dao.RecommendDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.RecommendService;

import java.util.List;

/**
 * Created by 谢学培 on 2017/12/21.
 */
@Service
public class RecommendServiceImpl extends AbstractService implements RecommendService {

    private RecommendDAO recommendDAO;

    @Autowired
    public void setRecommendDAO(RecommendDAO recommendDAO) {
        super.setBaseDAO(recommendDAO);
        this.recommendDAO = recommendDAO;
    }

    @Override
    public void save(Object obj) {
        recommendDAO.save(obj);
    }
    @Override
    public void remove(Object obj) {
        recommendDAO.remove(obj);
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(recommendDAO.listPagerCriteria(pager, obj));
        pager.setTotal(recommendDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public int countTzm(String tjm) {
        return recommendDAO.countTzm(tjm);
    }

    @Override
    public Object recommendRanking() {
        return recommendDAO.recommendRanking();
    }

    @Override
    public Object getByTzm(String tzm) {
        return recommendDAO.getByTzm(tzm);
    }

    @Override
    public String getByUid(long uid) {
        return recommendDAO.getByUid(uid);
    }

    @Override
    public Pager listPagerUid(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(recommendDAO.listPagerUid(pager, obj));
        pager.setTotal(recommendDAO.countByUid(obj));
        return pager;
    }

    @Override
    public Long countByUid(Object obj) {
        return recommendDAO.countByUid(obj);
    }
}
