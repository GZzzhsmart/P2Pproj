package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.User;
import top.zzh.dao.UserDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.UserService;
import top.zzh.vo.UserVO;

/**
 * Created by 曾志湖 on 2017/12/21.
 * 前台用户表
 */

@Service
public class UserServiceImpl extends AbstractService implements UserService{



    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        super.setBaseDAO(userDAO);
        this.userDAO = userDAO;
    }

    @Override
    public User getByNamePwd(String name, String pwd) {
        return userDAO.getByNamePwd(name, pwd);
    }


    @Override
    public User getByPhone(String phone) {
        return userDAO.getByPhone(phone);
    }

    @Override
    public Long register(Object obj) {
        return userDAO.register(obj);
    }

    @Override
    public void saveHeader(String face,String uname) {
        userDAO.saveHeader(face,uname);
    }

    @Override
    public User getByface(String uname) {
        return userDAO.getByface(uname);
    }

    @Override
    public void updateZpwd(String uname,String zpwd) {

        userDAO.updateZpwd(uname,zpwd);
    }

    @Override
    public String getByZpwd(String uname) {
        return userDAO.getByZpwd(uname);
    }

    @Override
    public void updateUpwd(long uid,String upwd) {
        userDAO.updateUpwd(uid,upwd);
    }

    @Override
    public void updateState(Long uid, Integer state) {

        userDAO.updateState(uid, state);

    }

    @Override
    public void updatepwd(Long uid, String zpwd) {
        userDAO.updatepwd(uid,zpwd);
    }

    @Override
    public UserVO getByUid(Long uid) {
        return userDAO.getByUid(uid);
    }

    @Override
    public Long count() {
        return userDAO.count();
    }

    @Override
    public void resettingUpwd(String phone, String upwd) {
        userDAO.resettingUpwd(phone, upwd);
    }

    @Override
    public void update(Object obj) {
        userDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return  userDAO.getById(id);
    }
}
