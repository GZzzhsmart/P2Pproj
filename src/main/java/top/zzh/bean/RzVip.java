package top.zzh.bean;

//认证审核表
public class RzVip {
    private Long rid;

    private Long uid;//用户id

    private String xl;//学历

    private Byte ism;//婚否（0已婚，1未婚，2单身）

    private String bschool;//毕业学校

    private String addr;//居住地址

    private String work;//先工作

    private Integer age;//年龄

    private Long int1;

    private String str1;

    public RzVip(Long rid, Long uid, String xl, Byte ism, String bschool, String addr, String work, Integer age, Long int1, String str1) {
        this.rid = rid;
        this.uid = uid;
        this.xl = xl;
        this.ism = ism;
        this.bschool = bschool;
        this.addr = addr;
        this.work = work;
        this.age = age;
        this.int1 = int1;
        this.str1 = str1;
    }

    public RzVip() {
        super();
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl == null ? null : xl.trim();
    }

    public Byte getIsm() {
        return ism;
    }

    public void setIsm(Byte ism) {
        this.ism = ism;
    }

    public String getBschool() {
        return bschool;
    }

    public void setBschool(String bschool) {
        this.bschool = bschool == null ? null : bschool.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work == null ? null : work.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Long getInt1() {
        return int1;
    }

    public void setInt1(Long int1) {
        this.int1 = int1;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1 == null ? null : str1.trim();
    }
}