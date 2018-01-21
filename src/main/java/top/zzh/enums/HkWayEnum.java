package top.zzh.enums;

/**
 * Created by 还款方式枚举类 on 2018/1/9.
 */
public enum HkWayEnum {

    EQUAL_BX("1", "等额本息"),
    EQUAL_BJ("2", "等额本金"),
    XIAN_XI("3", "先息后本"),
    PAYOFF_ONCE("4", "一次性还本付息");

    private String code;
    private String way;

    HkWayEnum(String code, String way) {
        this.code = code;
        this.way = way;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }
}
