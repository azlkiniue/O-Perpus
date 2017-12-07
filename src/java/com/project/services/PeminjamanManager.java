/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

//import com.project.models.*;

import com.project.entity.AnggotaModel;
import com.project.entity.BukuModel;
import com.project.entity.DendaModel;
import com.project.entity.PeminjamanDetailModel;
import com.project.entity.PeminjamanMasterModel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author student
 */
@Service
public class PeminjamanManager {
    
    @PersistenceContext
    protected EntityManager peminjamanManager;
    
    @Transactional
    public void createPeminjaman(PeminjamanMasterModel masterModel){
        int no_transaksi = (int) peminjamanManager.createNativeQuery("SELECT MAX(no_transaksi) FROM peminjaman_master").getSingleResult() + 1;
        masterModel.setAnggotaModel(peminjamanManager.find(AnggotaModel.class, masterModel.getId_anggota()));
        String buku_list[] = masterModel.getId_buku().split(", ");
        List<PeminjamanDetailModel> temp = new ArrayList<>();
        for (String id_buku : buku_list) {
            PeminjamanDetailModel detailModel = new PeminjamanDetailModel();
            detailModel.setBukuModel(peminjamanManager.find(BukuModel.class, Integer.parseInt(id_buku)));
            detailModel.setNo_transaksi(no_transaksi);
            detailModel.setId_buku(Integer.parseInt(id_buku));
            detailModel.setPeminjamanMasterModels(masterModel);
            temp.add(detailModel);
            peminjamanManager.createNamedQuery("Buku.setPinjam").setParameter("id_buku", Integer.parseInt(id_buku)).executeUpdate();
        }
        masterModel.setPeminjamanDetailModels(temp);
        peminjamanManager.persist(masterModel);
        temp.stream().forEach((PeminjamanDetailModel detailModel) -> {
            peminjamanManager.persist(detailModel);
        });
    }
    
    @Transactional
    public void updatePeminjamanMaster(PeminjamanMasterModel object){
        peminjamanManager.merge(object);
    }
    
    @Transactional
    public void deletePeminjamanMaster(int id){
        PeminjamanMasterModel object = peminjamanManager.find(PeminjamanMasterModel.class, id);
        peminjamanManager.remove(object);
    }
    
    @Transactional
    public List<PeminjamanMasterModel> selectAll(){
        return peminjamanManager.createNamedQuery("PeminjamanMaster.findAll").getResultList();
    }
    
    @Transactional
    public PeminjamanDetailModel createPeminjamanDetail(int no_transaksi, int id_buku){
        PeminjamanDetailModel object = new PeminjamanDetailModel();
        object.setNo_transaksi(no_transaksi);
        object.setId_buku(id_buku);
        peminjamanManager.persist(object);
        return object;
    }
    
    @Transactional
    public PeminjamanDetailModel getPeminjamanDetailModelById(int id){
        return peminjamanManager.find(PeminjamanDetailModel.class, id);
    }
    
    @Transactional
    public void updatePeminjamanDetail(PeminjamanDetailModel object){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        object.setTgl_kembali(dateFormat.format(new java.util.Date()));
        peminjamanManager.merge(object);
        peminjamanManager.createNamedQuery("Buku.setKembali").setParameter("id_buku", object.getId_buku()).executeUpdate();
        //peminjamanDetailManager.flush();
    }
    
    @Transactional
    public void createDenda(int id_anggota, int id_buku, int jenis_denda, int biaya){
        DendaModel object = new DendaModel();
        object.setBiaya(biaya);
        object.setJenis_denda(jenis_denda);
        object.setId_buku(id_buku);
        object.setId_anggota(id_anggota);
        object.setAnggotaModel(peminjamanManager.find(AnggotaModel.class, id_anggota));
        object.setBukuModel(peminjamanManager.find(BukuModel.class, id_buku));
        peminjamanManager.persist(object);
    }
    
    @Transactional
    public int getLastNo_transaksi(){
        return (int) peminjamanManager.createNativeQuery("SELECT MAX(no_transaksi) FROM peminjaman_master").getSingleResult();
    }
}
