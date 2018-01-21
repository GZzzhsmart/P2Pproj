package top.zzh.enums;

import net.sf.json.JSONObject;

public class BankUtils {

    public static JSONObject jsonObject(String url,String params){
        String bind= top.zzh.common.HttpUtils.sendPost(url,params);
        JSONObject jsonObject= JSONObject.fromObject(bind);
        return jsonObject;
    }
}
