package top.zzh.common;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @author  曾志湖 on 2017/12/28.
 * 上传图片保存路径
 *
 */
public class PathUtils {

    public static String uploadDir(HttpServletRequest request) {
        String rootDir = request.getServletContext().getRealPath("/static");
        File file = new File(rootDir, "/uploads");
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getAbsolutePath();
    }
}
