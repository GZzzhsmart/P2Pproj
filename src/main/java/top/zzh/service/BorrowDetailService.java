package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.vo.BorrowDetailVO;

/**
 * Created by 曾志湖 on 2017/12/22.
 */
public interface BorrowDetailService extends BaseService {

    //修改图片
    void updateTupian(Object obj);
    void updateBybaid(Object obj);
    BorrowDetailVO findDetails(Long baid);
    BorrowDetailVO find(Long baid);

    BorrowDetailVO findWay(Long uid,Long juid,Long baid);
}
