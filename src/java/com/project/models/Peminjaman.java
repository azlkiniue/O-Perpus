/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.models;

import java.sql.Date;

/**
 *
 * @author Diknas 113
 */
public class Peminjaman {
    private Long jumlah;
    private Date tgl_pinjam;

    public Peminjaman(Long jumlah, Date tgl_pinjam) {
        this.jumlah = jumlah;
        this.tgl_pinjam = tgl_pinjam;
    }

    public Long getJumlah() {
        return jumlah;
    }

    public void setJumlah(Long jumlah) {
        this.jumlah = jumlah;
    }

    public Date getTgl_pinjam() {
        return tgl_pinjam;
    }

    public void setTgl_pinjam(Date tgl_pinjam) {
        this.tgl_pinjam = tgl_pinjam;
    }
}
