package top.zzh.service;

import java.math.BigDecimal;
import java.util.Date;

public interface RecommendService extends BaseService {
    int countTzm(String tjm);

    Object recommendRanking();

    Object getByTzm(String tzm);

    String getByUid(long uid);

    Object listPagerUid(int pageNo, int pageSize, Object obj);

    Long countByUid(Object obj);

    Long countTicketByUid(long uid, long kid);

    BigDecimal tzByUid(long uid);

    void userTicketSave(long uid, long kid);

    Date dateGet();
}
