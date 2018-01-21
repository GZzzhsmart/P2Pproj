package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.common.Pager;
import top.zzh.dao.OptionDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.OptionService;

import java.util.List;

@Service
public class OptionServiceImpl extends AbstractService implements OptionService  {
    private OptionDAO optionDAO;

    @Autowired
    public void setBankCardDAO(OptionDAO optionDAO) {
        super.setBaseDAO(optionDAO);
        this.optionDAO = optionDAO;
    }
}
