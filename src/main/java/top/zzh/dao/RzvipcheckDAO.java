package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.RzVipCheck;

/**
 * Created by 赖勇健 on 2018/1/3 0003.
 */
@Repository
public interface RzvipcheckDAO extends BaseDAO  {
    void add(RzVipCheck rzVipCheck);
    void examineAndverify(RzVipCheck rzVipCheck);
    RzVipCheck shResult(@Param("uid")Long uid);

}
