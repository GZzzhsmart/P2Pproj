package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Home;
import top.zzh.dao.HomeDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.HomeService;

/**
 * create by 谭芳芳 on 2017/12/21
 * */
@Service
public class HomeServiceImpl extends AbstractService implements HomeService {
    private HomeDAO homeDAO;

    @Autowired
    public void setHomeDAO(HomeDAO homeDAO) {
        super.setBaseDAO(homeDAO);
        this.homeDAO = homeDAO;
    }

    @Override
    public void updateStatus(Home home) {
        homeDAO.updateStatus(home);
    }
}
