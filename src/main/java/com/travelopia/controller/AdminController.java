/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelopia.controller;

import com.travelopia.dao.FlightsDao;
import com.travelopia.pojo.Flights;
import com.travelopia.pojo.Seats;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author manja
 */
public class AdminController extends AbstractController {
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = null;
        String url = request.getRequestURI();
        System.out.println("url:"+url);
        String[] split = url.split("/");
        String operation = null;
        int result = 0;
        operation = request.getRequestURI().substring(request.getRequestURI().lastIndexOf('/') + 1);
        
        System.out.println("operation: "+operation);
            if(operation!=null){
                switch(operation){
                    
                 case "addFlightsDetails.htm":
                     mv = new ModelAndView("getAddDetails");
                     break;
                     
                 case "updateFlightsDetails.htm":
                     mv = new ModelAndView("getUpdateDetails");
                     break;
                     
                 case "removeFlightsDetails.htm":
                     mv = new ModelAndView("getDeleteDetails");
                     break;
                     
                 case "adminpanel.htm":    
                     mv = new ModelAndView("adminLogin");
                     break;
                     
                case "addFlights.htm":
                    FlightsDao flightdao = new FlightsDao();
                    
                    //add flight
                    int flightId = flightdao.addFlight(request.getParameter("flightnum"),request.getParameter("source"),request.getParameter("destination"),request.getParameter("ddate"),request.getParameter("ttime"),request.getParameter("airline"),request.getParameter("b_cost"),request.getParameter("e_cost"));
                    
//                    int flightId = flightdao.addFlight(flights);
                    if(flightId != 0)
                    {
                        //flight added successfully                        
                        //add seats to the new flight
                       mv = new ModelAndView("flightsuccess");
                    }
                    else
                    {
                            //flight add error
                            mv = new ModelAndView("flighterror");
                    }
                    break;
                    
                case "removeFlights.htm":
                    FlightsDao flightdao1 = new FlightsDao();
                    System.out.print("flightid:"+request.getParameter("flightId"));
                    int flightId1 = Integer.valueOf(request.getParameter("flightId"));
                    int result1 = flightdao1.removeFlight(flightId1);
                    if(result1 != 0)
                    {
                        mv = new ModelAndView("flightsuccess");
                    }
                    else
                    {
                        mv = new ModelAndView("flighterror");
                    }
                    break;
                    
                case "viewFlights.htm":
                    ArrayList<Flights> flist = new ArrayList<>();
                    System.out.println("here");
                    FlightsDao flightsdao2 = new FlightsDao();
                    flist = flightsdao2.listFlights();
                    mv = new ModelAndView("viewFlightsSuccess","flightlist",flist);
                    break;
                    
                case "updateFlights.htm":
                    int flightId2 = Integer.valueOf(request.getParameter("flightId1"));
                    FlightsDao flightdao2 = new FlightsDao();
                    
                    Map<String, String> flightParam = new HashMap<>();
                    flightParam.put("flightnum", request.getParameter("flightnum"));
                    flightParam.put("flightId",request.getParameter("flightId1"));
                    flightParam.put("airline", request.getParameter("airline1"));
                    flightParam.put("ddate", request.getParameter("ddate1"));
                    flightParam.put("ttime", request.getParameter("ttime1"));
                    flightParam.put("source",request.getParameter("source1"));
                    flightParam.put("destination",request.getParameter("destination1"));
                    flightParam.put("b_cost",request.getParameter("b_cost1"));
                    flightParam.put("e_cost",request.getParameter("e_cost1"));
                    int result3 = flightdao2.updateFlight(flightId2,flightParam);
                    if(result3 == 1)
                        mv = new ModelAndView("flightsuccess");
                    else
                        mv =  new ModelAndView("flighterror");                    
                    break;
                   
                }
                    
            }

        return mv;
    }
    
}
