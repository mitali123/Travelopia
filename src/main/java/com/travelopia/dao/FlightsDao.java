/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.dao;

import com.travelopia.pojo.Flights;
import com.travelopia.pojo.Seats;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.persistence.EntityManager;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author manja    
 */
public class FlightsDao {
     private Session session=null;
    private List<String> resultList = new ArrayList<String>();
    private static final SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();   
    private Session getSession(){
       if(session==null || !session.isOpen()){
           session = sf.openSession();
       }
       return session;
    }
    public int addFlight(String flightnum, String source, String destination, String date, String time, String airline, String b_cost, String e_cost)
    {
        int flightId = 0;
        try {
            getSession().beginTransaction();
            Flights flight = new Flights(flightnum,source,destination,airline,date,time);
            Set<Seats> seatSet = new HashSet();
            //business class 16 seats -1A,1B,1C,1D -- 4A,4B,4C,4D
             //economy 171 - 5A,5B,5C,5D,5E,5F -- 34A,34B,34C,34D,34E,34F
             //airbus A321
             
            
             String seat_type = null;
             String status = "Available";
             //add business class seats
             for(int i = 1;i<=4;i++)
             {
                 
                 for(char alpha = 'A'; alpha <= 'D'; alpha++)
                 {
                     String seatNum = Integer.toString(i).concat(String.valueOf(alpha));
                     //System.out.println("alpha:"+alpha);
//                     String sec = String.valueOf(alpha);
//                     seat_no.concat(sec);
                     System.out.println(" adding seatno:"+seatNum);
                     seat_type = "Business";
                     seatSet.add(new Seats(seatNum, seat_type, b_cost, status, flight));       
                 }
             }
             //add economy class seats
             for(int j = 5;j<=34;j++)
             {
             
                 for(char alph = 'A'; alph <= 'F'; alph++)
                 {
                     String seatNum = Integer.toString(j).concat(String.valueOf(alph));
                     //seat_no.concat(Character.toString(alpha1));
                     System.out.println(" adding seatno:"+seatNum);
                     seat_type = "Economy";
                     seatSet.add(new Seats(seatNum, seat_type, e_cost, status, flight));       
                 }
             }
            flight.setSeatSet(seatSet);
            flightId = (Integer)getSession().save(flight);
            getSession().getTransaction().commit();
             
        } catch (HibernateException e) {
            e.printStackTrace();
            getSession().getTransaction().rollback();
        } finally {
            getSession().close();
        }       
       return flightId;
    }
    public int removeFlight(int flightId)
    {
        int result1 = 0;
        try {
                //delete seats of flight
              getSession().beginTransaction();
              String q1 = "delete from Seats where flightid = :flightId";
              Query q3 = session.createQuery(q1);
              q3.setParameter("flightId", flightId);
              q3.executeUpdate();
              //delete flight
              
              //check if flight obj exists
              Query query = getSession().createQuery("from Flights where flightid = :flightId");
              
              String q = "delete from Flights where flightid = :flightId";
              Query q2 = session.createQuery(q);
              q2.setParameter("flightId", flightId);
              result1 = q2.executeUpdate();
             // System.out.println("rows affected from delete:"+result1);
              getSession().getTransaction().commit();

        } 
        catch (Exception e) {
            result1 = 0;
            e.printStackTrace();
            getSession().getTransaction().rollback();
        }
        finally
        {
            getSession().close();
        }
        return result1;
    }
    
    public ArrayList<Flights> listFlights(){
       ArrayList<Flights> flightList = new ArrayList<>();
       try{
           getSession().beginTransaction();
           Query query = getSession().createQuery("from Flights");           
           flightList = (ArrayList<Flights>) query.list();
           getSession().getTransaction().commit();           
       }
       catch (HibernateException e) {
            e.printStackTrace();
            getSession().getTransaction().rollback();
        } 
       finally {
            getSession().close();
        }          
       return flightList;
       
   }
    
    public int updateFlight(int flightId, Map<String,String> flightParam){
       int result = 0;
        try {
             ArrayList<Flights> flightList = new ArrayList<>();
            getSession().beginTransaction();
       Query q4 = getSession().createQuery("from Flights where flightid = :flightId");
       q4.setParameter("flightId", flightId);
       flightList = (ArrayList<Flights>)q4.list();
       for(int i = 0;i<flightList.size();i++)
       {
           Flights f = flightList.get(i);
           System.out.println("flightdetail:"+f.getAirline()+f.getDdate()+f.getDestination());
           Set<Seats> seatSet = f.getSeatSet();
           f.setFlightnum(flightParam.get("flightnum"));
           f.setAirline(flightParam.get("airline"));
           f.setDdate(flightParam.get("ddate"));
           f.setDestination(flightParam.get("destination"));
           f.setSource(flightParam.get("source"));
           f.setTtime((flightParam.get("ttime")));
     
           Iterator<Seats> itr = seatSet.iterator();
            while(itr.hasNext())
            { 
                Seats s = itr.next();
                if(s.getSeat_type().equalsIgnoreCase("Business"))
                {
                    s.setCost(flightParam.get("b_cost"));
                }
                else if(s.getSeat_type().equalsIgnoreCase("Economy"))
                {
                    s.setCost(flightParam.get("e_cost"));
                }
              
            }
            f.setSeatSet(seatSet);
            getSession().update(f);
            getSession().getTransaction().commit();
       }
             result = 1; 
        } 
        catch (HibernateException e) {
            result = 0;
            e.printStackTrace();
            getSession().getTransaction().rollback();
        } 
       finally {
            getSession().close();
        }  
 
       return result;
   }
    
    public ArrayList<Flights> getflightlist(String source, String destination, String ddate)
    {
        ArrayList<Flights> flist = new ArrayList<>();
        try {
            getSession().beginTransaction();
            
            Query q5 = getSession().createQuery("from Flights where source = :source AND destination = :destination AND ddate = :ddate");
            q5.setParameter("source", source);
            q5.setParameter("destination", destination);
            q5.setParameter("ddate", ddate);
            flist = (ArrayList<Flights>)q5.list();
            getSession().getTransaction().commit();
            
        } 
        catch (Exception e) 
        {
             e.printStackTrace();
            getSession().getTransaction().rollback();
        }
        finally
        {
            getSession().close();
        }
        return flist;
    }
    
}
