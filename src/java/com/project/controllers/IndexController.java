/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.entity.UserModel;
import com.project.services.PeminjamanManager;
import com.project.services.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author student
 */
@Controller
@SessionAttributes("userSession")
public class IndexController {
    
    @Autowired
    UserManager userManager;
    
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("command", new UserModel());
        return "index";
    }
    
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView checkLogin(@ModelAttribute UserModel userModel){
        ModelAndView mv = new ModelAndView();
        UserModel realData = userManager.getUser(userModel.getUser_id());
        if (realData.getUser_pwd().equals(userModel.getUser_pwd())) {
            mv.setViewName("redirect:/buku");
            mv.addObject("userSession", realData);
        } else {
            mv.setViewName("formLogin");
        }        
        return mv;
    }

}
