package top.zzh.common;

import javax.servlet.http.HttpServletRequest;


public class CommonsMultipartResolver extends org.springframework.web.multipart.commons.CommonsMultipartResolver{

    @Override
    public boolean isMultipart(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.contains("/ueditor/core")) {
            System.out.println("/ueditor/core");
            return false; // 请使用百度UEditor的判断方式
        } else {
            return super.isMultipart(request); // 用springmvc的文件上传
        }
    }

}