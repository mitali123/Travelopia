/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.pojo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author manja
 */
@Entity
public class Seats implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int seatid;
    
    private String seatNum;
    private String seat_type;
    private String cost;
    private String status;

    public Seats() {
    }

    
    public Seats(String seatNum, String seat_type, String cost, String status, Flights flight) {
        this.seatNum = seatNum;
        this.seat_type = seat_type;
        this.cost = cost;
        this.status = status;
        this.flight = flight;
    }
    
    @ManyToOne
    @JoinColumn(name = "flightid" , foreignKey = @ForeignKey(name = "FLIGHT_ID_FK"))
    private Flights flight;

    

    public int getSeatid() {
        return seatid;
    }

    public void setSeatid(int seatid) {
        this.seatid = seatid;
    }

    public String getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(String seatNum) {
        this.seatNum = seatNum;
    }

    public String getSeat_type() {
        return seat_type;
    }

    public void setSeat_type(String seat_type) {
        this.seat_type = seat_type;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Flights getFlight() {
        return flight;
    }

    public void setFlight(Flights flight) {
        this.flight = flight;
    }
    
    
}
