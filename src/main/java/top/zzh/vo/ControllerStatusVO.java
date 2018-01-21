package top.zzh.vo;


import top.zzh.enums.ControllerStatusEnum;


public class ControllerStatusVO {

    private Integer code;
    private String result;
    private String message;

    public ControllerStatusVO() {
    }

    public ControllerStatusVO(Integer code, String result, String message) {
        this.code = code;
        this.result = result;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static ControllerStatusVO status(ControllerStatusEnum statusEnum) {
        return new ControllerStatusVO(statusEnum.getCode(), statusEnum.getResult(), statusEnum.getMessage());
    }
}
