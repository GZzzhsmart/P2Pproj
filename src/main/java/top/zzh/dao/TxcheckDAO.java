package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;

import java.util.List;

/**
 * cander 陈桢 2017/12/22
 */
@Repository
public interface TxcheckDAO extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager,@Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    @Override
    void update(@Param("query") Object obj);
}
