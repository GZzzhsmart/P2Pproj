package top.zzh.query;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2018/1/9 0009.
 */
public class RewardQuery {
    private Long rwid;
    private Long uid;
    private String uname;
    private BigDecimal tmoney;
    private BigDecimal money;
    private Integer state;
    private String date;

    public Long getRwid() {
        return rwid;
    }

    public void setRwid(Long rwid) {
        this.rwid = rwid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
