/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.services.DendaManager;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author student
 */
@Controller
public class DendaController {
    @Autowired
    DendaManager manager = new DendaManager();
    
    @RequestMapping(value = "/denda", method = RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("list", manager.selectAll());
        return "tabelDenda";
    }
    
//    @RequestMapping(value = "/denda/new", method = RequestMethod.GET)
//    public String submitAdd(@RequestParam("_1")int _1, @RequestParam("_2")int _2, @RequestParam("_3")int _3, @RequestParam("_4")int _4, Model model){
//        manager.createDenda(_1, _2, _3, _4);
//        return "redirect:/peminjaman";
//    }
    
    @RequestMapping(value = "/denda/bayar", method = RequestMethod.POST)
    public String submitEdit(HttpServletRequest request, Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        int bayar = Integer.parseInt(request.getParameter("bayar"));
        manager.updateDenda(id, bayar);
        return "redirect:/denda";
    }
}
