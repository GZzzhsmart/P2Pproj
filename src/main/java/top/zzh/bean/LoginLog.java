package top.zzh.bean;

import java.sql.Timestamp;
import java.util.Date;

public class LoginLog {
    private Long id;

    private Long userId;

    private Timestamp loginTime;

    private Byte isOnline;

    private Timestamp logoutTime;

    public Byte getIsOnline() {
        return isOnline;
    }

    public void setIsOnline(Byte isOnline) {
        this.isOnline = isOnline;
    }

    public Timestamp getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(Timestamp logoutTime) {
        this.logoutTime = logoutTime;
    }

    private String loginIp;

    public LoginLog(Long id, Long userId, Timestamp loginTime, String loginIp) {
        this.id = id;
        this.userId = userId;
        this.loginTime = loginTime;
        this.loginIp = loginIp;
    }

    public LoginLog() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }
}