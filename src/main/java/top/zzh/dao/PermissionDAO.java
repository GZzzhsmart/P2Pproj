package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Permission;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.02.
 */
@Repository
public interface PermissionDAO extends BaseDAO {

    List<Object> permissionListPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    Long permissionCountCriteria(@Param("query") Object obj);
    void addPermission(Permission permission);
    void updatePermission(Permission permission);
    void updateStatus(@Param("permissionId") int permissionId,@Param("status") int status);

    //通过账号查询用户的权限集合
    List<Permission> listByAccount(String phone);
}
