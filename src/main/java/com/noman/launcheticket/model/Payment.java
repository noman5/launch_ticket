/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.noman.launcheticket.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author noman
 */
@Entity
public class Payment implements Serializable{
    
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int paymentid;
    @Column
    int resid;
    @Column
    int launchid;
    @Column
    int qty;
    @Column
    int fareid;
    @Column
    double fareamt;
    @Column
    double total;

    public int getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid = paymentid;
    }

    public int getResid() {
        return resid;
    }

    public void setResid(int resid) {
        this.resid = resid;
    }

    public int getLaunchid() {
        return launchid;
    }

    public void setLaunchid(int launchid) {
        this.launchid = launchid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getFareid() {
        return fareid;
    }

    public void setFareid(int fareid) {
        this.fareid = fareid;
    }

    public double getFareamt() {
        return fareamt;
    }

    public void setFareamt(double fareamt) {
        this.fareamt = fareamt;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
