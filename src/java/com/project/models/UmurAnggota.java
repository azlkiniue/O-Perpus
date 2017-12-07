/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.models;

/**
 *
 * @author Ahmada Yusril
 */
public class UmurAnggota {
    public String age_range;
    public Long count; 
    public int ordinal;

    public UmurAnggota(String age_range, Long count, int ordinal) {
        this.age_range = age_range;
        this.count = count;
        this.ordinal = ordinal;
    }

    public String getAge_range() {
        return age_range;
    }

    public void setAge_range(String age_range) {
        this.age_range = age_range;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public int getOrdinal() {
        return ordinal;
    }

    public void setOrdinal(int ordinal) {
        this.ordinal = ordinal;
    }
}
