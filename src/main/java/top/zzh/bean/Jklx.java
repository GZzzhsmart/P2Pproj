package top.zzh.bean;

//借款类型表
public class Jklx {
    private Long lxid;

    private String lxname;//借款名称，如（先本后息，先息后本，等额本息，等额本金）

    private Byte state;//状态（0可用，1不可用）

    public Jklx(Long lxid, String lxname, Byte state) {
        this.lxid = lxid;
        this.lxname = lxname;
        this.state = state;
    }

    public Jklx() {
        super();
    }

    public Long getLxid() {
        return lxid;
    }

    public void setLxid(Long lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname == null ? null : lxname.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}