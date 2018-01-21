package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;

//投资表
public class Tzb {
    private Long tzid;

    private Long uid;//前台用户id

    private Long juid;//借款人id

    private BigDecimal money;//投资金额

    private Date time;//投资时间

    private Float nprofit;//利率

    private String cpname;//产品名称

    private Long baid;//借款id

    private Integer int1;
    private Integer int2;
    private String str1;

    public Tzb(Long tzid, Long uid, Long juid, BigDecimal money, Date time, Float nprofit, String cpname, Long baid, Integer int1,Integer int2, String str1) {
        this.tzid = tzid;
        this.uid = uid;
        this.juid = juid;
        this.money = money;
        this.time = time;
        this.nprofit = nprofit;
        this.cpname = cpname;
        this.baid = baid;
        this.int1 = int1;
        this.int2 = int2;
        this.str1 = str1;
    }

    public Tzb() {
        super();
    }

    public Long getTzid() {
        return tzid;
    }

    public void setTzid(Long tzid) {
        this.tzid = tzid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getJuid() {
        return juid;
    }

    public void setJuid(Long juid) {
        this.juid = juid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Float getNprofit() {
        return nprofit;
    }

    public void setNprofit(Float nprofit) {
        this.nprofit = nprofit;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname == null ? null : cpname.trim();
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public Integer getInt1() {
        return int1;
    }

    public void setInt1(Integer int1) {
        this.int1 = int1;
    }

    public void setInt2(Integer int2) {
        this.int2 = int2;
    }

    public Integer getInt2() {
        return int2;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1 == null ? null : str1.trim();
    }
}