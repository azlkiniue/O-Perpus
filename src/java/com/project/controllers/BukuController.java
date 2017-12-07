/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.entity.BukuModel;
import com.project.services.BukuManager;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author student
 */
@Controller
@RequestMapping(value = "/buku")
public class BukuController {
    @Autowired
    BukuManager manager = new BukuManager();
    
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView formAdd(){
        return new ModelAndView("formInsertBuku", "command", new BukuModel());
    }
    
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String submitAdd(@ModelAttribute BukuModel bukuModel){
        manager.createBukuModel(bukuModel);
        return "redirect:/buku";
    }
    
    @RequestMapping()
    public String index(Model model) {
        model.addAttribute("list", manager.selectAll());
        return "tabelViewBuku";
    }
    
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String formUpdate(@RequestParam("id")int id, Model model){
        model.addAttribute("bukuModel", manager.getBukuModelById(id));
        return "formEditBuku";
    }
    
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String submitEdit(@Valid BukuModel bukuModel, Map model){
        bukuModel = (BukuModel) model.get("bukuModel");
        manager.updateBukuModel(bukuModel);
        return "redirect:/buku";
    }
    
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id")int id) {        
        manager.deleteBukuModel(id);
        return "redirect:/buku"; //redirect to index
    }
}
