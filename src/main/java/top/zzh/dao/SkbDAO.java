package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Skb;
import top.zzh.common.Pager;

import top.zzh.vo.SkbUpdate;



import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 收款表DAO
 */
@Repository
public interface SkbDAO extends BaseDAO{

    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    long countUid(@Param("uid") Long uid, @Param("baid") Long baid);

    //后台查看收款详情
    List <Object> find(@Param("pager") Pager pager,@Param("query") Object obj);
    Long countByUid(@Param("query") Object obj);

    void saveList(List <Skb> list);

    List<Object> list(@Param("pager") Pager pager, @Param("uid") Long uid, @Param("baid") Long baid);

    //批量生成收款计划
    void saveSkb(List<Skb> skbList);

    Skb findSkb(@Param("uid")Long uid,@Param("juid") Long juid);


    List <Object> listPager(@Param("pager") Pager pager,@Param("juid")Long juid);


    Long count(@Param("juid") Long juid);

    void updateSk(SkbUpdate skbUpdate);

    Long findUid(@Param("juid")Long juid, @Param("djq")Integer djq);

}
