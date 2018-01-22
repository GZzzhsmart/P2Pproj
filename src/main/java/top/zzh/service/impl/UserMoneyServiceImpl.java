package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.UserMoney;
import top.zzh.common.Pager;
import top.zzh.dao.UserMoneyDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.UserMoneyService;
import top.zzh.vo.UserMoneyVO;

import java.math.BigDecimal;

/**
 * @author 陈桢
 * created time 2017-12-21 20:44
 */
@Service
public class UserMoneyServiceImpl extends AbstractService implements UserMoneyService {

    private UserMoneyDAO userMoneyDAO;

    @Autowired
    public void setUserMoneyDAO(UserMoneyDAO userMoneyDAO) {
        super.setBaseDAO(userMoneyDAO);
        this.userMoneyDAO = userMoneyDAO;
    }

    @Override
    public Long getMoney(String uid) {
        return userMoneyDAO.getMoney(uid);
    }

    @Override
    public Long getZmoney(String uid) {
        return userMoneyDAO.getZmoney(uid);
    }

    @Override
    public void updateMoney(String money, String zmoney, String uid) {
        userMoneyDAO.updateMoney(money,zmoney,uid);
    }


    @Override
    public UserMoney findJlmoney(Long uid) {
        return userMoneyDAO.findJlmoney(uid);
    }

    @Override
    public UserMoneyVO listMoney(Long uid) {
        return userMoneyDAO.listMoney(uid);
    }

    @Override
    public void updateJlmoney(BigDecimal jlmoney, Long uid) {
        userMoneyDAO.updateJlmoney(jlmoney, uid);
    }

    @Override
    public void updateZmoney(UserMoneyVO userMoneyVO) {
        userMoneyDAO.updateZmoney(userMoneyVO);
    }

    @Override
    public Object getByUserId(Long id) {
        return null;
    }

    @Override
    public Pager listPagerUid(int pageNo, int pageSize, Object obj) {
        Pager pager =new Pager(pageNo,pageSize);
        pager.setRows(userMoneyDAO.listPagerUid(pager, obj));
        pager.setTotal(userMoneyDAO.getCount(obj));
        return pager;
    }

    @Override
    public Long getCount(Object obj) {
        return userMoneyDAO.getCount(obj);
    }

    @Override
    public UserMoneyVO getByUid(Long uid) {
        return userMoneyDAO.getByUid(uid);
    }

    @Override
    public void updateKymoney(Object object) {
        userMoneyDAO.updateKymoney(object);
    }


}
