/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import com.project.models.*;
import com.project.services.JsonManager;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author student
 */
@Controller
@RequestMapping("/json")
public class JsonController {
    @Autowired
    JsonManager jsonManager = new JsonManager();
    
    @RequestMapping("peminjaman")
    public String peminjaman(Model model){
        JSONArray list = new JSONArray();
        Iterator<Peminjaman> iter = jsonManager.peminjaman().iterator();
        while (iter.hasNext()) {
            Peminjaman nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("jumlah", nextElement.getJumlah());
            obj.put("tgl_pinjam", String.valueOf(nextElement.getTgl_pinjam()));
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
    
    @RequestMapping("gender")
    public String gender(Model model){
        JSONArray list = new JSONArray();
        Iterator<Gender> iter = jsonManager.gender().iterator();
        while (iter.hasNext()) {
            Gender nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("value", nextElement.getValue());
            obj.put("label", nextElement.getLabel());
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
    
    @RequestMapping("anggota")
    public String anggota(Model model){
        JSONArray list = new JSONArray();
        Iterator<Anggota> iter = jsonManager.anggota().iterator();
        while (iter.hasNext()) {
            Anggota nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("tgl_daftar", String.valueOf(nextElement.getTgl_daftar()));
            obj.put("jumlah", nextElement.getJumlah());
            obj.put("pria", nextElement.getPria());
            obj.put("wanita", nextElement.getWanita());
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
    
    @RequestMapping("umurAnggota")
    public String umurAnggota(Model model){
        JSONArray list = new JSONArray();
        Iterator<UmurAnggota> iter = jsonManager.umurAnggota().iterator();
        while (iter.hasNext()) {
            UmurAnggota nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("age_range", nextElement.getAge_range());
            obj.put("count", nextElement.getCount());
            obj.put("ordinal", nextElement.getOrdinal());
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
    
    @RequestMapping("dataBuku")
    public String dataBuku(Model model){
        JSONArray list = new JSONArray();
        Iterator<Data> iter = jsonManager.dataBuku().iterator();
        while (iter.hasNext()) {
            Data nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("id", nextElement.getId());
            obj.put("value", nextElement.getValue());
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
    
    @RequestMapping("dataAnggota")
    public String dataAnggota(Model model){
        JSONArray list = new JSONArray();
        Iterator<Data> iter = jsonManager.dataAnggota().iterator();
        while (iter.hasNext()) {
            Data nextElement = iter.next();
            JSONObject obj = new JSONObject();
            obj.put("id", nextElement.getId());
            obj.put("value", nextElement.getValue());
            list.add(obj);
        }
        model.addAttribute("result", list.toJSONString());
        return "json";
    }
}
