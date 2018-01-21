package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.BankCard;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 绑定银行卡表dao
 */
@Repository
public interface BankDAO extends BaseDAO {
   String getDeposit(@Param("id") String id);
   String getBankName(@Param("id") String id);
}
