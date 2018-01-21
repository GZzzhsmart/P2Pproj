package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Role;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/9/28 0028.
 */
@Repository
public interface RoleDAO  extends BaseDAO {

    List<String> listRoles(String username);
    List<Role> list();


    void addRole(Role role);
    void updateRole(Role role);
    @Override
    List<Object> listPager(@Param("pager") Pager pager);
    @Override
    Long count();
    void updateStatus(@Param("roleId") Long roleId,@Param("status") Integer status);

    //通过账号查询用户的角色集合
    List<Role> listByAccount(String phone);


}
