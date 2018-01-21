package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.User;
import top.zzh.common.Pager;
import top.zzh.vo.UserVO;

import java.util.List;

@Repository
public interface UserDAO extends BaseDAO {

    User getByNamePwd(@Param("name") String name, @Param("pwd") String pwd);


    User getByPhone(@Param("phone")String phone);

    Long  register(Object obj);

    void saveHeader(@Param("face")String face,@Param("uname")String uname);

    User getByface(@Param("uname")String uname);

    void updateZpwd(@Param("uname")String uname,@Param("zpwd")String zpwd);

    String getByZpwd(@Param("uname")String uname);

    void updateUpwd(@Param("uid")long uid,@Param("upwd") String upwd);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query")Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    void updateState(@Param("uid")Long uid,@Param("state")Integer state);

    void  updatepwd(@Param("uid")Long uid,@Param("zpwd")String zpwd);

    UserVO getByUid(@Param("uid")Long uid);

    @Override
    Long count();

    void resettingUpwd(@Param("phone")String  phone,@Param("upwd") String upwd);
}
