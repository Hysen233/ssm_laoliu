package com.kz.service;

import com.kz.pojo.Role;

import java.util.List;

public interface RoleService {
    public List<Role> findByPage(int pageNum,int pageSize);

    public void add(Role role);

    public List<Role> findByLike(String roleName);

    public List<Role> findAll();

    public void update(Role role);
}
