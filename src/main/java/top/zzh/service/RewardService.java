package top.zzh.service;

import top.zzh.bean.Reward;

/**
 * Created by 赖勇健 on 2018/1/8 0008.
 */
public interface RewardService extends BaseService {
    Reward findTmoney(Long uid);

    void updateState(Reward reward);

    void updateTjmoney(Reward reward);
}
