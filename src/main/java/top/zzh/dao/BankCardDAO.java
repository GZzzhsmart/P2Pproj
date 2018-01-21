package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.BankCard;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 绑定银行卡表dao
 */
@Repository
public interface BankCardDAO extends BaseDAO {

    //修改银行卡状态
    void updateState(BankCard bankCard);
    Long countDank(@Param("uid") Long uid);

    String getDank(@Param("uid") Long uid);
    String getType(@Param("uid") Long uid);
}
