/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.entity.PeminjamanDetailModel;
import com.project.entity.PeminjamanMasterModel;
import com.project.services.PeminjamanManager;
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
@RequestMapping(value = "/peminjaman")
public class PeminjamanController {
    @Autowired
    PeminjamanManager manager = new PeminjamanManager();
//    @Autowired
//    PeminjamanDetailManager manager2 = new PeminjamanDetailManager();
//    @Autowired
//    DendaManager manager3 = new DendaManager();
    
    @RequestMapping(value = "new", method = RequestMethod.GET)
    public ModelAndView formAdd(){
        return new ModelAndView("formPeminjaman", "command", new PeminjamanMasterModel());
    }
    
    @RequestMapping(value = "new", method = RequestMethod.POST)
    public String submitAdd(@ModelAttribute PeminjamanMasterModel peminjamanMasterModel){     
        manager.createPeminjaman(peminjamanMasterModel);
        return "redirect:/peminjaman";
    }
    
    @RequestMapping()
    public String index(Model model){
        model.addAttribute("list", manager.selectAll());
        return "tabelPeminjaman";
    }
    
    @RequestMapping(value = "kembali", method = RequestMethod.GET)
    public String formUpdate(@RequestParam("id")int id, @RequestParam("telat")String telat, Model model){
        model.addAttribute("peminjamanDetailModel", manager.getPeminjamanDetailModelById(id));
        model.addAttribute("telat", telat);
        return "formKembali";
    }
    
    @RequestMapping(value = "kembali", method = RequestMethod.POST)
    public String submitEdit(@RequestParam("telat")String telat, @RequestParam("hilang")String hilang, @RequestParam("id")int id){
        PeminjamanDetailModel peminjamanDetailModel = manager.getPeminjamanDetailModelById(id);
        //System.out.println(peminjamanDetailModel.getId()+"t="+ telat +"h="+ hilang);
        manager.updatePeminjamanDetail(peminjamanDetailModel);
        //peminjamanDetailModel = manager.getPeminjamanDetailModelById(peminjamanDetailModel.getId());
        //manager.setPinjamBuku(peminjamanDetailModel.getId_buku(), 0);
        if(!telat.equals("false") || !hilang.equals("false")){
            if(!telat.equals("false"))
                manager.createDenda(peminjamanDetailModel.getPeminjamanMasterModels().getId_anggota(), peminjamanDetailModel.getId_buku(), 0, Integer.parseInt(telat)*5000);
                //System.out.println(peminjamanDetailModel.getPeminjamanMasterModels().getId_anggota() +" "+ peminjamanDetailModel.getId_buku());
                //manager3.createDenda(peminjamanDetailModel.getPeminjamanMasterModels().getId_anggota(), peminjamanDetailModel.getId_buku(), 0, Integer.parseInt(telat)*5000);
            if(!hilang.equals("false"))
                manager.createDenda(peminjamanDetailModel.getPeminjamanMasterModels().getId_anggota(), peminjamanDetailModel.getId_buku(), 1, Integer.parseInt(hilang));
                //System.out.println("gak hilang!");
                //manager3.createDenda(peminjamanDetailModel.getPeminjamanMasterModels().getId_anggota(), peminjamanDetailModel.getId_buku(), 1, Integer.parseInt(hilang));
        }
        return "redirect:/peminjaman";
    }
}
