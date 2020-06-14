package com.kz.web;

import com.kz.pojo.Links;
import com.kz.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("link")
public class LinksWeb {
    @Autowired
    LinksService linksService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView view = new ModelAndView();
        view.addObject("linkss",linksService.findAll());
        view.setViewName("flink_index");
        return view;
    }

    @RequestMapping("/findByid")
    public ModelAndView findByid(int id){
        ModelAndView view = new ModelAndView();
        view.addObject("links",linksService.findByid(id));
        view.setViewName("flink_update");
        return view;
    }

    @RequestMapping("/update")
    public String update(Links links){
        linksService.update(links);
        return "redirect:/link/findAll";
    }

    @RequestMapping("/add")
    public String add(Links links){
        linksService.add(links);
        return "redirect:/link/findAll";
    }

}
