package top.zzh.service;

import top.zzh.common.Pager;
import top.zzh.vo.ControllerStatusVO;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 投资表service
 */
public interface TzbService extends BaseService {

    Pager listPagerById(int pageNo, int pageSize, Long id);
    Pager listPagerByUId(int pageNo,int pageSize, Object obj);
    Long getCount(Object obj);
    ControllerStatusVO add(Object obj);

    Long count();
}
