package top.zzh.bean;

import java.util.Date;

//最新公告表
public class Notice {
    private Long nid;

    private String content;//内容

    private String title;//标题

    private Date date;//公告时间

    public Notice(Long nid, String content, String title, Date date) {
        this.nid = nid;
        this.content = content;
        this.title = title;
        this.date = date;
    }

    public Notice() {
        super();
    }

    public Long getNid() {
        return nid;
    }

    public void setNid(Long nid) {
        this.nid = nid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}