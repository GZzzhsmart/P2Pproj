package top.zzh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.zzh.bean.HUser;
import top.zzh.bean.Role;
import top.zzh.common.EncryptUtils;
import top.zzh.common.Pager;
import top.zzh.dao.HuserRoleDAO;
import top.zzh.service.AbstractService;
import top.zzh.service.HuserRoleService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by XIE Shanlin on 2018.01.09.
 */
@Service
public class HuserRoleServiceImpl extends AbstractService implements HuserRoleService{

    private HuserRoleDAO huserRoleDAO;

    @Autowired
    public void setHuserRoleDAO(HuserRoleDAO huserRoleDAO) {
        super.setBaseDAO(huserRoleDAO);
        this.huserRoleDAO = huserRoleDAO;
    }

    @Override
    public List<HUser> hUserList() {
        return huserRoleDAO.hUserList();
    }

    @Override
    public List<Role> hRoleList() {
        return huserRoleDAO.hRoleList();
    }

    @Override
    public void save(String hHuserId, String roleList) {
        huserRoleDAO.deleteRoleById(Integer.parseInt(hHuserId));
        huserRoleDAO.saveHuserRole(Integer.parseInt(hHuserId),roleList(roleList));
    }

    @Override
    public List<Role> hRoleByHuserIdList(Integer hUserId) {
        return huserRoleDAO.hRoleByHuserIdList(hUserId);
    }

    @Override
    public void saveHuser(String phone, String roleList) {
        HUser user = new HUser();
        user.setPhone(phone);
        user.setHpwd(EncryptUtils.md5("666666"));
        user.setState(1L);
        huserRoleDAO.saveHuser(user);
        huserRoleDAO.saveHuserRole(Integer.valueOf(user.getHuid().toString()),roleList(roleList));
    }

    @Override
    public int checkPhone(String phone) {
        return huserRoleDAO.checkPhone(phone);
    }


    @Override
    public Pager listPager(int pageNo, int pageSize){
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(huserRoleDAO.hasRoleHuserList(pager));
        pager.setTotal(huserRoleDAO.count());
        return pager;
    }


    private List<Integer> roleList(String roleList){
        List<Integer> roles = new ArrayList<>();
        String[] roleArray = roleList.split(",");
        for (int i = 0; i < roleArray.length; i++) {
            roles.add(Integer.parseInt(roleArray[i]));
        }
        return roles;
    }

}
