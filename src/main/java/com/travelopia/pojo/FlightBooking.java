/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.pojo;

import java.io.Serializable;
import java.util.ArrayList;
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
public class FlightBooking implements Serializable{
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
     private int bookingid;
     
     private ArrayList<String> seat_num_list;
     private int cost;
     private String status;

    public int getBookingid() {
        return bookingid;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    @ManyToOne
    @JoinColumn(name = "flightid" , foreignKey = @ForeignKey(name = "FLIGHT_BOOKING_FK"))
    private Flights flight;
    
    @ManyToOne
    @JoinColumn(name = "userid" , foreignKey = @ForeignKey(name = "USER_BOOKING_FK"))
    private Users user;

    public Flights getFlight() {
        return flight;
    }

    public void setFlight(Flights flight) {
        this.flight = flight;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
    

    public ArrayList<String> getSeat_num_list() {
        return seat_num_list;
    }

    public void setSeat_num_list(ArrayList<String> seat_num_list) {
        this.seat_num_list = seat_num_list;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
     
     
}
