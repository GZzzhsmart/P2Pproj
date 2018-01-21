package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;

//投资总奖励表
public class Reward {
    private Long rwid;

    private Long uid;//投资人id

    private BigDecimal tmoney;//投资人总额

    private BigDecimal money;//奖励金额

    private Byte state;//状态（0已发放，1未发放）

    private Date date;//奖励发放时间

    public Reward(Long rwid, Long uid, BigDecimal tmoney, BigDecimal money, Byte state, Date date) {
        this.rwid = rwid;
        this.uid = uid;
        this.tmoney = tmoney;
        this.money = money;
        this.state = state;
        this.date = date;
    }

    public Reward() {
        super();
    }

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

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}