package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.dao.BorrowDetailDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.BorrowDetailService;
import top.zzh.vo.BorrowDetailVO;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 借款详情表
 */
@Service
public class BorrowDetailServiceImpl extends AbstractService implements BorrowDetailService {

    private BorrowDetailDAO borrowDetailDAO;

    @Autowired
    public void setBorrowDetailDAO(BorrowDetailDAO borrowDetailDAO) {
        super.setBaseDAO(borrowDetailDAO);
        this.borrowDetailDAO = borrowDetailDAO;
    }

    @Override
    public void updateTupian(Object obj) {
        borrowDetailDAO.updateTupian(obj);
    }

    @Override
    public void updateBybaid(Object obj) {
        borrowDetailDAO.updateBybaid(obj);
    }

    @Override
    public BorrowDetailVO findDetails(Long baid) {
        return borrowDetailDAO.findDetails(baid);
    }

    @Override
    public BorrowDetailVO find(Long baid) {
        return borrowDetailDAO.find(baid);
    }


    @Override
    public BorrowDetailVO findWay(Long uid, Long juid,Long baid) {

        return borrowDetailDAO.findWay(uid, juid,baid);
    }


}
