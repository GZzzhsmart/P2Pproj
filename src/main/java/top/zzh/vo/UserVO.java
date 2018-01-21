package top.zzh.vo;

import java.math.BigDecimal;

/**
 * Created by 曾志湖 on 2018/1/12.
 */
public class UserVO {

    private Long uid;
    private BigDecimal kymoney;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }
}
