package com.kz.web;

import com.kz.pojo.Columns;
import com.kz.service.ColumnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("Columns")
public class ColumnsWeb {
    @Autowired
    ColumnsService service;

    @RequestMapping("/findAllToMap")
    public ModelAndView findAllToMap() {
        HashMap map = service.findAllToMap();
        ModelAndView view = new ModelAndView();
        view.addObject("columnsMap", map);
        view.setViewName("type_index");
        return view;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd() {
        ModelAndView view = new ModelAndView();
        List<Columns> list = service.findAllTopColumns();
        view.addObject("column", list);
        view.setViewName("type_add");
        return view;
    }

    @RequestMapping("/add")
    public String add(Columns columns) {
        if (columns.getSub() == 0) {
            columns.setSub(null);
        }
        System.out.println(columns);
        service.add(columns);

        return "redirect:/Columns/findAllToMap";
    }

    @RequestMapping("/findByid")
    public ModelAndView findByid(int id) {
        ModelAndView view = new ModelAndView();
        view.addObject("column", service.findAllTopColumns());
        view.addObject("col", service.findByid(id));
        view.setViewName("type_update");
        return view;
    }

    @RequestMapping("/update")
    public String update(Columns columns) {
        if (columns.getSub() == 0){
            columns.setSub(null);
        }
        service.update(columns);
        return "redirect:/Columns/findAllToMap";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        service.delete(id);
        return "redirect:/Columns/findAllToMap";
    }
}
