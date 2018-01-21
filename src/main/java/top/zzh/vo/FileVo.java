package top.zzh.vo;

import java.util.Map;

public class FileVo {
    private int code;
    private String msg;
    private String filePath;

    public int getCode() {
        return code;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
