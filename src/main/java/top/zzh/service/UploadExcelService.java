package top.zzh.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by XIE Shanlin on 2017.12.25.
 */

public interface UploadExcelService extends BaseService{

    //上传excel文件并导入到数据库
    ControllerStatusVO uploadExcelAndIntoDB(MultipartFile file, HttpServletRequest request);

}
