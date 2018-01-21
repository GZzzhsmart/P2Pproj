package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.Hkb;
import top.zzh.common.Pager;

import top.zzh.query.HkbQuery;

import top.zzh.vo.HkbVO;


import java.util.*;
/**
 * Created by 曾志湖 on 2017/12/22.
 * 还款表DAO
 */
@Repository
public interface HkbDAO extends BaseDAO{

    //批量生成还款计划
    void saveList(List<Hkb> hkbList);
    @Override
    List<Object> listPager(@Param("pager") Pager pager);
    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);
    @Override
    Long countCriteria(@Param("query") Object obj);



    List <Object> listPager(@Param("pager") Pager pager,@Param("uid")Long uid);


    Long count(@Param("uid") Long uid);

    void updateHmoney(HkbQuery hkbQuery);

    //后台查看还款详情
    List <Object> find(@Param("pager") Pager pager,@Param("query") Object obj);

    Long countByUid(@Param("query") Object obj);


}
