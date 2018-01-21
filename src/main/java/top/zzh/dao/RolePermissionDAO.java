package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zzh.bean.Permission;
import top.zzh.bean.Role;
import top.zzh.vo.Select2;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.04.
 */
@Repository
public interface RolePermissionDAO extends BaseDAO{

    List<Role> listRole();
    List<Permission> listPermission();
    List<Permission> listRolePermission();


    void saveRolePermission(@Param("roleId") Long roleId, @Param("permissionIdList") List<Long> permissionIdList);
    void deleteRolePermission(@Param("roleId") Long roleId);
    List<Permission> initSelectedP(@Param("roleId") Long roleId);

}
