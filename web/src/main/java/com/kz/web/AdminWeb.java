package com.kz.web;

import com.github.pagehelper.PageInfo;
import com.kz.dao.RoleDao;
import com.kz.pojo.IUser;
import com.kz.service.RoleService;
import com.kz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminWeb {
    @Autowired
    UserService service;

    @RequestMapping("/findByPage")
    public ModelAndView findByPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "3") int pagrSize) {
        ModelAndView view = new ModelAndView();
        List<IUser> iUsers = service.findByPage(pageNum, pagrSize);
        view.addObject("userList", new PageInfo<IUser>(iUsers));
        view.setViewName("admin_index");
        return view;
    }

    @RequestMapping("/add")
    public String add(IUser iUser) {
        service.add(iUser);
        return "redirect:/admin/findByPage";
    }

    @RequestMapping("/findByLike")
    public ModelAndView findByLike(String name) {
        ModelAndView view = new ModelAndView();
        List<IUser> users = service.findByLike(name);
        view.addObject("userList", new PageInfo<IUser>(users));
        view.setViewName("admin_index");
        return view;
    }

    @RequestMapping("/findByIdToUpdate")
    public ModelAndView findByIdToUpdate(int id) {
        ModelAndView view = new ModelAndView();
        IUser user = service.findById(id);
        view.addObject("user", user);
        view.setViewName("admin_update");
        return view;
    }

    @RequestMapping("/update")
    public String update(IUser iUser){
        service.update(iUser);
        return "redirect:/admin/findByPage";
    }
}
