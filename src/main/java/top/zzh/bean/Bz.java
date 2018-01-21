package top.zzh.bean;

//标种表
public class Bz {
    private Long bzid;

    private String bzname;//标种名称

    private Byte state;

    public Bz(Long bzid, String bzname, Byte state) {
        this.bzid = bzid;
        this.bzname = bzname;
        this.state = state;
    }

    public Bz() {
        super();
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}