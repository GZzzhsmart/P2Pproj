package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;

import java.util.List;

/**
 * @author 陈桢
 * created time 2017-12-22 10:10
 */
@Repository
public interface LogTxDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager,@Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);


}
