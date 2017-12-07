/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.models;

import java.sql.Date;

/**
 *
 * @author Ahmada Yusril
 */
public class Anggota {
    public Date tgl_daftar;
    public Long jumlah, pria, wanita;

    public Anggota(Date tgl_daftar, Long jumlah, Long pria, Long wanita) {
        this.tgl_daftar = tgl_daftar;
        this.jumlah = jumlah;
        this.pria = pria;
        this.wanita = wanita;
    }

    public Date getTgl_daftar() {
        return tgl_daftar;
    }

    public void setTgl_daftar(Date tgl_daftar) {
        this.tgl_daftar = tgl_daftar;
    }

    public Long getJumlah() {
        return jumlah;
    }

    public void setJumlah(Long jumlah) {
        this.jumlah = jumlah;
    }

    public Long getPria() {
        return pria;
    }

    public void setPria(Long pria) {
        this.pria = pria;
    }

    public Long getWanita() {
        return wanita;
    }

    public void setWanita(Long wanita) {
        this.wanita = wanita;
    }
    
}
