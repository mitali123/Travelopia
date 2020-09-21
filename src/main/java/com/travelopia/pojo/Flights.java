/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author manja
 */
@Entity
public class Flights implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int flightid;
    String flightnum;
    String source;
    String destination;
    String airline;
    String ddate;
    String ttime;

    public Flights() {
    }
    public Flights(String flightnum, String source, String destination, String airline, String ddate, String ttime) {
        this.flightnum = flightnum;
        this.source = source;
        this.destination = destination;
        this.airline = airline;
        this.ddate = ddate;
        this.ttime = ttime;
    }

    public String getFlightnum() {
        return flightnum;
    }

    public void setFlightnum(String flightnum) {
        this.flightnum = flightnum;
    }


    
    public int getFlightid() {
        return flightid;
    }

    public void setFlightid(int flightid) {
        this.flightid = flightid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getDdate() {
        return ddate;
    }

    public void setDdate(String ddate) {
        this.ddate = ddate;
    }

    public String getTtime() {
        return ttime;
    }

    public void setTtime(String ttime) {
        this.ttime = ttime;
    }
    
    @OneToMany(mappedBy="flight", orphanRemoval = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    Set<Seats> seatSet = new HashSet();

    public Set getSeatSet() {
        return seatSet;
    }

    public void setSeatSet(Set seatSet) {
        this.seatSet = seatSet;
    }

    @OneToMany(mappedBy="flight", orphanRemoval = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    Set<FlightBooking> bookingSet = new HashSet();

    public Set<FlightBooking> getBookingSet() {
        return bookingSet;
    }

    public void setBookingSet(Set<FlightBooking> bookingSet) {
        this.bookingSet = bookingSet;
    }
    
    
   

}
