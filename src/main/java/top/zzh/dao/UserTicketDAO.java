package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.common.Pager;
import top.zzh.vo.UserTicketVo;

import java.util.List;

@Repository
public interface UserTicketDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    @Override
    Long countCriteria(@Param("query") Object obj);

    public List<UserTicketVo> unuse(Long uid);
    public List<UserTicketVo> used(Long uid);
    public List<UserTicketVo> overed(Long uid);

    public Integer unuseCount(Long uid);
    public Integer usedCount(Long uid);
    public Integer overedCount(Long uid);
    public List<Long> selectKidListByName(String tname);
    public List<UserTicketVo> selectUtkListByName(@Param("tname")String tname,@Param("uid") Long uid);
    public void updateEGold();

    //将余额充值进余额，修改状态
    UserTicketVo list(@Param("uid") Long uid);
    void updateState(Object object);
}
