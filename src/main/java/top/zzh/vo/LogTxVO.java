package top.zzh.vo;

import java.math.BigDecimal;
import java.util.Date;

/*
    @Cander 陈桢 2017/12/12
 */
public class LogTxVO {
    private String rname;//姓名

    private String bankcard;//银行卡号

    private String banktype;//所属银行

    private BigDecimal money;//提现金额

    private String  date;//开始时间

    private String  dateTime;//终止时间

    private String state;//状态，0提现成功，1未提现失败

    public LogTxVO() {
    }

    public LogTxVO(String rname, String bankcard, String banktype, BigDecimal money, String date, String dateTime, String state) {
        this.rname = rname;
        this.bankcard = bankcard;
        this.banktype = banktype;
        this.money = money;
        this.date = date;
        this.dateTime = dateTime;
        this.state = state;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getBankcard() {
        return bankcard;
    }

    public void setBankcard(String bankcard) {
        this.bankcard = bankcard;
    }

    public String getBanktype() {
        return banktype;
    }

    public void setBanktype(String banktype) {
        this.banktype = banktype;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
