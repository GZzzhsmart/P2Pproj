package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Home;
import top.zzh.common.Pager;

import java.util.List;

/**
 * create by 谭芳芳 on 2017/12/21
 * */
@Repository
public interface HomeDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    void updateStatus(Home home);
}
