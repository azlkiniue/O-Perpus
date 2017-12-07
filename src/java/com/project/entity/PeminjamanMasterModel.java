/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.entity;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author student
 */
@Entity
@Table(name = "peminjaman_master")
@NamedQuery(name = "PeminjamanMaster.findAll", query = "SELECT p FROM PeminjamanMasterModel p")
public class PeminjamanMasterModel implements Serializable {
    private int no_transaksi;
    private int id_anggota;
    private String tgl_pinjam;
    
    private List<PeminjamanDetailModel> peminjamanDetailModels;
    private AnggotaModel anggotaModel;
    
    private String id_buku; //list buku

    public PeminjamanMasterModel() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.tgl_pinjam=dateFormat.format(new java.util.Date());
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "no_transaksi")
    public int getNo_transaksi() {
        return no_transaksi;
    }

    public void setNo_transaksi(int no_transaksi) {
        this.no_transaksi = no_transaksi;
    }

    @Column(name = "id_anggota")
    public int getId_anggota() {
        return id_anggota;
    }

    public void setId_anggota(int id_anggota) {
        this.id_anggota = id_anggota;
    }

    @Column(name = "tgl_pinjam")
    public String getTgl_pinjam() {
        return tgl_pinjam;
    }

    public void setTgl_pinjam(String tgl_pinjam) {
        this.tgl_pinjam = tgl_pinjam;
    }
    
    @OneToMany(mappedBy = "peminjamanMasterModels", cascade = CascadeType.PERSIST)
    public List<PeminjamanDetailModel> getPeminjamanDetailModels() {
        return peminjamanDetailModels;
    }

    public void setPeminjamanDetailModels(List<PeminjamanDetailModel> peminjamanDetailModels) {
        this.peminjamanDetailModels = peminjamanDetailModels;
    }

    @OneToOne(targetEntity = AnggotaModel.class)
    @PrimaryKeyJoinColumn(name = "id_anggota", referencedColumnName = "id")
    public AnggotaModel getAnggotaModel() {
        return anggotaModel;
    }

    public void setAnggotaModel(AnggotaModel anggotaModel) {
        this.anggotaModel = anggotaModel;
    }

//    @Override
//    public String toString() {
//        return "PeminjamanMasterModel{" + "no_transaksi=" + no_transaksi + ", id_anggota=" + id_anggota + ", tgl_pinjam=" + tgl_pinjam + ", peminjamanDetailModels=" + peminjamanDetailModels + ", anggotaModel=" + anggotaModel + ", id_buku=" + id_buku + '}';
//    }

    @Transient
    public String getId_buku() {
        return id_buku;
    }

    public void setId_buku(String id_buku) {
        this.id_buku = id_buku;
    }
    
}
