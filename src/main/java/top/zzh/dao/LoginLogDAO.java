package top.zzh.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7 0007.
 */
@Repository
public interface LoginLogDAO extends BaseDAO {

    long getByName(@Param("name") String name);

    String getByloginTime(@Param("name") String name);

    void updateByUserId(Long userId);

    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);
}
