package top.zzh.common;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * Created by XIE Shanlin on 2017.12.25.
 */
public class PathUtil {

    public static String uploadDir(HttpServletRequest request) {
        //获取项目跟路径
        String rootDir = request.getServletContext().getRealPath("/");
        File file = new File(rootDir,"uploadExcel");
        if(!file.exists()) {
            file.mkdir();
        }
        return file.getAbsolutePath();
    }

    public static String getExcelDirectory(HttpServletRequest request) {
       return  request.getServletContext().getRealPath("/uploadExcel/");
    }


}
