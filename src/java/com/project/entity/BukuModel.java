/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author student
 */
@Entity
@Table(name = "buku")
@NamedQueries({
    @NamedQuery(name = "Buku.findAll", query = "SELECT b FROM BukuModel b"),
    @NamedQuery(name = "Buku.setPinjam", query = "UPDATE BukuModel b SET b.status = 1 WHERE b.id = :id_buku"),
    @NamedQuery(name = "Buku.setKembali", query = "UPDATE BukuModel b SET b.status = 0 WHERE b.id = :id_buku")
})
public class BukuModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "tahun")
    private int tahun;
    @Column(name = "status")
    private int status;
    @Column(name = "harga")
    private int harga;
    @Column(name = "judul")
    private String judul;
    @Column(name = "penerbit")
    private String penerbit;
    @Column(name = "penulis")
    private String penulis;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTahun() {
        return tahun;
    }

    public void setTahun(int tahun) {
        this.tahun = tahun;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getPenerbit() {
        return penerbit;
    }

    public void setPenerbit(String penerbit) {
        this.penerbit = penerbit;
    }

    public String getPenulis() {
        return penulis;
    }

    public void setPenulis(String penulis) {
        this.penulis = penulis;
    }

    @Override
    public String toString() {
        return "BukuModel{" + "id=" + id + ", tahun=" + tahun + ", status=" + status + ", harga=" + harga + ", judul=" + judul + ", penerbit=" + penerbit + ", penulis=" + penulis + '}';
    }
    
}
