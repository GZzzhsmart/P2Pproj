package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;
/**
 * @author 陈桢 update date/dateTime
 * created time 2017-12-22 10:11
 */
//提现记录表
public class LogTx {
    private Long id;

    private Long uid;//用户id

    private String bankcard;//银行卡号

    private String banktype;//所属银行

    private BigDecimal money;//提现金额

    private Date dateTime;//时间

    private Byte state;//状态，0提现成功，1未提现失败

    public LogTx(Long id, Long uid, String bankcard, String banktype, BigDecimal money, Date dateTime, Byte state) {
        this.id = id;
        this.uid = uid;
        this.bankcard = bankcard;
        this.banktype = banktype;
        this.money = money;
        this.dateTime = dateTime;
        this.state = state;
    }

    public LogTx() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getBankcard() {
        return bankcard;
    }

    public void setBankcard(String bankcard) {
        this.bankcard = bankcard == null ? null : bankcard.trim();
    }

    public String getBanktype() {
        return banktype;
    }

    public void setBanktype(String banktype) {
        this.banktype = banktype == null ? null : banktype.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}