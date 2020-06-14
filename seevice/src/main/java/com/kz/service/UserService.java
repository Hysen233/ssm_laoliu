package com.kz.service;

import com.kz.pojo.IUser;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public interface UserService extends UserDetailsService {
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException;

    public List<IUser> findByPage(int pageNum, int pageSize);

    public void add(IUser iUser);

    public List<IUser> findByLike(String name);

    public IUser findById(int id);

    public void update(IUser iUser);
}
