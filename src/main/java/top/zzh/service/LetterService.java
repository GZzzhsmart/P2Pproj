package top.zzh.service;

public interface LetterService extends BaseService {

    Object listPagerUid(Integer pageNo, Integer pageSize, Integer obj);

    Long countByUid(Integer obj);

    void letterUserUpdate(long letterId);
}
