package com.kz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kz.dao.RoleDao;
import com.kz.pojo.Role;
import com.kz.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao roleDao;

    @Override
    public List<Role> findByPage(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return roleDao.findAll();
    }

    @Override
    public void add(Role role) {
        if(role.getRolename()!=null)roleDao.add(role);
    }

    @Override
    public List<Role> findByLike(String roleName) {
        if (roleName != null){
            return roleDao.findByLike(roleName);
        }
        return null;
    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public void update(Role role) {
        if(role!=null)roleDao.update(role);
    }


}
