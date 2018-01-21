package top.zzh.bean;

//还款方式表
public class Sway {
    private Long sid;

    private String way;//方式

    private String fw;//算法

    private Byte state;//还款方式状态（0不可用，1可用）

    public Sway(Long sid, String way, String fw, Byte state) {
        this.sid = sid;
        this.way = way;
        this.fw = fw;
        this.state = state;
    }

    public Sway() {
        super();
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getFw() {
        return fw;
    }

    public void setFw(String fw) {
        this.fw = fw == null ? null : fw.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}