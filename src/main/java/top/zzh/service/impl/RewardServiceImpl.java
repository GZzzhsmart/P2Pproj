package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Reward;
import top.zzh.dao.RewardDAO;
import top.zzh.dao.UserDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.RewardService;

/**
 * Created by Administrator on 2018/1/8 0008.
 */
@Service
public class RewardServiceImpl  extends AbstractService implements RewardService {

    private RewardDAO rewardDAO;

    @Autowired
    public void setRewardDAO(RewardDAO rewardDAO) {
        super.setBaseDAO(rewardDAO);
        this.rewardDAO = rewardDAO;
    }


    @Override
    public Reward findTmoney(Long uid) {
        return rewardDAO.findTmoney(uid);
    }

    @Override
    public void updateState(Reward reward) {
        rewardDAO.updateState(reward);
    }

    @Override
    public void updateTjmoney(Reward reward) {
        rewardDAO.updateTjmoney(reward);
    }


}
