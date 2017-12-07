/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

//import com.project.models.*;

import com.project.entity.BukuModel;
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
public class BukuManager {

    @PersistenceContext
    protected EntityManager bukuManager;

    public BukuManager() {
        bukuManager = Persistence.createEntityManagerFactory("JPALibraryPU").createEntityManager();
    }

    @Transactional
    public void createBukuModel(BukuModel object) {
        int id = (int) bukuManager.createNativeQuery("SELECT MAX(id) FROM buku").getSingleResult();
        object.setId(id + 1);
        bukuManager.persist(object);
    }

    @Transactional
    public void updateBukuModel(BukuModel object) {
        bukuManager.merge(object);
    }

    @Transactional
    public void deleteBukuModel(int id) {
        BukuModel object = bukuManager.find(BukuModel.class, id);
        bukuManager.remove(object);
    }
    
    @Transactional
    public BukuModel getBukuModelById(int id){
        return bukuManager.find(BukuModel.class, id);
    }

    @Transactional
    public List<BukuModel> selectAll() {
        return bukuManager.createNamedQuery("Buku.findAll").getResultList();
    }    
}
