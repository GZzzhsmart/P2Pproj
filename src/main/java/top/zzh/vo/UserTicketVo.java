package top.zzh.vo;

import java.math.BigDecimal;
import java.util.Date;

public class UserTicketVo {
    private Long ukid;
    private Long uid;//用户id
    private Long kid;//劵id
    private String uttime;//领劵时间
    private Byte usestatus;//使用状态

    private Byte type;//优惠券类型，如现金劵，代金券，体验金,加息券
    private BigDecimal tkmoney;//优惠券金额
    private String tktime;//有效时间
    private String tname;//优惠卷名称
    private String tintro;//优惠卷简介
  

    public Long getUkid() {
        return ukid;
    }

    public void setUkid(Long ukid) {
        this.ukid = ukid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getKid() {
        return kid;
    }

    public void setKid(Long kid) {
        this.kid = kid;
    }

    public String getUttime() {
        return uttime;
    }

    public void setUttime(String uttime) {
        this.uttime = uttime;
    }

    public Byte getUsestatus() {
        return usestatus;
    }

    public void setUsestatus(Byte usestatus) {
        this.usestatus = usestatus;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public String getTktime() {
        return tktime;
    }

    public void setTktime(String tktime) {
        this.tktime = tktime;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTintro() {
        return tintro;
    }

    public void setTintro(String tintro) {
        this.tintro = tintro;
    }
}
