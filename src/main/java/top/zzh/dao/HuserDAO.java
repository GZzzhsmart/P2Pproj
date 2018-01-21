package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.HUser;
import top.zzh.bean.User;

/**
 * Created by Administrator on 2017/12/26 0026.
 */
@Repository
public interface HuserDAO extends BaseDAO {

    HUser getByNamePwd(@Param("phone") String phone, @Param("pwd") String pwd);

    HUser getByPhone(@Param("phone")String phone);

    Long  register(Object obj);

    String findPwd(@Param("huid")Long huid);

    void updatePwd(@Param("huid")Long huid,@Param("hpwd")String hpwd);
}
