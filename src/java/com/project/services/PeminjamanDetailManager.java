/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

//import com.project.models.*;

import com.project.entity.PeminjamanDetailModel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class PeminjamanDetailManager {
    @PersistenceContext
    protected EntityManager peminjamanDetailManager;

    public PeminjamanDetailManager() {
        this.peminjamanDetailManager = Persistence.createEntityManagerFactory("JPALibraryPU").createEntityManager();
    }
    
    @Transactional
    public void createPeminjamanDetail(PeminjamanDetailModel object){
        peminjamanDetailManager.persist(object);
    }
    
    @Transactional
    public void deletePeminjamanDetail(int id){
        PeminjamanDetailModel object = peminjamanDetailManager.find(PeminjamanDetailModel.class, id);
        peminjamanDetailManager.remove(object);
    }
    
    @Transactional
    public List<PeminjamanDetailModel> selectAll(){
        return peminjamanDetailManager.createNamedQuery("PeminjamanDetail.findAll").getResultList();
    }
}
