package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.bean.BorrowApply;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/24.
 */
public interface BorrowApplyService extends BaseService{

    //修改审核状态
    void updateState(BorrowApply borrowApply);
    Pager listPagerById(int pageNo, int pageSize, Long id);
    Pager listPagerByUId(int pageNo,int pageSize,Object obj);
    Long getCount(Object obj);
    Pager shResult(int pageNo, int pageSize,Long uid);
    Long shCount(Long uid);

    //首页借款信息显示
    List<Object> souye1();
    List<Object> souye2();
    List<Object> souye3();
    List<Object> souye4();
}
