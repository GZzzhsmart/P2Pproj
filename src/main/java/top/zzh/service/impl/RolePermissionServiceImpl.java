package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Permission;
import top.zzh.bean.Role;
import top.zzh.dao.RolePermissionDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.RolePermissionService;
import top.zzh.vo.Select2;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.04.
 */

@Service
public class RolePermissionServiceImpl extends AbstractService implements RolePermissionService {

    private RolePermissionDAO rolePermissionDAO;

    @Autowired
    public void setRolePermissionDAO(RolePermissionDAO rolePermissionDAO) {
        super.setBaseDAO(rolePermissionDAO);
        this.rolePermissionDAO = rolePermissionDAO;
    }


    @Override
    public List<Select2> listRole() {
        List<Role> roleList = rolePermissionDAO.listRole();
        List<Select2>  select2List = new ArrayList<>();
        for (Role role : roleList) {
            select2List.add(new Select2(role.getRid(),role.getRname()));
        }
        return select2List;
    }

    @Override
    public List<Permission> listPermission() {
        List<Permission> permissionList = rolePermissionDAO.listPermission();
        return permissionList;
    }

    @Override
    public void saveRolePermission(String roleId, String permissionIds) {
        Long roleIdz = Long.valueOf(roleId).longValue();
        List<Long> permissionId = getPermissionId(permissionIds);
        rolePermissionDAO.saveRolePermission(roleIdz,permissionId);

    }

    @Override
    public void deleteRolePermission(String roleId) {
        Long roleIdz = Long.valueOf(roleId).longValue();
        rolePermissionDAO.deleteRolePermission(roleIdz);
    }

    @Override
    public List<Permission> initSelectedP(String roleId) {
        return rolePermissionDAO.initSelectedP(Long.valueOf(roleId).longValue());
    }


    private List<Long> getPermissionId(String permissionIds){
        List<Long> permissionIdList = new ArrayList<>();
        String[] permissionId =  permissionIds.split(",");
        for (int i = 0; i < permissionId.length; i++) {
            String s = permissionId[i];
            permissionIdList.add(Long.valueOf(s).longValue());
        }
        return permissionIdList;
    }
}
