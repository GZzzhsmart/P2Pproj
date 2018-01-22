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
import top.zzh.bean.Home;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.HomeService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.FileVo;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private HomeService homeService;
    private ControllerStatusVO statusVO;
    private Logger logger = LoggerFactory.getLogger(HomeController.class);

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

    @RequestMapping("initAdd")
    public String initAdd(){
        return "home/homeAdd";
    }

      //新增首页信息
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Home home) {
        try {
            home.setState((byte) 0);
            homeService.save(home);
           }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_SAVE_SUCCESS);
        return statusVO;
    }
    //通过id查找首页信息
    @RequestMapping("findHome/{hid}")
    @ResponseBody
    public Home findHome(@PathVariable("hid")Long hid){
        Home home = new Home();
        home = (Home) homeService.getById(hid);
        return home;
    }
    //修改首页信息
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Home home){
        try {
            homeService.update(home);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_UPDATE_SUCCESS);
        return statusVO;
    }
    //修改状态
    @RequestMapping("updateStatus/{hid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateStatus(@PathVariable("hid")Long id,@PathVariable("state")Byte state){
        try {
            Home home = new Home();
            home.setHid(id);
            home.setState(state);
            homeService.updateStatus(home);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_UPDATE_STATE_SUCCESS);
        return statusVO;
    }
    //单个删除
    @RequestMapping("delete/{hid}")
    @ResponseBody
    public ControllerStatusVO delete(@PathVariable("hid")Long id){
        try {
            homeService.remove(id);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.HOME_DELETE_SUCCESS);
        return statusVO;
    }

    @RequestMapping("page")
    public String page() {
        return "home/homeList";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize,Home home) {
        return homeService.listPagerCriteria(pageIndex, pageSize,home);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
