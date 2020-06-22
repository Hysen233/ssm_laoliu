package com.kz.dao;

import com.kz.pojo.IUser;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    @Results(id = "user", value = {
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id", property = "roles", many = @Many(select = "com.kz.dao.RoleDao.findByUserId", fetchType = FetchType.LAZY))
    })
    @Select("select * from user")
    public List<IUser> fingAll();

    @ResultMap("user")
    @Select("select * from user where username = #{name}")
    public IUser findByName(String name);

    @Insert("INSERT INTO user(username, phone, email, status, password) VALUES (#{username},#{phone},#{email},#{status},#{password})")
    public void add(IUser iUser);

    @Select("select * from user where username like concat('%',#{name},'%')")
    public List<IUser> findByLike(String name);

    @Select("select * from user where id = #{id}")
    public IUser findById(int id);

    @Update("UPDATE user SET username = #{username}, phone = #{phone}, email = #{email}, status = #{status}, password = #{password} WHERE id = #{id}")
    public void update(IUser iUser);


}
