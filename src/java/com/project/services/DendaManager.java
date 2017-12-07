/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

//import com.project.models.*;

import com.project.entity.DendaModel;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author student
 */
@Service
public class DendaManager {
    @PersistenceContext
    protected EntityManager dendaManager;

    public DendaManager() {
        this.dendaManager = Persistence.createEntityManagerFactory("JPALibraryPU").createEntityManager();
    }
    
    @Transactional
    public void updateDenda(int id, int bayar){
        DendaModel dendaModel = dendaManager.find(DendaModel.class, id);
        dendaModel.setBayar(bayar);
        dendaManager.merge(dendaModel);
    }
    
    @Transactional
    public void deleteDenda(int id){
        DendaModel object = dendaManager.find(DendaModel.class, id);
        dendaManager.remove(object);
    }
    
    @Transactional
    public List<DendaModel> selectAll(){
        return dendaManager.createNamedQuery("Denda.findAll").getResultList();
    }
}
