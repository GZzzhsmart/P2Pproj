package top.zzh.service;

import java.util.List;

public interface RecommendService extends BaseService {
    int countTzm(String tjm);

    Object recommendRanking();

    Object getByTzm(String tzm);

    String getByUid(long uid);

    Object listPagerUid(int pageNo, int pageSize,Object obj);

    Long countByUid(Object obj);
}
