package top.zzh.bean;

//前台用户表
public class User {
    private Long uid;
    private String uname;//用户名
    private String upwd;//密码
    private String phone;//手机号码
    private String tzm;//推荐码
    private String zpwd;//支付密码
    private String idtype;//证件类型
    private String idno;//证件号
    private String email;//电子邮箱
    private String rname;//真实姓名
    private Long tid;//推荐人id
    private String face;//头像
    private Byte sex;//性别0男，1女
    private Byte isvip;//是否为VIP用户0是，1否
    private Long state;
    private String str1;

    public User(){

    }
    public User(Long uid, String uname, String upwd, String phone, String tzm, String zpwd, String idtype, String idno, String email, String rname, Long tid, String face, Byte sex, Byte isvip, Long state, String str1) {
        this.uid = uid;
        this.uname = uname;
        this.upwd = upwd;
        this.phone = phone;
        this.tzm = tzm;
        this.zpwd = zpwd;
        this.idtype = idtype;
        this.idno = idno;
        this.email = email;
        this.rname = rname;
        this.tid = tid;
        this.face = face;
        this.sex = sex;
        this.isvip = isvip;
        this.state = state;
        this.str1 = str1;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTzm() {
        return tzm;
    }

    public void setTzm(String tzm) {
        this.tzm = tzm;
    }

    public String getZpwd() {
        return zpwd;
    }

    public void setZpwd(String zpwd) {
        this.zpwd = zpwd;
    }

    public String getIdtype() {
        return idtype;
    }

    public void setIdtype(String idtype) {
        this.idtype = idtype;
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Long getTid() {
        return tid;
    }

    public void setTid(Long tid) {
        this.tid = tid;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Byte getIsvip() {
        return isvip;
    }

    public void setIsvip(Byte isvip) {
        this.isvip = isvip;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }
}