package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.dao.RewardSettingDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.RewardSettingService;

/**
 * Created by 曾志湖 on 2018/1/9.
 */
@Service
public class RewardSettingServiceImpl extends AbstractService implements RewardSettingService {

    private RewardSettingDAO rewardSettingDAO;

    @Autowired
    public void setRewardSettingDAO(RewardSettingDAO rewardSettingDAO) {
        super.setBaseDAO(rewardSettingDAO);
        this.rewardSettingDAO = rewardSettingDAO;
    }
}
