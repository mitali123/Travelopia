<%-- 
    Document   : viewflightsoneway
    Created on : Apr 16, 2020, 9:55:18 AM
    Author     : manja
--%>

<%@page import="com.travelopia.pojo.Seats"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travelopia.pojo.Flights"%>
<%@page import="java.util.Set"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Travelopia</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
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
    <%                  
                        String seatclass = request.getAttribute("class").toString();
                        int numSeats = Integer.valueOf(request.getAttribute("numSeats").toString());
                        ArrayList<Flights> flist = (ArrayList<Flights>)request.getAttribute("flist");
                       
                        String cost = null;
                        String source = null;
                        String destination = null;
                        String date = null;
                        String time = null;
                        String airline = null;
                        String flightnum = null;
                        int flightid = 0;
                        for(int i=0;i<flist.size();i++)
                        {
                            Flights f = flist.get(i);
                            source = f.getSource();
                            flightid = f.getFlightid();
                            airline = f.getAirline();
                            destination = f.getDestination();
                            date = f.getDdate();
                            time = f.getTtime();
                            flightnum = f.getFlightnum();
                            out.println("<form action='./bookflight.htm' method='POST'>"); %>
                             <% Set seatSet = f.getSeatSet();
                              Iterator<Seats> itr = seatSet.iterator();
                              while(itr.hasNext())
                              {
                                  Seats s = itr.next();
                                 if(s.getSeat_type().equalsIgnoreCase(seatclass))
                                     cost = s.getCost();
                            }
                              %>
    
    <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/flight2.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;">Flight Search Results</h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
                        <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source); %> to <% out.print(destination); %>
                                            <small>one way flight</small>
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
                                         out.println("<input type='hidden' name='bookflightid' value='"+flightid+"'>");%>
                                        <button type='submit' class='btn  login_btn' value='Book Now'>Book Now</button>
                                    </div>
                                </div>
                            </div>  
                                        <% } %>
                        </div>
                    </div>
                     
                </div>
            </div>
        </div>
  </body>
</html>
