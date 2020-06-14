package com.kz.service.impl;

import com.kz.dao.ColumnsDao;
import com.kz.pojo.Columns;
import com.kz.service.ColumnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ColumnsServiceImpl implements ColumnsService {
    @Autowired
    ColumnsDao columnsDao;

    @Override
    public HashMap<Columns,List<Columns>> findAllToMap() {
        List<Columns> columns = columnsDao.findAll();
        HashMap<Columns,List<Columns>> columnMap = new HashMap<Columns,List<Columns>>();
        List<Columns> subColumn = null;
        for (Columns column : columns) {
            if (column.getSub() == null){
                subColumn = new ArrayList<Columns>();
                for (Columns column1 : columns) {
                    if (column.getId() == column1.getSub()) {
                        subColumn.add(column1);
                    }
                }
                columnMap.put(column,subColumn);
            }

        }
        return columnMap;
    }

    @Override
    public void add(Columns columns) {
        if(columns!=null)columnsDao.add(columns);
    }

    @Override
    public List<Columns> findAllTopColumns() {
        return columnsDao.findAllTopColumns();
    }

    @Override
    public void update(Columns columns) {
        if(columns!=null)columnsDao.update(columns);
    }

    @Override
    public Columns findByid(int id) {
        return columnsDao.findById(id);
    }

    @Override
    public void delete(int id) {
        columnsDao.delete(id);
    }


}
