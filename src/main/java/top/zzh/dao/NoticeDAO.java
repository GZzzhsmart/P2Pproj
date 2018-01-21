package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Friend;
import top.zzh.bean.Notice;
import top.zzh.common.Pager;

import java.util.List;

/**
 * @version :1.0
 * CREATE TIME :2018/1/1 19:51
 * @authro :LH
 */
@Repository
public interface NoticeDAO extends  BaseDAO{
    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    List<Object> listNotice(@Param("pageIndex")int pageIndex,@Param("pageSize") int pageSize);

}
