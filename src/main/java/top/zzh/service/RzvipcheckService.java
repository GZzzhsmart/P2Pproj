package top.zzh.service;

import top.zzh.bean.RzVipCheck;

/**
 * Created by 赖勇健 on 2018/1/3 0003.
 */
public interface RzvipcheckService extends BaseService {
    void add(RzVipCheck rzVipCheck);
    void examineAndverify(RzVipCheck rzVipCheck);
    RzVipCheck shResult(Long uid);
}
