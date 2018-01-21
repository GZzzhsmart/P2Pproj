package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Bz;
import top.zzh.bean.Sway;
import top.zzh.common.Pager;

import java.util.List;

/**
 * @version :1.0
 * CREATE TIME :2017/12/25 15:34
 * @authro :LH
 */
@Repository
public interface BzDAO extends BaseDAO{
    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    @Override
    Object getById(Long id);
    void updateState(Bz bz);
}
