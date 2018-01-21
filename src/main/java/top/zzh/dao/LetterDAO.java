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

    List<Object> listPagerUid(@Param("pager") Pager pager, @Param("obj") Object obj);

    Long countByUid(@Param("obj") Object obj);

    void letterUserSave();

    void letterUserUpdate(long letterId);

    String checkContent(@Param("lid") long lid);

    void updateState(@Param("uid") long uid, @Param("lid") long lid);

    Long countByRead(@Param("uid") long uid);

    @Override
    void removeById(@Param("uid") Long id);

    void updateLetterState(@Param("lid") Long lid, @Param("state") int state);
}
