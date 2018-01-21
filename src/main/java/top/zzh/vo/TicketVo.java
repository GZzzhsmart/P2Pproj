package top.zzh.vo;

import java.math.BigDecimal;
import java.util.Date;

public class TicketVo {
    private Integer kid;
    private Byte type;
    private String tname;//优惠卷名称
    private String tname3;
    private String tintro;//优惠卷简介
    private String tintro3;
    private BigDecimal tkmoney;//优惠券金额
    private BigDecimal tkmoney4;//优惠券金额
    private BigDecimal tkmoney5;//优惠券金额
    private BigDecimal usecondition;//使用条件
    private BigDecimal usecondition2;//使用条件
    private Byte status;

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public BigDecimal getUsecondition() {
        return usecondition;
    }

    public void setUsecondition(BigDecimal usecondition) {
        this.usecondition = usecondition;
    }

    public BigDecimal getUsecondition2() {
        return usecondition2;
    }

    public void setUsecondition2(BigDecimal usecondition2) {
        this.usecondition2 = usecondition2;
    }

    public String getTname3() {
        return tname3;
    }

    public void setTname3(String tname3) {
        this.tname3 = tname3.trim();
    }

    public String getTintro3() {
        return tintro3;
    }

    public void setTintro3(String tintro3) {
        this.tintro3 = tintro3.trim();
    }


    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname.trim();
    }

    public String getTintro() {
        return tintro;
    }

    public void setTintro(String tintro) {
        this.tintro = tintro.trim();
    }

    public BigDecimal getTkmoney5() {
        return tkmoney5;
    }

    public void setTkmoney5(BigDecimal tkmoney5) {
        this.tkmoney5 = tkmoney5;
    }

    public BigDecimal getTkmoney4() {
        return tkmoney4;
    }

    public void setTkmoney4(BigDecimal tkmoney4) {
        this.tkmoney4 = tkmoney4;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    private String tktime;

    public String getTktime() {
        return tktime;
    }

    public void setTktime(String tktime) {
        this.tktime = tktime;
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
}
