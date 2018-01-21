package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.common.Pager;
import top.zzh.dao.LoginLogDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.LoginLogService;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7 0007.
 */
@Service
public class LoginLogServiceImpl extends AbstractService implements LoginLogService {

   private LoginLogDAO loginLogDAO;

   @Autowired
    public void setLoginLogDAO(LoginLogDAO loginLogDAO) {
        super.setBaseDAO(loginLogDAO);
        this.loginLogDAO = loginLogDAO;
    }

    @Override
    public long getByName(String name) {
        return loginLogDAO.getByName(name);
    }

    @Override
    public void updateByUserId(Long userId) {
        loginLogDAO.updateByUserId(userId);
    }

    @Override
    public String getByloginTime(String name) {
        return loginLogDAO.getByloginTime(name);
    }



}
