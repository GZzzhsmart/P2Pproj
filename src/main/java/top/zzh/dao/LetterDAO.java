package top.zzh.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by 谢学培 on 2017/1/15.
 */
@Repository
public interface LetterDAO extends BaseDAO {

    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    List<Object> listPagerUid(@Param("pager") Pager pager, @Param("lState") Integer lState);

    Long countByUid( @Param("lState") Integer lState);

    void letterUserSave();

    void letterUserUpdate(long letterId);
}
