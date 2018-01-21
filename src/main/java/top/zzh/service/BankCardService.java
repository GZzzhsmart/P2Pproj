package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.bean.BankCard;

/**
 * Created by 曾志湖 on 2017/12/22.
 */
public interface BankCardService extends BaseService{

    //修改绑定银行卡状态
    void updateState(BankCard bankCard);
    Long countDank(Long uid);

    String getDank(Long uid);

    String getType(Long uid);
}
