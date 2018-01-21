package top.zzh.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @version :1.0
 * CREATE TIME :2018/1/15 8:28
 * @authro :LH
 */
public class NoticeVo {
    private Long nid;

    private String content;//内容

    private String title;//标题

    private Date date;//公告时间

    private String dateString;

    public String getDateString() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
        return sdf.format(date);
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
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
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
