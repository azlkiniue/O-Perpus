/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.entity.UserModel;
import com.project.services.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author student
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("userSession")
public class LoginController {
    @Autowired
    UserManager userManager;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView formLogin(){
        return new ModelAndView("formLogin", "command", new UserModel());
    }
    
    @RequestMapping(method = RequestMethod.POST)
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
    
    @RequestMapping(value = "_out")
    public String logout(SessionStatus status){
        status.setComplete();
        return "redirect:/";
    }
}
