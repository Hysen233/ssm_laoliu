package com.kz.dao;

import com.kz.pojo.Role;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    @Select("select * from role where id in (select roleid from user_role where userid = #{id})")
    public List<Role> findByUserId(int id);

    @Select("select * from role")
    public List<Role> findAll();

    @Insert("insert into user_role values()")
    public void addRoleToUser(int userId,int roleId);

    @Insert("insert into role(rolename) values(#{rolename})")
    public void add(Role role);

    @Select("SELECT * from role where rolename LIKE CONCAT('%',#{roleName},'%')")
    public List<Role> findByLike(String roleName);

    @Update("UPDATE role SET rolename = #{rolename} WHERE id = #{id}")
    public void update(Role role);

}
