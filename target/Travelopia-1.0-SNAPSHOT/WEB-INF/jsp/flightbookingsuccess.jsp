<%-- 
    Document   : viewflightsoneway
    Created on : Apr 16, 2020, 9:55:18 AM
    Author     : manja
--%>

<%@page import="com.travelopia.pojo.FlightBooking"%>
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
         
                        out.println("<form action='./flights.htm' method='POST'>"); 
                        ArrayList<FlightBooking> fbcartlist  = (ArrayList<FlightBooking>)session.getAttribute("cart");
                        int bookingid = (int)request.getAttribute("bookingid");
                        FlightBooking fb = new FlightBooking();
                        for(int i = 0; i<fbcartlist.size();i++)
                        {
                            fb = fbcartlist.get(i);
                            if(fb.getBookingid() == bookingid)
                                break;
                        }
                       
                        int cost = fb.getCost();
                        String source = fb.getFlight().getSource();
                        String destination = fb.getFlight().getDestination();
                        String date = fb.getFlight().getDdate();
                        String time = fb.getFlight().getTtime();
                        String flightnum = fb.getFlight().getFlightnum();
                        int flightid = fb.getFlight().getFlightid();
                        String seatNum = null;
//                  //todo      for(int j=0;j < fb.getSeat_num_list().size();j++)
//                            {
//                                out.println(fb.getSeat_num_list().get(j)+"  ");
//                            }
                       
                              %>
    
    <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_1.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;"> Your Booking Details :</h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
                        <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source); %> to <% out.print(destination); %>
                                            <small>round trip flight</small>
                                        </h4>
                                        <span class="price">
                                            Total Cost
                                            <% out.print(cost); %>
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        Date: <% out.print(date);%>  <br>
                                        Time: <% out.print(time); %> <br>
                                        Flight Number: <% out.print(flightnum); %>
                                    </div>
                                    <div class="seats">
                                        <%
                                             for(int j=0;j < fb.getSeat_num_list().size();j++)
                                            {
                                                    out.println(fb.getSeat_num_list().get(j)+"  ");
                                            }
                                         %>
                                    </div>
                                </div>
                                    <div class="third-row">
                                        <div class="book" style="padding-bottom: 10px;">
                                            <button type='submit' class='btn  login_btn' value='confirmPayment' style="width: -webkit-fill-available; ">Flight Booked!</button>
                                        </div>
                                    </div>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
                

    <footer class="ftco-footer ftco-footer-2 ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Travelopia</h2>
              <p>Lets Travel the World!</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    
  </body>
</html>
