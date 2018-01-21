package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;
import top.zzh.query.RzvipDetails;

import java.util.List;

/**
 * Created by Administrator 赖勇健 on 2017/12/27 0027.
 */
@Repository
public interface RzVipDAO extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query")Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    RzvipDetails findDetails(@Param("uid")Long uid);
}
