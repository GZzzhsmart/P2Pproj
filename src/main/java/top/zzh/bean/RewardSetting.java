package top.zzh.bean;

import java.math.BigDecimal;

//投资奖励设置表
public class RewardSetting {
    private Long rwid;

    private BigDecimal minmoney;//最小金额

    private BigDecimal maxmoney;//最大金额

    private Double percent;//奖励百分比

    public RewardSetting(Long rwid, BigDecimal minmoney, BigDecimal maxmoney, Double percent) {
        this.rwid = rwid;
        this.minmoney = minmoney;
        this.maxmoney = maxmoney;
        this.percent = percent;
    }

    public RewardSetting() {
        super();
    }

    public Long getRwid() {
        return rwid;
    }

    public void setRwid(Long rwid) {
        this.rwid = rwid;
    }

    public BigDecimal getMinmoney() {
        return minmoney;
    }

    public void setMinmoney(BigDecimal minmoney) {
        this.minmoney = minmoney;
    }

    public BigDecimal getMaxmoney() {
        return maxmoney;
    }

    public void setMaxmoney(BigDecimal maxmoney) {
        this.maxmoney = maxmoney;
    }

    public Double getPercent() {
        return percent;
    }

    public void setPercent(Double percent) {
        this.percent = percent;
    }
}