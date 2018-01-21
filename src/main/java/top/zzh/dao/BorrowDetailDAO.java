package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;
import top.zzh.vo.BorrowDetailVO;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 借款详情表dao
 */
@Repository
public interface BorrowDetailDAO extends BaseDAO{

    @Override
    List <Object> listPager(@Param("pager") Pager pager);

    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    //修改图片
    void updateTupian(Object obj);

    void updateBybaid(Object obj);


    //查看详情
    BorrowDetailVO findDetails(@Param("baid")Long baid);

    BorrowDetailVO find(@Param("baid")Long baid);


    @Override
    void update(Object obj);

    @Override
    void save(Object obj);

    BorrowDetailVO findWay(@Param("uid")Long uid,@Param("juid")Long juid,@Param("baid") Long baid);
}
