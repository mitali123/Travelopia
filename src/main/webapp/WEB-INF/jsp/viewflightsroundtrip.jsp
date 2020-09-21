<%-- 
    Document   : viewflightsoneway
    Created on : Apr 16, 2020, 9:55:18 AM
    Author     : manja
--%>

<%@page import="java.util.Map"%>
<%@page import="com.travelopia.pojo.Seats"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travelopia.pojo.Flights"%>
<%@page import="java.util.Set"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <title>Travelopia</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
	   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.htm"><span>Travelopia</span></a>
<!--	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
              </button>-->
              <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
                 <li class="nav-item">
                    <form action="./logout.htm" method="POST">
                        <button type="submit" class="btn login_btn_menu" style="background-color: #ffb400;" >Log Out</button>
                    </form>
                  </li>
                  <li class="nav-item">
                    <form action="./index.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="Home">Home</button>
                    </form>
                  </li>
                  <li class="nav-item active">
                    <form action="./flights.htm" method="POST">
                      <button type="submit" class="btn  login_btn_menu" value="Flights">Flights</button>
                    </form>
                  </li>

                  <li class="nav-item">
                  <form action="./viewcart.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="View Cart">View <c:out value="${sessionScope.username}"/>'s Cart</button>
                  </form>
                  </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
     <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/flight2.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;">Flight Search Results</h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
                    <%  out.print("<form action='./bookroundflight.htm' method='POST'>");
                        Map<String,ArrayList<Flights>> fmap = (Map<String, ArrayList<Flights>>)request.getAttribute("listMap");
                        ArrayList<Flights> dlist = fmap.get("dlist");
                        ArrayList<Flights> rlist = fmap.get("rlist");
                        
                        String seatclass = request.getAttribute("class").toString();
                        int numSeats = Integer.valueOf(request.getAttribute("numSeats").toString());
                        String cost = null;
                        String source = null;
                        String destination = null;
                        String date = null;
                        String time = null;
                        String airline = null;
                        String flightnum = null;
                        int dflightid = 0;
                        
                        for(int i =0;i<dlist.size();i++)
                        {
                            Flights f = dlist.get(i);
                            source = f.getSource();
                            dflightid = f.getFlightid();
                            airline = f.getAirline();
                            destination = f.getDestination();
                            date = f.getDdate();
                            time = f.getTtime();
                            flightnum = f.getFlightnum();
                            
                            //get seats cost
                            Set seatSet = f.getSeatSet();
                              Iterator<Seats> itr = seatSet.iterator();
                              while(itr.hasNext())
                              {
                                  Seats s = itr.next();
                                 if(s.getSeat_type().equalsIgnoreCase(seatclass))
                                     cost = s.getCost();
                               }
                              //display this
                    %>
                    <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source); %> to <% out.print(destination); %>
                                            <small>round trip flight</small>
                                        </h4>
                                        <span class="price">
                                            <small>AVG/PERSON</small>
                                            <% out.print(cost); %>
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        <% out.print(date);%>  &nbsp; <% out.print(time); %> &nbsp; <% out.print(flightnum); %> &nbsp; <span style="font-weight: 700;color: #686ebe;font-size: x-large;"><% out.print(airline);%></span>
                                    </div>
                                </div>
                    </div>
                              
                              
                    <%      
                            int rflightid = 0;
                            for(int j=0;j<rlist.size();j++)
                            {
                                Flights h = rlist.get(j);
                                source = h.getSource();
                                rflightid = h.getFlightid();
                                airline = h.getAirline();
                                destination = h.getDestination();
                                date = h.getDdate();
                                time = h.getTtime();
                                flightnum = h.getFlightnum();
                            
                                //get seats cost
                                Set seatSet1 = h.getSeatSet();
                                Iterator<Seats> itr1 = seatSet.iterator();
                                while(itr1.hasNext())
                                {
                                    Seats s = itr1.next();
                                    if(s.getSeat_type().equalsIgnoreCase(seatclass))
                                     cost = s.getCost();
                               }
                                //display this html here
                %>
                                <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source); %> to <% out.print(destination); %>
                                            
                                        </h4>
                                        <span class="price">
                                            <small>AVG/PERSON</small>
                                            <% out.print(cost); %>
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        <% out.print(date);%>  &nbsp; <% out.print(time); %> &nbsp; <% out.print(flightnum); %> &nbsp; <span style="font-weight: 700;color: #686ebe;font-size: x-large;"><% out.print(airline);%></span>
                                    </div>
                                    <div class="book" style="padding-bottom: 10px;">
                                        <% out.println("<input type='hidden' name='class' value='"+seatclass+"'>");
                                         out.println("<input type='hidden' name='numSeats' value='"+numSeats+"'>");
                                         out.println("<input type='hidden' name='bookdflightid' value='"+dflightid+"'>");
                                         out.println("<input type='hidden' name='bookrflightid' value='"+rflightid+"'>");
                                        %>
                                        <button type='submit' class='btn  login_btn' value='Book Now'>Book Now</button>
                                    </div>
                                </div>
                    </div>
                          <%  }
                        } %>
    
                   
                        </div>
                    </div>   
                </div>
            </div>
        </div>
    
  </body>
</html>
