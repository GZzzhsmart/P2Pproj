package top.zzh.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LetterVO {
    private long lid;
    private String title;
    private String content;
    private int state;
    private Date date;
    private String startTime;
    private String endTime;

    private long uid;
    private int lState;
    private String dateToStr;

    public Date getDate() {
        return date;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateToStr() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public int getlState() {
        return lState;
    }

    public void setlState(int lState) {
        this.lState = lState;
    }

    public long getLid() {
        return lid;
    }

    public void setLid(long lid) {
        this.lid = lid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
