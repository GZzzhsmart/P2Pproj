package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Permission;
import top.zzh.common.Pager;
import top.zzh.dao.PermissionDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.PermissionService;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.02.
 */
@Service
public class PermissionServiceImpl extends AbstractService implements PermissionService {

    private PermissionDAO permissionDAO;

    @Autowired
    public void setAuthManagementDAO(PermissionDAO authManagementDAO) {
        super.setBaseDAO(authManagementDAO);
        this.permissionDAO = authManagementDAO;
    }

    @Override
    public Pager permissionListPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(permissionDAO.permissionListPagerCriteria(pager,obj));
        pager.setTotal(permissionDAO.permissionCountCriteria(obj));
        return pager;
    }

    @Override
    public void addPermission(Permission permission) {
        permissionDAO.addPermission(permission);
    }

    @Override
    public void updatePermission(Permission permission) {
        permissionDAO.updatePermission(permission);
    }

    @Override
    public void updateStatus(int permissionId,int status) {
        permissionDAO.updateStatus(permissionId,status);
    }

    @Override
    public List<Permission> listByAccount(String phone) {
        return permissionDAO.listByAccount(phone);
    }
}
