/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.controller;

import com.travelopia.dao.BookingDao;
import com.travelopia.dao.FlightsDao;
import com.travelopia.dao.UsersDao;
import com.travelopia.pojo.FlightBooking;
import com.travelopia.pojo.Flights;
import com.travelopia.pojo.Seats;
import com.travelopia.pojo.Users;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.faces.view.ViewDeclarationLanguage;
import javax.persistence.DiscriminatorType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author manja
 */
public class UserActivityController extends AbstractController{
    
protected ModelAndView handleRequestInternal(HttpServletRequest request,HttpServletResponse response) throws Exception
{
    HttpSession session = request.getSession(true);
    ModelAndView mv = null;
    String url = request.getRequestURI();
    System.out.println("url:"+url);
    String[] split = url.split("/");
    String operation = null;
    ArrayList<FlightBooking> fbcart = new ArrayList<FlightBooking>();
    int result = 0;
    operation = request.getRequestURI().substring(request.getRequestURI().lastIndexOf('/') + 1);
    UsersDao userdao = new UsersDao();
    System.out.println("operation: "+operation);
            if(operation!=null){
                switch(operation){
                case "loginusersuccess.htm":
                    String username = request.getParameter("username");
                     session.setAttribute("username", username);
                     session.setAttribute("cart", fbcart);
                    mv =  new ModelAndView("indexuser");
                    break;
                    
                case "flights.htm":
//                    String username1 = request.getParameter("username");
//                     session.setAttribute("username", username1);
                    mv =  new ModelAndView("flights");
                    break;
                    
                case "viewflightuser.htm":
                    FlightsDao flightdao = new FlightsDao();
                    String source = request.getParameter("source");
                    String destination = request.getParameter("destination");
                    
                    String trip = request.getParameter("trip");
                    String seatclass = request.getParameter("class");
                    //source and destination shouldnt be same
                    //departuredate and returndate should be after current date
                    //numberformat for numseats
                    if(source.equalsIgnoreCase(destination))
                    {
                        //source and destination should be different
                         mv = new ModelAndView("flightinputerror");
                    }
                    else
                    {
                        //check dates
                        String departureDate = request.getParameter("departureDate");
                        String returnDate = request.getParameter("returnDate");
                        
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
//                        Date date = new Date();
//                        String currdate = formatter.format(date);

                        Date ddate = formatter.parse(departureDate);
                        Date rdate = formatter.parse(returnDate);
                        Date cdate = new Date();
                        //System.out.println(currdate);
                        if(ddate.after(cdate) && rdate.after(cdate))
                        {
                            //date valid
                             try 
                            {
                                //seats valid
                                int numSeats = Integer.parseInt(request.getParameter("numSeats"));
                                //code here
                                 if(trip.equalsIgnoreCase("oneway"))
                    {
                        ArrayList<Flights> flist = new ArrayList<Flights>();
                        flist = flightdao.getflightlist(source,destination,departureDate);
                        try 
                        {
                            if(flist.size() > 0)
                            {
                                for(int i=0;i<flist.size();i++)
                                {
                                    int count = 0;
                                    Flights f = flist.get(i);
                                    Set seatSet = f.getSeatSet();
                                    Iterator<Seats> itr = seatSet.iterator();
                                    while(itr.hasNext())
                                    {
                                         Seats s = itr.next();
                                        if(s.getSeat_type().equalsIgnoreCase(seatclass) && s.getStatus().equalsIgnoreCase("Available"))
                                        {
                                              count++;
                                        }
                                    }
                                    if(count<numSeats)
                                        flist.remove(f);
                                }
                                if(flist.size()>0)
                                {
                                    request.setAttribute("class", seatclass);
                                    request.setAttribute("numSeats", numSeats);
                                    mv = new ModelAndView("viewflightsoneway","flist",flist);
                                }
                                else
                                {
                                    mv = new ModelAndView("viewflighterror");
                                }
                                
                            }
                            else
                            {
                                 mv = new ModelAndView("viewflighterror");
                            }
                        }
                        catch (Exception e) {
                             mv = new ModelAndView("viewflighterror");
                        }
                       
                        
                    }
                    else if(trip.equalsIgnoreCase("roundTrip"))
                    {
                        ArrayList<Flights> dlist = new ArrayList<Flights>();
                        dlist = flightdao.getflightlist(source,destination,departureDate);
                        
                        ArrayList<Flights> rlist = new ArrayList<Flights>();
                        rlist = flightdao.getflightlist(destination,source,returnDate);
                        
                        if(dlist.size() > 0 && rlist.size() > 0)
                        {
                            for(int i=0;i<dlist.size();i++)
                            {
                                int count = 0;
                                Flights f = dlist.get(i);
                                Set seatSet = f.getSeatSet();
                                 Iterator<Seats> itr = seatSet.iterator();
                                 while(itr.hasNext())
                                 {
                                     Seats s = itr.next();
                                     if(s.getSeat_type().equalsIgnoreCase(seatclass) && s.getStatus().equalsIgnoreCase("Available"))
                                     {
                                         count++;
                                     }
                                 }
                                 if(count<numSeats)
                                     dlist.remove(f);
                            }
                            for(int i=0;i<rlist.size();i++)
                            {
                                int count = 0;
                                Flights f = rlist.get(i);
                                Set seatSet = f.getSeatSet();
                                 Iterator<Seats> itr = seatSet.iterator();
                                 while(itr.hasNext())
                                 {
                                     Seats s = itr.next();
                                     if(s.getSeat_type().equalsIgnoreCase(seatclass) && s.getStatus().equalsIgnoreCase("Available"))
                                     {
                                         count++;
                                     }
                                 }
                                 if(count<numSeats)
                                     rlist.remove(f);
                            }
                            request.setAttribute("class", seatclass);
                            request.setAttribute("numSeats", numSeats);
                            Map<String,ArrayList<Flights>> listMap = new HashMap<String, ArrayList<Flights>>();
                            listMap.put("dlist",dlist);
                            listMap.put("rlist", rlist);
                            mv = new ModelAndView("viewflightsroundtrip","listMap",listMap);
                        }
                        else
                        {
                            mv = new ModelAndView("viewflighterror");
                        }
                        
                    }
                  
                            } 
                            catch (Exception e) 
                            {
                                //seats not valid
                                mv = new ModelAndView("flightinputerror");
                            }
                            
                        }
                        else
                        {
                           //date not valid
                            mv = new ModelAndView("flightinputerror");
                        }
                    }
                    
                  break;
                    
                    
                    
                   
                    
                case "bookflight.htm":
                    String username1 = session.getAttribute("username").toString();
                    fbcart = (ArrayList<FlightBooking>)session.getAttribute("cart");
                    String numSeats1 = request.getParameter("numSeats");
                    System.out.println("numseats:"+numSeats1);
                    String seatclass1 = request.getParameter("class");
                    BookingDao bookingdao = new BookingDao();
                    String flightid = request.getParameter("bookflightid");
                    FlightBooking fb = bookingdao.bookflight(username1,flightid,numSeats1,seatclass1);
                    if(fb != null)
                    {
                        int bookingid = fb.getBookingid();
                        fbcart.add(fb);
                        session.setAttribute("cart", fbcart);
                        mv = new ModelAndView("viewflightbooking","bookingid",bookingid);
                    }
                    else
                    {
                        mv = new ModelAndView("viewflighterror");
                    }
                    break;
                
                case "bookroundflight.htm":
                    String username5 = session.getAttribute("username").toString();
                    fbcart = (ArrayList<FlightBooking>)session.getAttribute("cart");
                    String numSeats5 = request.getParameter("numSeats");
                    System.out.println("numseats:"+numSeats5);
                    String seatclass5 = request.getParameter("class");
                    BookingDao bookingdao5 = new BookingDao();
                    String dflightid = request.getParameter("bookdflightid");
                    String rflightid = request.getParameter("bookrflightid");
                    FlightBooking fb5 = bookingdao5.bookflight(username5,dflightid,numSeats5,seatclass5);
                    FlightBooking fb6 = bookingdao5.bookflight(username5,rflightid,numSeats5,seatclass5);
                    if(fb5 != null && fb6 != null)
                    {
                        int dbookingid = fb5.getBookingid();
                        int rbookingid = fb6.getBookingid();
                        fbcart.add(fb5);
                        fbcart.add(fb6);
                        session.setAttribute("cart", fbcart);
                        request.setAttribute("dbookingid", dbookingid);
                        request.setAttribute("rbookingid", rbookingid);
                        mv = new ModelAndView("viewroundflightbooking");
                    }
                    else
                    {
                        mv = new ModelAndView("viewflighterror");
                    }
                    break;
                    
                case "confirmpaymentflight.htm":
                    int bookingid = Integer.valueOf(request.getParameter("bookingid"));
                    BookingDao bd =new BookingDao();
                    int success = bd.confirmBooking(bookingid);
                    fbcart = (ArrayList<FlightBooking>)session.getAttribute("cart");
                    
                    if(success == 1)
                    {
                        
                        for(int i=0;i<fbcart.size();i++)
                        {
                            fb = fbcart.get(i);
                            if(fb.getBookingid() == bookingid)
                            {
                                fbcart.remove(i);
                                fb.setStatus("payment_done");
                                fbcart.add(fb);
                            }
                        }
                        String uname = request.getSession().getAttribute("username").toString();
                        bd.SendEmail(uname);
                        mv = new ModelAndView("flightbookingsuccess","bookingid",bookingid);
                        
                    }
                    else
                    {
                        mv = new ModelAndView("flightbookingerror","bookingid",bookingid);
                    }
                    
                    break;
                    
                 case "confirmrpaymentflight.htm":
                    int dbookingid = Integer.valueOf(request.getParameter("dbookingid"));
                    int rbookingid = Integer.valueOf(request.getParameter("rbookingid"));
                    BookingDao bd6 =new BookingDao();
                    int success6 = bd6.confirmBooking(dbookingid);
                    int success7 = bd6.confirmBooking(rbookingid);
                    fbcart = (ArrayList<FlightBooking>)session.getAttribute("cart");
                    
                    if(success6 == 1 && success7 == 1)
                    {
                        for(int i=0;i<fbcart.size();i++)
                        {
                            fb = fbcart.get(i);
                            if(fb.getBookingid() == dbookingid)
                            {
                                fbcart.remove(i);
                                fb.setStatus("payment_done");
                                fbcart.add(fb);
                            }
                        }
                        for(int i=0;i<fbcart.size();i++)
                        {
                            fb = fbcart.get(i);
                            if(fb.getBookingid() == rbookingid)
                            {
                                fbcart.remove(i);
                                fb.setStatus("payment_done");
                                fbcart.add(fb);
                            }
                        }
                        String uname = request.getSession().getAttribute("username").toString();
                        bd6.SendEmail(uname);
                        request.setAttribute("dbookingid", dbookingid);
                        request.setAttribute("rbookingid", rbookingid);
                        mv = new ModelAndView("flightrbookingsuccess");
                    }
                    else
                    {
                        mv = new ModelAndView("flightbookingerror");
                    }
                    
                    break;    
                    
                case "viewcart.htm":
                    try {
                      String username2 = session.getAttribute("username").toString();
                       mv = new ModelAndView("viewCart");
                } 
                    catch (Exception e) {
                        mv = new ModelAndView("notloggedin");
                }
                  
                    break;
                    
                case "removefromcart.htm":
                try 
                {
                    fbcart = (ArrayList<FlightBooking>)request.getSession().getAttribute("cart");
                    int bookingid8 = Integer.valueOf(request.getParameter("bookingid"));
                    
                        for(int i=0;i<fbcart.size();i++)
                        {
                            fb = fbcart.get(i);
                            if(fb.getBookingid() == bookingid8)
                            {
                                fbcart.remove(i);
                            }
                        }
                    request.getSession().setAttribute("cart", fbcart);
                    mv = new ModelAndView("viewCart");
                }
                catch(Exception e) 
                {
                    e.printStackTrace();
                }
                break;
                
                case "logout.htm":
                    try 
                    {
                        request.getSession(false).removeAttribute("username");
                        request.getSession(false).removeAttribute("cart");
                        mv = new ModelAndView("index");
                     } 
                    catch (Exception e) 
                    {
                        System.out.println("e");
                    }
                    break;
               
                    
                }    
            }
return mv;
}

}
