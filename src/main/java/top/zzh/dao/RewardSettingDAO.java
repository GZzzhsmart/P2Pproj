package top.zzh.dao;

import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

/**
 * Created by 曾志湖 on 2018/1/9.
 * 投资奖励设置
 */
@Repository
public interface RewardSettingDAO extends BaseDAO{

    Double selectpercent(BigDecimal money);
}
