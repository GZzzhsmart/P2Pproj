package top.zzh.vo;

import java.math.BigDecimal;

public class UserMoneyVO {

    private String uid;
    private String rname;
    private BigDecimal zmoney;//总资产

    private BigDecimal kymoney;//可用余额

    private BigDecimal symoney;//收益总额

    private BigDecimal tzmoney;//投资总额

    private BigDecimal djmoney;//冻结金额

    private BigDecimal dsmoney;//待收金额

    private BigDecimal jlmoney;//奖励金额
    public UserMoneyVO() {

    }

    public UserMoneyVO(String uid, String rname, BigDecimal zmoney, BigDecimal kymoney, BigDecimal symoney, BigDecimal tzmoney, BigDecimal djmoney, BigDecimal dsmoney, BigDecimal jlmoney) {
        this.uid = uid;
        this.rname = rname;
        this.zmoney = zmoney;
        this.kymoney = kymoney;
        this.symoney = symoney;
        this.tzmoney = tzmoney;
        this.djmoney = djmoney;
        this.dsmoney = dsmoney;
        this.jlmoney = jlmoney;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
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
