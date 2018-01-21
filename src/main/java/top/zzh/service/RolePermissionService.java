package top.zzh.service;

import top.zzh.bean.Permission;
import top.zzh.bean.Role;
import top.zzh.vo.Select2;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.04.
 */
public interface RolePermissionService {

    List<Select2> listRole();
    List<Permission> listPermission();

    void saveRolePermission(String roleId,String permissionIds);
    void deleteRolePermission(String roleId);
    List<Permission> initSelectedP(String roleId);
}
