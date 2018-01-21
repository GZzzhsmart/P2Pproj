package top.zzh.service;


import org.apache.ibatis.annotations.Param;

/**
 * Created by 赖勇建 on 2017/12/7 0007.
 */
public interface LoginLogService extends BaseService {
    long getByName(String name);
    void updateByUserId(Long userId);
    String getByloginTime(String name);
}
