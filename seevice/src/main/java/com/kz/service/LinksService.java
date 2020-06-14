package com.kz.service;

import com.kz.pojo.Links;
import sun.awt.SunHints;

import java.security.PublicKey;
import java.util.List;

public interface LinksService {
    public List<Links> findAll();

    public Links findByid(int id);

    public void add(Links links);

    public void update(Links links);
}
