package top.zzh.service.impl;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import top.zzh.bean.Permission;
import top.zzh.common.PathUtil;
import top.zzh.controller.UploadExcelController;
import top.zzh.dao.ExcelIntoDAO;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.AbstractService;
import top.zzh.service.UploadExcelService;
import top.zzh.vo.ControllerStatusVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by XIE Shanlin on 2017.12.25. <br/>
 * 1.上传Ecxel文件 <br/>
 * 2.所有权限导入数据库
 */
@Service
public class UploadExcelServiceImpl extends AbstractService implements UploadExcelService {

    private Logger logger = LoggerFactory.getLogger(UploadExcelController.class);

    @Autowired
    private ExcelIntoDAO excelIntoDAO;


    @Override
    public ControllerStatusVO uploadExcelAndIntoDB(MultipartFile file, HttpServletRequest request) {
        String originalFilename = file.getOriginalFilename();
        if(originalFilename.endsWith("xls") || originalFilename.endsWith("xlsx")) {
            try {
                file.transferTo(new File(PathUtil.uploadDir(request) + "/" + file.getOriginalFilename()));
                String excelDir = getExcelRootPath(request);
                String excelFile = getExcelType(excelDir);
                List<Permission> permissionList =  judgeFileTypeAndReadExcel(excelDir + excelFile);
                excelIntoDAO.intoDB(permissionList);
                deleteExcel(excelDir + excelFile);
                return ControllerStatusVO.status(ControllerStatusEnum.UPLOAD_EXCEL_SUCCESS);
            } catch (IOException e) {
                logger.error(e.getMessage());
                return ControllerStatusVO.status(ControllerStatusEnum.UPLOAD_EXCEL_BUSY);
            }
        }else {
            return ControllerStatusVO.status(ControllerStatusEnum.UPLOAD_EXCEL_ERROR);
        }
    }

    private void deleteExcel(String excelPath) {
        File file = new File(excelPath);
        file.delete();
    }


    private List<Permission> judgeFileTypeAndReadExcel(String excelPath) {
        List<Permission> permissionList = null;
        if(excelPath.endsWith(".xls")) {
            permissionList = readXLSContact(excelPath);
        }
        if(excelPath.endsWith(".xlsx")) {
            permissionList = readXLSXContact(excelPath);
        }
        return permissionList;
    }


    private String getExcelRootPath(HttpServletRequest request) {
        String excelDir = PathUtil.getExcelDirectory(request);
        return excelDir;
    }

    private String getExcelType(String excelDir) {
        File file = new File(excelDir);
        String[] fileList = file.list();
        String excel = fileList[0];
        return excel;
    }

    private List<Permission> readXLSContact(String xlsPath) {
        List<Permission> permissionList = new ArrayList<Permission>();
        try {
            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(xlsPath)));
            HSSFSheet sheet = workbook.getSheet("Sheet1");
            for (int row = 2; row <= sheet.getLastRowNum(); row++) {
                HSSFRow hssfRow = sheet.getRow(row);
                Permission permission = new Permission();
                for (int cell = 0; cell <= hssfRow.getLastCellNum(); cell++) {
                    HSSFCell hssfCell = hssfRow.getCell(cell);
                    if (cell == 0) {
                        permission.setUrl(hssfCell.getStringCellValue());
                    } else if (cell == 1) {
                        permission.setDesZh(hssfCell.getStringCellValue());
                    }
                }
                permissionList.add(permission);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return permissionList;
    }

    private List<Permission> readXLSXContact(String xlsxPath) {
        List<Permission> permissionList = new ArrayList<Permission>();
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File(xlsxPath)));
            XSSFSheet sheet = workbook.getSheet("Sheet1");
            for (int row = 2; row <= sheet.getLastRowNum(); row++) {
                XSSFRow xssfRow = sheet.getRow(row);
                Permission permission = new Permission();
                for (int cell = 0; cell <= xssfRow.getLastCellNum(); cell++) {
                    XSSFCell xssfCell = xssfRow.getCell(cell);
                    if (cell == 0) {
                        permission.setUrl(xssfCell.getStringCellValue());
                    } else if (cell == 1) {
                        permission.setDesZh(xssfCell.getStringCellValue());
                    }
                }
                permissionList.add(permission);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return permissionList;
    }

}
