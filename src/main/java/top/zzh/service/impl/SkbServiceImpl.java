package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.zzh.bean.Skb;
import top.zzh.calculator.ACMLoanCalculator;
import top.zzh.calculator.ACPIMLoanCalculator;
import top.zzh.calculator.LoanByMonth;
import top.zzh.calculator.LoanUtil;
import top.zzh.common.Pager;
import top.zzh.dao.BorrowDetailDAO;
import top.zzh.dao.SkbDAO;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.AbstractService;
import top.zzh.service.SkbService;
import top.zzh.vo.BorrowDetailVO;
import top.zzh.vo.ControllerStatusVO;

import top.zzh.vo.SkbUpdate;

import top.zzh.vo.SkbVO;

import top.zzh.vo.TzbVO;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 收款表
 */
@Service
public class SkbServiceImpl extends AbstractService implements SkbService{

    private SkbDAO skbDAO;
    private BorrowDetailDAO borrowDetailDAO;

    @Autowired
    public void setSkbDAO(SkbDAO skbDAO) {
        super.setBaseDAO(skbDAO);
        this.skbDAO = skbDAO;
    }

    @Override
    public Pager skblist(int pageNo, int pageSize, Long uid, Long baid) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(skbDAO.list(pager,uid,baid));
        pager.setTotal(skbDAO.countUid(uid,baid));
        return pager;
    }

    @Override
    public void saveSkb(List<Skb> skbList) {
        skbDAO.saveSkb(skbList);
    }

    @Override
    public Skb findSkb(Long uid, Long juid) {
        return skbDAO.findSkb(uid, juid);
    }

    @Override
    public Pager listPager(int pageNo, int pageSize, Long juid) {

        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(skbDAO.listPager(pager, juid));
        pager.setTotal(skbDAO.count(juid));
        return pager;
    }

    @Override
    public void updateSk(SkbUpdate skbUpdate) {
        skbDAO.updateSk(skbUpdate);
    }

    @Override
    public Long findUid(Long juid, Integer djq) {
        return findUid(juid, djq);
    }


    public ControllerStatusVO saveSkb(Long uid, Long baid) {
        ControllerStatusVO statusVO = null;


        statusVO = ControllerStatusVO.status(ControllerStatusEnum.CHECK_TZ_FAILED);

        return statusVO;
    }
    public Pager find(int pageNo, int pageSize, Object object) {
        Pager pager =new Pager(pageNo,pageSize);
        pager.setRows(skbDAO.find(pager, object));
        pager.setTotal(skbDAO.countByUid(object));
        return pager;

    }


    @Autowired
    public void setBorrowDetailDAO(BorrowDetailDAO borrowDetailDAO) {
        this.borrowDetailDAO = borrowDetailDAO;
    }

}
