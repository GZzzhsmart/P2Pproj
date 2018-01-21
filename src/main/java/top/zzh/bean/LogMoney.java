package top.zzh.bean;

import java.math.BigDecimal;
import java.util.Date;

//资金流向表
public class LogMoney {
    private Long id;

    private Long uid;//用户id

    private Byte type;//类型，0充值，1提现，2回款，3系统金额（公司奖励等）

    private BigDecimal in;//收入

    private BigDecimal out;//支出

    private Date date;//时间

    public LogMoney(Long id, Long uid, Byte type, BigDecimal in, BigDecimal out, Date date) {
        this.id = id;
        this.uid = uid;
        this.type = type;
        this.in = in;
        this.out = out;
        this.date = date;
    }

    public LogMoney() {
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

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public BigDecimal getIn() {
        return in;
    }

    public void setIn(BigDecimal in) {
        this.in = in;
    }

    public BigDecimal getOut() {
        return out;
    }

    public void setOut(BigDecimal out) {
        this.out = out;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}