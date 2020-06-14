package com.kz.service.impl;

import com.kz.dao.LinksDao;
import com.kz.pojo.Links;
import com.kz.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LinksServiceImpl implements LinksService {
   @Autowired
    LinksDao linksDao;

    @Override
    public List<Links> findAll() {
        return linksDao.findAll();
    }

    @Override
    public Links findByid(int id) {
        return linksDao.findByid(id);
    }

    @Override
    public void add(Links links) {
        linksDao.add(links);
    }

    @Override
    public void update(Links links) {
        linksDao.update(links);
    }
}
