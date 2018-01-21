package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.Media;
import top.zzh.dao.MediaDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.MediaService;

import java.util.List;

/**
 * create by 谭芳芳 on 2017/12/21
 * */
@Service
public class MediaServiceImpl extends AbstractService implements MediaService{

    private MediaDAO mediaDAO;

    @Autowired
    public void setMediaDAO(MediaDAO mediaDAO) {
        super.setBaseDAO(mediaDAO);
        this.mediaDAO = mediaDAO;
    }

    @Override
    public void updateStatus(Media media) {
        mediaDAO.updateStatus(media);
    }

}
