package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.HUser;
import top.zzh.bean.User;
import top.zzh.dao.HuserDAO;
import top.zzh.dao.UserDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.HuserService;
import top.zzh.service.UserService;

/**
 * Created by 曾志湖 on 2017/12/21.
 * 前台用户表
 */

@Service
public class HuserServiceImpl extends AbstractService implements HuserService{


    private HuserDAO huserDAO;

    @Autowired
    public void setHuserDAO(HuserDAO huserDAO) {
        super.setBaseDAO(huserDAO);
        this.huserDAO = huserDAO;
    }


    @Override
    public HUser getByNamePwd(String phone, String pwd) {
        return huserDAO.getByNamePwd(phone, pwd);
    }

    @Override
    public HUser getByPhone(String phone) {
        return huserDAO.getByPhone(phone);
    }

    @Override
    public Long register(Object obj) {
        return huserDAO.register(obj);
    }

    @Override
    public String findPwd(Long huid) {
        return huserDAO.findPwd(huid);
    }

    @Override
    public void updatePwd(Long huid, String hpwd) {
        huserDAO.updatePwd(huid, hpwd);
    }
}
