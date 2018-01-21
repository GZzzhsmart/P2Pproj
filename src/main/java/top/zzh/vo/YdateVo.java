package top.zzh.vo;

import java.math.BigDecimal;
import java.util.Date;

public class YdateVo {
    private Long yid;

    private String date;//生成时间

    private BigDecimal tmoney;//交易总额

    private BigDecimal mmoney;//月交易总额

    private Integer tuser;//总用户数

    private Integer muser;//月用户数

    private Integer ttzno;//总投资人数

    private Integer mtzno;//月投资人数

    private Integer tdkno;//总贷款人数

    private Integer mdkno;//月贷款人数

    private Integer tdkbno;//总贷款笔数

    private Integer mdkbno;//月贷款笔数

    public Long getYid() {
        return yid;
    }

    public void setYid(Long yid) {
        this.yid = yid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMmoney() {
        return mmoney;
    }

    public void setMmoney(BigDecimal mmoney) {
        this.mmoney = mmoney;
    }

    public Integer getTuser() {
        return tuser;
    }

    public void setTuser(Integer tuser) {
        this.tuser = tuser;
    }

    public Integer getMuser() {
        return muser;
    }

    public void setMuser(Integer muser) {
        this.muser = muser;
    }

    public Integer getTtzno() {
        return ttzno;
    }

    public void setTtzno(Integer ttzno) {
        this.ttzno = ttzno;
    }

    public Integer getMtzno() {
        return mtzno;
    }

    public void setMtzno(Integer mtzno) {
        this.mtzno = mtzno;
    }

    public Integer getTdkno() {
        return tdkno;
    }

    public void setTdkno(Integer tdkno) {
        this.tdkno = tdkno;
    }

    public Integer getMdkno() {
        return mdkno;
    }

    public void setMdkno(Integer mdkno) {
        this.mdkno = mdkno;
    }

    public Integer getTdkbno() {
        return tdkbno;
    }

    public void setTdkbno(Integer tdkbno) {
        this.tdkbno = tdkbno;
    }

    public Integer getMdkbno() {
        return mdkbno;
    }

    public void setMdkbno(Integer mdkbno) {
        this.mdkbno = mdkbno;
    }


}
