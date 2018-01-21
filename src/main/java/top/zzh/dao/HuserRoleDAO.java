package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.HUser;
import top.zzh.bean.Role;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.09.
 */
@Repository
public interface HuserRoleDAO extends BaseDAO{

    //查询所有用户
    List<HUser> hUserList();
    //查询所有状态激活的角色
    List<Role> hRoleList();
    //批量保存用户的角色
    void saveHuserRole(@Param("hHuserId") Integer hHuserId, @Param("roleList") List<Integer> roleList);
    //通过Id查询该用户的所有角色
    List<Role> hRoleByHuserIdList(@Param("hUserId") Integer hUserId);
    //查询已经分配角色的用户
    List<Object> hasRoleHuserList(@Param("pager")Pager pager);
    @Override
    Long count();
    //修改前先删除所有角色
    void deleteRoleById(Integer hUserId);
    //保存用户,返回用户的Id
    void saveHuser(HUser hUser);

    int checkPhone(String phone);


}
