package top.zzh.service;

import org.apache.ibatis.annotations.Param;
import top.zzh.bean.UserMoney;
import top.zzh.vo.UserMoneyVO;
import top.zzh.common.Pager;
import java.math.BigDecimal;

/**
 * 陈桢
 */
public interface UserMoneyService extends BaseService {

    Long getMoney(String uid);

    Long getZmoney( String uid);

    void updateMoney( String money, String zmoney,String uid);

    UserMoney findJlmoney(Long uid);

    //前台用户中心显示余额
    UserMoneyVO listMoney(Long uid);

    void updateJlmoney(BigDecimal jlmoney,Long uid);

    void updateZmoney(UserMoneyVO userMoneyVO);

    Object getByUserId(Long id);

    Pager listPagerUid(int pageNo,int pageSize, Object obj);

    Long getCount(Object obj);
    UserMoneyVO getByUid(Long uid);

    //将现金劵转入余额，改变用户可用余额
    void updateKymoney(Object object);
}
