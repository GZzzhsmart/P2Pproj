package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.bean.User;
import top.zzh.vo.UserVO;

/**
 * Created by 曾志湖 on 2017/12/21.
 */
public interface UserService extends BaseService {
    User getByNamePwd(String name, String pwd);


    User getByPhone(String phone);
    Long  register(Object obj);

    void saveHeader(String face,String uname);

    User getByface(String uname);

    void updateZpwd(String uname,String zpwd);

    String getByZpwd(String uname);

    void updateUpwd(long uid,String upwd);

    void updateState(Long uid,Integer state);

    void  updatepwd(Long uid,String zpwd);

    UserVO getByUid(Long uid);

    //前台统计用户数
    Long count();
}
