package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;
import top.zzh.vo.ShBorrowVO;

import java.util.*;
import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 借款审核表dao
 */
@Repository
public interface ShBorrowDAO extends BaseDAO{

    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    @Override
    Long count();
}
