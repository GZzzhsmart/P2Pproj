package top.zzh.bean;

import java.util.Date;

//站内信表
public class Letter {
    private Long lid;

    private String title;//标题

    private String content;//内容

    private Date date;//日期

    private Byte state;//状态，0激活，1冻结

    public Letter(Long lid, String title, String content, Date date, Byte state) {
        this.lid = lid;
        this.title = title;
        this.content = content;
        this.date = date;
        this.state = state;
    }

    public Letter() {
        super();
    }

    public Long getLid() {
        return lid;
    }

    public void setLid(Long lid) {
        this.lid = lid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}