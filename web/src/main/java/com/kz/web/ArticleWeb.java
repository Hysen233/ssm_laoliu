package com.kz.web;

import com.kz.pojo.Article;
import com.kz.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Article")
public class ArticleWeb {
    @Autowired
    ArticleService service;
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(){
        ModelAndView view = new ModelAndView();
        view.addObject("colmnuMap",service.findAllToMap());
        view.setViewName("article_add");
        return view;
    }

    @RequestMapping("/findByid")
    public ModelAndView findByid(int id) {
        ModelAndView view = new ModelAndView();
        view.addObject("column", service.findAllToMap());
        view.addObject("art", service.findByid(id));
        view.setViewName("article_update");
        return view;
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView view = new ModelAndView();
        view.addObject("article",service.findAll());
        view.setViewName("article_index");
        return view;
    }

    @RequestMapping("/add")
    public String add(Article article){
        service.add(article);
        return "redirect:/Article/findAll";
    }

    @RequestMapping("/update")
    public String update(Article article){
        System.out.println(article);
        System.out.println(article.getContent());
        article.setContent(article.getContent().replace("\"","'"));
        service.update(article);
        return "redirect:/Article/findAll";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        service.delete(id);
        return "redirect:/Article/findAll";
    }
}
