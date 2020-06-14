package com.kz.service;

import com.kz.pojo.Columns;

import java.util.HashMap;
import java.util.List;

public interface ColumnsService {
    public HashMap findAllToMap();

    public void add(Columns columns);

    public List<Columns> findAllTopColumns();

    public void update(Columns columns);

    public Columns findByid(int id);

    public void delete(int id);
}
