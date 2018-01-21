package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.common.Pager;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 资金流向表service
 */
public interface LogMoneyService extends BaseService {
    Pager listPagerById(int pageNo,int pageSize,Long id);
    Pager listPagerUid(int pageNo,int pageSize, Object obj);

    Long getCount(Object obj);

}
