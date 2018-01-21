package top.zzh.bean;

import java.math.BigDecimal;

//用户资金表
public class UserMoney {
    private Long umid;

    private Long uid;//用户id

    private BigDecimal zmoney;//总资产

    private BigDecimal kymoney;//可用余额

    private BigDecimal symoney;//收益总额

    private BigDecimal tzmoney;//投资总额

    private BigDecimal djmoney;//冻结金额

    private BigDecimal dsmoney;//待收金额

    private BigDecimal jlmoney;//奖励金额

    public UserMoney(Long umid, Long uid, BigDecimal zmoney, BigDecimal kymoney, BigDecimal symoney, BigDecimal tzmoney, BigDecimal djmoney, BigDecimal dsmoney, BigDecimal jlmoney) {
        this.umid = umid;
        this.uid = uid;
        this.zmoney = zmoney;
        this.kymoney = kymoney;
        this.symoney = symoney;
        this.tzmoney = tzmoney;
        this.djmoney = djmoney;
        this.dsmoney = dsmoney;
        this.jlmoney = jlmoney;
    }

    public UserMoney() {
        super();
    }

    public Long getUmid() {
        return umid;
    }

    public void setUmid(Long umid) {
        this.umid = umid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public BigDecimal getZmoney() {
        return zmoney;
    }

    public void setZmoney(BigDecimal zmoney) {
        this.zmoney = zmoney;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }

    public BigDecimal getSymoney() {
        return symoney;
    }

    public void setSymoney(BigDecimal symoney) {
        this.symoney = symoney;
    }

    public BigDecimal getTzmoney() {
        return tzmoney;
    }

    public void setTzmoney(BigDecimal tzmoney) {
        this.tzmoney = tzmoney;
    }

    public BigDecimal getDjmoney() {
        return djmoney;
    }

    public void setDjmoney(BigDecimal djmoney) {
        this.djmoney = djmoney;
    }

    public BigDecimal getDsmoney() {
        return dsmoney;
    }

    public void setDsmoney(BigDecimal dsmoney) {
        this.dsmoney = dsmoney;
    }

    public BigDecimal getJlmoney() {
        return jlmoney;
    }

    public void setJlmoney(BigDecimal jlmoney) {
        this.jlmoney = jlmoney;
    }
}