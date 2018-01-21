package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import top.zzh.bean.BorrowApply;
import top.zzh.common.Pager;
import top.zzh.vo.BorrowDetailVO;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/24.
 * 借款基本信息表
 */
@Repository
public interface BorrowApplyDAO extends BaseDAO{

    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    List<Object> listPagerByUId(@Param("pager") Pager pager, @Param("query") Object obj);

    Long getCount( @Param("query") Object obj);

    //首页借款信息显示
    List<Object> souye1();
    List<Object> souye2();
    List<Object> souye3();
    List<Object> souye4();

    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    @Override
    Long count();

    List<Object> listPagerById(@Param("pager") Pager pager, @Param("id") Long id);

    Long countById(@Param("id") Long id);

    List<Object> shResult(@Param("pager") Pager pager,@Param("uid")Long uid);

    Long shCount(@Param("uid")Long uid);

    @Override
    Object getById(Long id);

    //修改审核状态
    void updateState(BorrowApply borrowApply);

    @Override
    void save(Object obj);

    @Override
    void update(Object obj);

}
