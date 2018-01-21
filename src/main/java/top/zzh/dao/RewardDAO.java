package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Reward;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by 赖勇健 on 2018/1/8 0008.
 */
@Repository
public interface RewardDAO extends BaseDAO{

    Reward findTmoney(@Param("uid") Long uid);

    void updateState(Reward reward);

    void updateTjmoney(Reward reward);

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query")Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

}
