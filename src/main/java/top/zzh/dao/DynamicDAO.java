package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Dynamic;
import top.zzh.bean.Media;
import top.zzh.common.Pager;

import java.util.List;

/**
 * create by 谭芳芳 on 2017/12/21
 * */
@Repository
public interface DynamicDAO extends BaseDAO {
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    List<Object> listPager(@Param("pager")Pager pager);
    void updateStatus(Dynamic dynamic);

}
