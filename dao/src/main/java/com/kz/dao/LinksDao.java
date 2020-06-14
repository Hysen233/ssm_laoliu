package com.kz.dao;

import com.kz.pojo.Links;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface LinksDao {
    @Select("select * from links")
    public List<Links> findAll();

    @Select("select * from links where id =#{id}")
    public Links findByid(int id);

    @Insert("INSERT INTO links(name, url, desc, contactperson, qq, dispaly, data) VALUES (#{name}, #{url},#{desc},#{contactperson} , #{qq}, #{dispaly},#{data})")
    public void add(Links links);

    @Update("UPDATE links SET name = #{name}, url = #{url}, desc = #{desc}, contactperson = #{contactperson}, qq =#{qq}, dispaly = #{dispaly}, data =#{data} WHERE id = #{id}")
    public void update(Links links);
}
