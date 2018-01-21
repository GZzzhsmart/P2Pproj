package top.zzh.bean;

import java.util.Date;

//推荐管理表
public class Recommend {
    private Long id;

    private Long tid;//推荐人id

    private String tname;//推荐人姓名

    private Long uid;//被推荐人id

    private String rname;//被推荐人姓名

    private Date date;//推荐时间

    public Recommend(Long id, Long tid, String tname, Long uid, String rname, Date date) {
        this.id = id;
        this.tid = tid;
        this.tname = tname;
        this.uid = uid;
        this.rname = rname;
        this.date = date;
    }

    public Recommend() {
        super();
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

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}