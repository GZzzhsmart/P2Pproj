package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import top.zzh.bean.Dynamic;
import top.zzh.bean.Media;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.DynamicService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.FileVo;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {
    @Autowired
    private DynamicService dynamicService;
    private ControllerStatusVO statusVO;
    private Logger logger = LoggerFactory.getLogger(MediaController.class);

    @RequestMapping("upload")
    @ResponseBody
    public FileVo fileUp(MultipartFile file, HttpServletRequest request){
        FileVo fileVo = new FileVo();
        try{
            //使用原始文件名称
            String fileName = file.getOriginalFilename();
            //重新格式化文件名称
            //String fileName = getFileName(file.getOriginalFilename());
            String path = request.getSession().getServletContext().getRealPath("upload");
            File dir = new File(path,fileName);
            if(!dir.exists()){
                dir.mkdirs();
            }
            file.transferTo(dir);
            fileVo.setFilePath("upload/"+fileName);
            System.out.println("保存到数据库的图片地址:upload/"+fileName);
            fileVo.setCode(0);
        }catch (Exception e){
            e.printStackTrace();
            fileVo.setCode(1);
        }
        fileVo.setMsg("上传成功!");
        return  fileVo;
    }
    //重命名文件名称
    private synchronized String getFileName(String filename) {
        int position = filename.lastIndexOf(".");
        String ext = filename.substring(position);
        return System.nanoTime() + ext;
    }
    @RequestMapping("initDynamic/{dyid}")
    public String initDynamic(@PathVariable("dyid") Long dyid ,HttpServletRequest request) {
        Dynamic dynamic = (Dynamic) dynamicService.getById(dyid);
        request.setAttribute("dynamic",dynamic);
        return "index/dynamicPage";
    }
    @RequestMapping("initAdd")
    public String initAdd(){
        return "dynamic/dynamicAdd";
    }

    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Dynamic dynamic){
        try{
            dynamic.getContent();
            dynamic.setState((byte) 0);
            dynamicService.save(dynamic);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_SAVE_SUCCESS);
        return statusVO;
    }

    //通过id查找媒体报道
    @RequestMapping("findDynamic/{dyid}")
    public String findMedia(@PathVariable("dyid")Long dyid,HttpServletRequest request){
        Dynamic dynamic = new Dynamic();
        dynamic = (Dynamic) dynamicService.getById(dyid);
        request.setAttribute("dynamic",dynamic);
        return "dynamic/dynamicDetail";
    }

    @RequestMapping("initUpdate/{dyid}")
    public String initUpdate(@PathVariable("dyid") Long dyid  ,HttpServletRequest request){
        Dynamic dynamic = new Dynamic();
        dynamic = (Dynamic) dynamicService.getById(dyid);
        request.setAttribute("dynamic",dynamic);
        return "dynamic/dynamicUpdate";
    }

    @RequestMapping("update")
    public String update(Dynamic dynamic,HttpServletRequest request){
        try {
            dynamicService.update(dynamic);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_UPDATE_FAIL);
            request.setAttribute("statusVO",statusVO);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_UPDATE_SUCCESS);
        request.setAttribute("statusVO",statusVO);
        return "dynamic/dynamicList";
    }

    //修改状态
    @RequestMapping("updateStatus/{dyid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateStatus(@PathVariable("dyid")Long id,@PathVariable("state")Byte state){
        try {
           Dynamic dynamic = new Dynamic();
            dynamic.setDyid(id);
            dynamic.setState(state);
            dynamicService.updateStatus(dynamic);
        }catch(Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_UPDATE_STATE_SUCCESS);
        return statusVO;
    }

    //单个删除
    @RequestMapping("delete/{dyid}")
    @ResponseBody
    public ControllerStatusVO delete(@PathVariable("dyid") Long id){
        try {
            dynamicService.remove(id);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DYNAMIC_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("page")
    public String page(){
        return "dynamic/dynamicList";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize,Dynamic dynamic){
        logger.info("公司动态分页");
        return dynamicService.listPagerCriteria(pageIndex,pageSize,dynamic);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
