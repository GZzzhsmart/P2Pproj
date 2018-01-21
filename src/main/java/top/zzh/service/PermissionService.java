package top.zzh.service;

import top.zzh.bean.Permission;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.02.
 */

public interface PermissionService extends BaseService{

    //权限
    Pager permissionListPagerCriteria(int pageNo, int pageSize, Object obj);
    void addPermission(Permission permission);
    void updatePermission(Permission permission);
    void updateStatus(int permissionId,int status);

    //通过账号查询用户的权限集合
    List<Permission> listByAccount(String phone);

}
