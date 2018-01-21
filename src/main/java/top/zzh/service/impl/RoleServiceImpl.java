package top.zzh.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.BorrowApply;
import top.zzh.bean.Role;
import top.zzh.common.Pager;
import top.zzh.dao.RoleDAO;
import top.zzh.service.RoleService;

import java.util.List;

/**
 * Created by Administrator on 2017/9/29 0029.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    public List<String> listRoles(String username) {
        return roleDAO.listRoles(username);
    }

    @Override
    public void addRole(Role role) {
        roleDAO.addRole(role);
    }

    @Override
    public void updateRole(Role role) {
        roleDAO.updateRole(role);
    }

    @Override
    public void updateStatus(Long roleId, Integer status) {
        roleDAO.updateStatus(roleId,status);
    }

    @Override
    public List<Role> listByAccount(String phone) {
        return roleDAO.listByAccount(phone);
    }


    @Override
    public void save(Object obj) {
       roleDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {

    }

    @Override
    public BorrowApply getById(Long id) {
        return null;
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(roleDAO.listPager(pager));
        pager.setTotal(roleDAO.count());
        return pager;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        return null;
    }
}
