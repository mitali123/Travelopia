/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.dao;

import com.travelopia.pojo.FlightBooking;
import com.travelopia.pojo.Flights;
import com.travelopia.pojo.Seats;
import com.travelopia.pojo.Users;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author manja
 */
public class BookingDao {
    private Session session=null;
    private List<String> resultList = new ArrayList<String>();
    private static final SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();   
    private Session getSession(){
       if(session==null || !session.isOpen()){
           session = sf.openSession();
       }
       return session;
    }
    public FlightBooking bookflight(String username,String flightid, String numSeats, String seatclass)
    {
        try {
            int flightid1 = Integer.valueOf(flightid);
            getSession().beginTransaction();
            int numSeats1 = Integer.valueOf(numSeats);
            Query q = getSession().createQuery("from Flights where flightid = :flightid");
            q.setParameter("flightid", flightid1);
            ArrayList<Flights> flist = (ArrayList<Flights>)q.list();
            Flights f = flist.get(0);
            Set<Seats> seatSet = f.getSeatSet();
            Iterator<Seats> itr = seatSet.iterator();
            ArrayList<String> bookedseatsnum = new ArrayList<String>();
            int count = 1;
            int cost = 0;
            while(itr.hasNext())
            {
                if(count > numSeats1)
                    break;
                
                Seats s = itr.next();
                if(s.getSeat_type().equalsIgnoreCase(seatclass) && s.getStatus().equalsIgnoreCase("Available"))
                {
                    bookedseatsnum.add(s.getSeatNum());
                    cost = cost + Integer.valueOf(s.getCost());
                    count++;
                }
            }
            
            Query q1 = getSession().createQuery("from Users where username = :username");
            q1.setParameter("username", username);
            ArrayList<Users> ulist = (ArrayList<Users>)q1.list();
            Users user = ulist.get(0);
            FlightBooking fbook = new FlightBooking();
            fbook.setFlight(f);
            fbook.setUser(user);
            fbook.setSeat_num_list(bookedseatsnum);
            fbook.setCost(cost);
            fbook.setStatus("payment_pending");
            getSession().save(fbook);
            getSession().getTransaction().commit();
            
            return fbook;
        }
        catch (Exception e) {
            e.printStackTrace();
            getSession().getTransaction().rollback();
            return null;
        }
        finally
        {
            getSession().close();
        }
        
    }
    
    public int confirmBooking(int bookingid)
    {
       
        int success = 0;
        try
        {
            getSession().getTransaction().begin();
            Query q = getSession().createQuery("from FlightBooking where bookingid = :bookingid");
            q.setParameter("bookingid", bookingid);
            ArrayList<FlightBooking> fblist = (ArrayList<FlightBooking>)q.list();
            FlightBooking fb = fblist.get(0);
            fb.setStatus("payment_done");
            ArrayList<String> seatNumList = fb.getSeat_num_list();
            Set<Seats> seatSet = fb.getFlight().getSeatSet();
            Iterator<Seats> itr = seatSet.iterator();
            while(itr.hasNext())
            {
                Seats s = itr.next();
                for(int i = 0; i<seatNumList.size();i++)
                {
                    String seat_num = seatNumList.get(i);
                
                    if(s.getSeatNum().equalsIgnoreCase(seat_num))
                    {
                        s.setStatus("Booked");
                        getSession().save(s);
                    }
                }
            }
            getSession().save(fb);
            getSession().getTransaction().commit();
            success = 1;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            getSession().getTransaction().rollback();
            success = 0;
        }
        finally
        {
            getSession().close();
        }
        return success;
    }
    
    public void SendEmail(String username) throws EmailException 
    {
		try {
                    //get email from username
                    getSession().getTransaction().begin();
                    Query q = getSession().createQuery("select email from Users where username = :username");
                    q.setParameter("username", username);
                    ArrayList<String> emaillist = (ArrayList<String>)q.list();
                    String emailid = emaillist.get(0);
                    
			Email email = new SimpleEmail();
			email.setHostName("smtp.gmail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("travelopia123webtools@gmail.com", "travelopia1_123"));
			email.setSSLOnConnect(true);
			email.setFrom("no-reply@travelopia");
			email.setSubject("Your booking is confirmed");
			email.setMsg("Your booking is confirmed.");
			email.addTo(emailid);
			email.send();
		} 
                catch (Exception e) {
			 e.printStackTrace();
		}
	}
}
