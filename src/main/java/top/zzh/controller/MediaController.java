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
import top.zzh.bean.Media;
import top.zzh.common.Pager;
import top.zzh.enums.ControllerStatusEnum;
import top.zzh.service.MediaService;
import top.zzh.vo.ControllerStatusVO;
import top.zzh.vo.FileVo;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
@Controller
@RequestMapping("/media")
public class MediaController {
    @Autowired
    private MediaService mediaService;
    private ControllerStatusVO statusVO;
    private Logger logger = LoggerFactory.getLogger(MediaController.class);

    /**
     * 跳转页面
     * @return
     * */
    @RequestMapping("initMedia/{mid}")
    public String initNotice(@PathVariable("mid") Long mid ,HttpServletRequest request) {
        Media media = (Media) mediaService.getById(mid);
        request.setAttribute("media",media);
        return "index/mediaPage";
    }
    @RequestMapping("initAdd")
    public String initAdd(){
        return "media/mediaAdd";
    }


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
    //新增媒体报道
    @RequestMapping("save")
    @ResponseBody
    public ControllerStatusVO save(Media media){
         try{
            media.getContent();
            media.setState((byte) 0);
            mediaService.save(media);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_SAVE_SUCCESS);
        return statusVO;
    }
    //通过id查找媒体报道
    @RequestMapping("findMedia/{mid}")
    @ResponseBody
    public Media findMedia(@PathVariable("mid")Long mid){
        Media media = new Media();
        media = (Media) mediaService.getById(mid);
        return media;
    }
    //修改媒体报道
    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Media media){
        try {
            mediaService.update(media);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_UPDATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_UPDATE_SUCCESS);
        return statusVO;
    }

    //修改状态
    @RequestMapping("updateStatus/{mid}/{state}")
    @ResponseBody
    public ControllerStatusVO updateStatus(@PathVariable("mid")Long id,@PathVariable("state")Byte state){
        try {
            Media media = new Media();
            media.setMid(id);
            media.setState(state);
            mediaService.updateStatus(media);
        }catch(Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_UPDATE_STATE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_UPDATE_STATE_SUCCESS);
        return statusVO;
    }
    //单个删除
    @RequestMapping("delete/{mid}")
    @ResponseBody
    public ControllerStatusVO delete(@PathVariable("mid") Long id){
        try {
            mediaService.remove(id);
        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.MEDIA_DELETE_SUCCESS);
        return statusVO;
    }

    //批量删除
    @RequestMapping("deleteMany/{mid}")
    @ResponseBody
    public String deleteMany(@PathVariable("mid")String id){
            Media media = new Media();
            String idString[] = id.split(".");
            for(int i=0;i<idString.length;i++){
                media.setMid(Long.parseLong(idString[i].toString()));
                mediaService.remove(id);
            }
            if (media != null){
                return "mediaList";
            }
        return "ok";
    }
    @RequestMapping("page")
    public String page(){
        return "media/mediaList";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int pageIndex, int pageSize,Media media){
        logger.info("媒体公告分页");
        return mediaService.listPagerCriteria(pageIndex,pageSize,media);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
