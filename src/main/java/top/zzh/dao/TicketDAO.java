package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;

import java.util.List;

@Repository
public interface TicketDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    @Override
    Long countCriteria(@Param("query") Object obj);
    void updateStatus(@Param("status") Byte status,@Param("kid") Long kid);
}
