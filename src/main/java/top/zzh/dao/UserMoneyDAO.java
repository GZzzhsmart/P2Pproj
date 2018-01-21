package top.zzh.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zzh.bean.UserMoney;
import top.zzh.common.Pager;
import top.zzh.vo.UserMoneyVO;

import java.math.BigDecimal;
import java.util.List;

/**
 * 陈桢
 */
@Repository
public interface UserMoneyDAO extends BaseDAO {
    @Override
    List <Object> listPagerCriteria(@Param("pager") Pager pager,@Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);

    Long getMoney(@Param("uid") String uid);

    Long getZmoney(@Param("uid") String uid);

    void updateMoney(@Param("money") String money,@Param("zmoney") String zmoney,@Param("uid") String uid);

    UserMoney findJlmoney(@Param("uid") Long uid);

    void updateJlmoney(@Param("jlmoney")BigDecimal jlmoney,@Param("uid")Long uid);

    UserMoneyVO getByUid(@Param("uid")Long uid);

    UserMoneyVO listMoney(@Param("uid")Long uid);

    void updateZmoney(UserMoneyVO userMoneyVO);

    List<Object> listPagerUid(@Param("pager") Pager pager, @Param("query") Object obj);

    Long getCount( @Param("query") Object obj);

    //将现金劵转入余额，改变用户可用余额
    void updateKymoney(Object object);

}
