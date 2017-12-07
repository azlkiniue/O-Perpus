/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "denda")
@NamedQuery(name = "Denda.findAll", query = "SELECT d FROM DendaModel d")
public class DendaModel implements Serializable {
    private int no_transaksi;
    private int id_buku;
    private int id_anggota;
    private int jenis_denda;
    private int biaya;
    private int bayar;
    
    private AnggotaModel anggotaModel;
    private BukuModel bukuModel;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Column(name = "id_anggota")
    public int getId_anggota() {
        return id_anggota;
    }

    public void setId_anggota(int id_anggota) {
        this.id_anggota = id_anggota;
    }

    @Column(name = "jenis_denda")
    public int getJenis_denda() {
        return jenis_denda;
    }

    public void setJenis_denda(int jenis_denda) {
        this.jenis_denda = jenis_denda;
    }

    @Column(name = "biaya")
    public int getBiaya() {
        return biaya;
    }

    public void setBiaya(int biaya) {
        this.biaya = biaya;
    }

    @Column(name = "bayar")
    public int getBayar() {
        return bayar;
    }

    public void setBayar(int bayar) {
        this.bayar = bayar;
    }
    
    @ManyToOne(targetEntity = AnggotaModel.class, fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn(name = "id_anggota", referencedColumnName = "id")
    public AnggotaModel getAnggotaModel() {
        return anggotaModel;
    }

    public void setAnggotaModel(AnggotaModel anggotaModel) {
        this.anggotaModel = anggotaModel;
    }

    @ManyToOne(targetEntity = BukuModel.class, fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn(name = "id_buku", referencedColumnName = "id")
    public BukuModel getBukuModel() {
        return bukuModel;
    }

    public void setBukuModel(BukuModel bukuModel) {
        this.bukuModel = bukuModel;
    }
}
