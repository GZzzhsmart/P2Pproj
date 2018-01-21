package top.zzh.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Cander 陈桢 2017/12/25
 *
 */
public class LogMoneyVO {
    private String rname;//真实姓名
    private String face;//头像
    private Integer type;//类型，0充值，1提现，2回款，3系统金额（公司奖励等）
    private BigDecimal in;//收入
    private BigDecimal out;//支出
    private String date;//时间

    public LogMoneyVO() {
    }

    public LogMoneyVO(String rname, String face, Integer type, BigDecimal in, BigDecimal out, String date) {
        this.rname = rname;
        this.face = face;
        this.type = type;
        this.in = in;
        this.out = out;
        this.date = date;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
