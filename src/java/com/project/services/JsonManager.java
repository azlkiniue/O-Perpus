/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

import com.project.models.*;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Service;

/**
 *
 * @author Diknas 113
 */
@Service
public class JsonManager {

    @PersistenceContext
    private EntityManager jsonManager;

    public JsonManager() {
        jsonManager = Persistence.createEntityManagerFactory("JPALibraryPU").
                createEntityManager();
    }

    public List<Peminjaman> peminjaman() {
        return jsonManager.createNamedQuery("PeminjamanJSON").getResultList();
    }

    public List<Gender> gender() {
        return jsonManager.createNamedQuery("GenderJSON").getResultList();
    }

    public List<Anggota> anggota() {
        return jsonManager.createNamedQuery("AnggotaJSON").getResultList();
    }

    public List<UmurAnggota> umurAnggota() {
        return jsonManager.createNamedQuery("UmurAnggotaJSON").getResultList();
    }

    public List<Data> dataBuku() {
        return jsonManager.createNamedQuery("DataBukuJSON").getResultList();
    }

    public List<Data> dataAnggota() {
        return jsonManager.createNamedQuery("DataAnggotaJSON").getResultList();
    }
}
