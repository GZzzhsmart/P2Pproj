package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.ShBorrow;
import top.zzh.dao.ShBorrowDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.ShBorrowService;
import top.zzh.vo.ShBorrowVO;

import java.util.List;

/**
 * Created by 曾志湖 on 2017/12/22.
 * 借款审核表
 */
@Service
public class ShBorrowServiceImpl extends AbstractService implements ShBorrowService{

    private ShBorrowDAO shBorrowDAO;

    @Autowired
    public void setShBorrowDAO(ShBorrowDAO shBorrowDAO) {
        super.setBaseDAO(shBorrowDAO);
        this.shBorrowDAO = shBorrowDAO;
    }


}
