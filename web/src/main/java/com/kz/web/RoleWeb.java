package com.kz.web;

import com.github.pagehelper.PageInfo;
import com.kz.pojo.Role;
import com.kz.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleWeb {
    @Autowired
    RoleService roleService;

    @RequestMapping("/findByPage")
    public ModelAndView findAll(@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "3") int pageSize){
        ModelAndView view = new ModelAndView();
        List<Role> roles = roleService.findByPage(pageNum, pageSize);
        view.addObject("roles",new PageInfo<Role>(roles));
        view.setViewName("role_index");
        return view;
    }

    @RequestMapping("/add")
    public String add(Role role){
        roleService.add(role);
        return "forward:/role/findByPage";
    }

    @RequestMapping("/findByLike")
    public ModelAndView findByLike(String roleName){
        List<Role> byLike = roleService.findByLike(roleName);
        ModelAndView view = new ModelAndView();
        view.addObject("roles",new PageInfo<Role>(byLike));
        view.setViewName("role_index");
        return view;
    }

    @RequestMapping("/update")
    public String update(Role role){
        roleService.update(role);
        return "forward:/role/findByPage";
    }
}
