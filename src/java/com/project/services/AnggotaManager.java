/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

import com.project.entity.AnggotaModel;
//import com.project.models.*;
import java.util.List;
import javax.persistence.EntityManager;
//import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
//import javax.persistence.PersistenceUnit;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author student
 */
@Service
public class AnggotaManager {

    @PersistenceContext
    protected EntityManager anggotaManager;

    public AnggotaManager() {
        anggotaManager = Persistence.createEntityManagerFactory("JPALibraryPU").createEntityManager();
    }

    @Transactional
    public void createAnggotaModel(AnggotaModel object) {
//        EntityTransaction tx = anggotaManager.getTransaction();
//        tx.begin();
        int id = (int) anggotaManager.createNativeQuery("SELECT MAX(id) FROM anggota").getSingleResult();
        object.setId(id + 1);
        anggotaManager.persist(object);
//        tx.commit();
    }

    @Transactional
    public void updateAnggotaModel(AnggotaModel object) {
//        EntityTransaction tx = anggotaManager.getTransaction();
//        tx.begin();
        anggotaManager.merge(object);
//        tx.commit();
    }

    @Transactional
    public void deleteAnggotaModel(int id) {
//        EntityTransaction tx = anggotaManager.getTransaction();
//        tx.begin();
        AnggotaModel object = anggotaManager.find(AnggotaModel.class, id);
//        if(!anggotaManager.contains(object))
//        {
//            object=anggotaManager.merge(object);
//        }
        anggotaManager.remove(object);
//        tx.commit();
    }
    
    @Transactional
    public AnggotaModel getAnggotaModelById(int id){
        return anggotaManager.find(AnggotaModel.class, id);
    }

    @Transactional
    public List<AnggotaModel> selectAll() {
        return anggotaManager.createNamedQuery("Anggota.findAll").getResultList();
    }
}
