package com.kz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kz.dao.RoleDao;
import com.kz.dao.UserDao;
import com.kz.pojo.IUser;
import com.kz.pojo.Role;
import com.kz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    RoleDao roleDao;
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        System.out.println(s);
        IUser IUser = userDao.findByName(s);
        User user = new User(IUser.getUsername(),"{noop}"+IUser.getPassword(),IUser.getStatus()==1?true:false,true,true,true,getAuthority(IUser.getRoles()));
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getRolename()));
        }
        return authorities;
    }

    @Override
    public List<IUser> findByPage(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return userDao.fingAll();
    }

    @Override
    public void add(IUser iUser) {
        userDao.add(iUser);
    }

    @Override
    public List<IUser> findByLike(String name) {
        if(name!=null){
            return userDao.findByLike(name);
        }
        return null;
    }

    public IUser findById(int id){
        return userDao.findById(id);
    }

    @Override
    public void update(IUser iUser) {
        if(iUser!=null)userDao.update(iUser);
    }
}
