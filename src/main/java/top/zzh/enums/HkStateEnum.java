package top.zzh.enums;

/**
 * Created by 还款状态枚举类 on 2018/1/9.
 */
public enum HkStateEnum {

    /**
     * 未还款
     */
    UNREPAY(0,"未还款"),
    /**
     * 已还款
     */
    REPAYED(1,"已还款"),
    /**
     * 已逾期
     */
    TIMEOUT(2,"已逾期");

    private int code;
    private String message;

    HkStateEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
