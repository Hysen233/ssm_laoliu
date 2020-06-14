package com.kz.dao;

import com.kz.pojo.Columns;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
@Repository
public interface ColumnsDao {
    @Select("select * from columns where sub is null")
    public List<Columns> findAllTopColumns();

    @Select("select * from columns")
    public List<Columns> findAll();
    
    @Insert("INSERT INTO columns(name, Englishname, dispaly, sub) VALUES (#{name},#{Englishname},#{dispaly},#{sub})")
    public void add(Columns columns);

    @Select("select * from columns where id = #{id}")
    public Columns findById(int id);

    @Update("UPDATE columns SET name = #{name}, Englishname = #{Englishname}, dispaly = #{dispaly}, sub = #{sub} WHERE id = #{id}")
    public void update(Columns columns);

    @Delete("delete from columns where id = #{id}")
    public void delete(int id);
}
