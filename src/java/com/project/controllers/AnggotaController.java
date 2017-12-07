/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.entity.AnggotaModel;
import com.project.services.AnggotaManager;
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
public class AnggotaController {
    
    @Autowired
    AnggotaManager manager = new AnggotaManager();
    
    @RequestMapping(value = "/anggota/add", method = RequestMethod.GET)
    public ModelAndView formAdd(){
        return new ModelAndView("formInsertAnggota", "command", new AnggotaModel());
    }
    
    @RequestMapping(value = "/anggota/add", method = RequestMethod.POST)
    public String submitAdd(@ModelAttribute AnggotaModel anggotaModel){
        manager.createAnggotaModel(anggotaModel);
        return "redirect:/anggota";
    }
    
    @RequestMapping("/anggota")
    public String index(Model model) {
        model.addAttribute("list", manager.selectAll());
        return "tabelViewAnggota";
    }
    
    @RequestMapping(value = "/anggota/update", method = RequestMethod.GET)
    public String formUpdate(@RequestParam("id")int id, Model model){
        model.addAttribute("anggotaModel", manager.getAnggotaModelById(id));
        return "formEditAnggota";
    }
    
    @RequestMapping(value = "/anggota/update", method = RequestMethod.POST)
    public String submitEdit(@Valid AnggotaModel anggotaModel, Map model){
        anggotaModel = (AnggotaModel) model.get("anggotaModel");
        manager.updateAnggotaModel(anggotaModel);
        return "redirect:/anggota";
    }
    
    @RequestMapping(value = "/anggota/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id")int id) {        
        manager.deleteAnggotaModel(id);
        return "redirect:/anggota"; //redirect to index
    }
}
