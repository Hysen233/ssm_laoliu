package com.kz.service;

import com.kz.pojo.Article;
import com.kz.pojo.Columns;

import java.util.HashMap;
import java.util.List;

public interface ArticleService {
    public HashMap<Columns,List<Columns>> findAllToMap();

    public void add(Article article);

    public void update(Article article);

    public List<Article> findAll();

    public Article findByid(int id);

    public void delete(int id);
}
