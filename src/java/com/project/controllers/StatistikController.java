/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author student
 */
@Controller
public class StatistikController {
    @RequestMapping("/statistik")
    public String index(Model model) {        
        return "tabelStatistik";
    }
}
