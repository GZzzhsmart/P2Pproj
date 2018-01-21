package top.zzh.service;

public interface LetterService extends BaseService {

    Object listPagerUid(Integer pageNo, Integer pageSize, Object obj);

    Long countByUid(Integer obj);

    void letterUserUpdate(long letterId);

    String checkContent(long uid, long lid);

    Long countByRead(long l);

    void updateLetterState(Long lid, int state);
}
