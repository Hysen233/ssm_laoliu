package com.kz.service.impl;

import com.kz.dao.ArticleDao;
import com.kz.dao.ColumnsDao;
import com.kz.pojo.Article;
import com.kz.pojo.Columns;
import com.kz.service.ArticleService;
import com.kz.service.ColumnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service

public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao dao;
    @Autowired
    ColumnsService columnsService;


    @Override
    public HashMap<Columns, List<Columns>> findAllToMap() {
        return columnsService.findAllToMap();
    }

    @Override
    public void add(Article article) {
        if(article!=null)dao.add(article);
    }

    @Override
    public void update(Article article) {
        if(article!=null)dao.update(article);
    }

    @Override
    public List<Article> findAll() {
        return dao.findAll();
    }

    @Override
    public Article findByid(int id) {
        return dao.findByid(id);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }


}
