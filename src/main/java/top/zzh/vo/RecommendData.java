package top.zzh.vo;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

//推荐管理表
public class RecommendData {
    private Long id;

    private Long tid;//推荐人id

    private String tname;//推荐人姓名

    private Long uid;//被推荐人id

    private String rname;//被推荐人姓名

    private Date date;//推荐时间
    private String dateToStr;
    private double money;

    public String getDateToStr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTid() {
        return tid;
    }

    public void setTid(Long tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getRname() {
        return rname;
    }

}