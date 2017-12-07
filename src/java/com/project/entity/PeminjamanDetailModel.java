/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author student
 */
@Entity
@Table(name = "peminjaman_detail")
@NamedQuery(name = "PeminjamanDetail.findAll", query = "SELECT p FROM PeminjamanDetailModel p")
public class PeminjamanDetailModel implements Serializable {
    
    private int id;
    private int no_transaksi;
    private int id_buku;
    private String tgl_kembali;
    
    private PeminjamanMasterModel peminjamanMasterModels;
    private BukuModel bukuModel;

    @Column(name = "no_transaksi")
    public int getNo_transaksi() {
        return no_transaksi;
    }

    public void setNo_transaksi(int no_transaksi) {
        this.no_transaksi = no_transaksi;
    }

    @Column(name = "id_buku")
    public int getId_buku() {
        return id_buku;
    }

    public void setId_buku(int id_buku) {
        this.id_buku = id_buku;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "tgl_kembali")
    public String getTgl_kembali() {
        return tgl_kembali;
    }

    public void setTgl_kembali(String tgl_kembali) {
        this.tgl_kembali = tgl_kembali;
    }
    
    @ManyToOne(targetEntity = PeminjamanMasterModel.class, cascade = CascadeType.PERSIST)
    @PrimaryKeyJoinColumn(name = "no_transaksi", referencedColumnName = "no_transaksi")
    public PeminjamanMasterModel getPeminjamanMasterModels() {
        return peminjamanMasterModels;
    }

    public void setPeminjamanMasterModels(PeminjamanMasterModel peminjamanMasterModels) {
        this.peminjamanMasterModels = peminjamanMasterModels;
    }

    @OneToOne(targetEntity = BukuModel.class)
    @PrimaryKeyJoinColumn(name = "id_buku", referencedColumnName = "id")
    public BukuModel getBukuModel() {
        return bukuModel;
    }

    public void setBukuModel(BukuModel bukuModel) {
        this.bukuModel = bukuModel;
    }

    @Override
    public String toString() {
        return "PeminjamanDetailModel{" + "id=" + id + ", no_transaksi=" + no_transaksi + ", id_buku=" + id_buku + ", tgl_kembali=" + tgl_kembali + ", peminjamanMasterModels=" + peminjamanMasterModels + ", bukuModel=" + bukuModel + '}';
    }
    
}
