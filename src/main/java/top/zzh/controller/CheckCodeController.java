package top.zzh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import top.zzh.common.CheckCodeUtils;
import top.zzh.common.Constants;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;


/**
 * Created by Administrator on 2017/12/7 0007.
 */
@Controller
@RequestMapping("/code")
public class CheckCodeController {

    private Logger logger= LoggerFactory.getLogger(CheckCodeController.class);

    @RequestMapping("")
    public void code(HttpSession session, HttpServletResponse response){
        String code= CheckCodeUtils.randomCode();

        session.setAttribute(Constants.CODE_IN_SESSION,code);
        BufferedImage images= CheckCodeUtils.generateImage(code);//画在缓存里的图片
        try {
            OutputStream out=response.getOutputStream();
            ImageIO.write(images,"png",out);
        } catch (IOException e) {
           logger.error(e.getMessage());
        }

    }

}
