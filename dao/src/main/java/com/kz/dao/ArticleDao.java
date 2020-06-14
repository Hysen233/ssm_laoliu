package com.kz.dao;

import com.kz.pojo.Article;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {
    @Select("select * from article")
    @Results(id = "mm", value = {
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "columnsid", property = "columns", one = @One(select = "com.kz.dao.ColumnsDao.findById", fetchType = FetchType.LAZY))
    })
    public List<Article> findAll();

    @Select("select * from article where id = #{id}")
    @ResultMap("mm")
    public Article findByid(int id);

    @Insert("insert into article(title,content,columnsid,topping,dispaly) value(#{title},#{content},#{columnsid},#{topping},#{dispaly})")
    public void add(Article article);

    @Update("UPDATE article SET title = #{title}, content = #{content}, columnsid = #{columnsid}, topping = #{topping}, dispaly = #{dispaly} WHERE id = #{id}")
    public void update(Article article);

    @Delete("delete from article where id = #{id}")
    public void delete(int id);

}
