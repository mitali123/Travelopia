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
     <%                  
                        out.println("<form action='./flights.htm' method='POST'>");
                       
                        ArrayList<FlightBooking> fbcartlist  = (ArrayList<FlightBooking>)session.getAttribute("cart");
                        int dbookingid = (int)request.getAttribute("dbookingid");
                        int rbookingid = (int)request.getAttribute("rbookingid");
                        FlightBooking fb1 = new FlightBooking();
                        FlightBooking fb2 = new FlightBooking();
                        for(int i = 0; i<fbcartlist.size();i++)
                        {
                            fb1 = fbcartlist.get(i);
                            if(fb1.getBookingid() == dbookingid)
                                break;
                        }
                         for(int j = 0; j<fbcartlist.size();j++)
                        {
                            fb2 = fbcartlist.get(j);
                            if(fb2.getBookingid() == rbookingid)
                                break;
                        }
                       
                        int cost2 = fb2.getCost();
                        String source2 = fb2.getFlight().getSource();
                        String destination2 = fb2.getFlight().getDestination();
                        String date2 = fb2.getFlight().getDdate();
                        String time2 = fb2.getFlight().getTtime();
                        String flightnum2 = fb2.getFlight().getFlightnum();
                        int flightid2 = fb2.getFlight().getFlightid();
                        String seatNum2 = null;
                        
                        int cost1 = fb1.getCost();
                        String source1 = fb1.getFlight().getSource();
                        String destination1 = fb1.getFlight().getDestination();
                        String date1 = fb1.getFlight().getDdate();
                        String time1 = fb1.getFlight().getTtime();
                        String flightnum1 = fb1.getFlight().getFlightnum();
                        int flightid1 = fb1.getFlight().getFlightid();
                        String seatNum1 = null;
                        int t_cost = cost1 + cost2;
//                  //todo      for(int j=0;j < fb.getSeat_num_list().size();j++)
//                            {
//                                out.println(fb.getSeat_num_list().get(j)+"  ");
//                            }
                       
                              %>
    
    <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_1.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content; margin-top: 150px;">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;"> Your Booking Details: </h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
                        <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source1); %> to <% out.print(destination1); %>
                                            <small>round trip flight</small>
                                        </h4>
                                        <span class="price">
                                            <small>Departure Cost</small>
                                            <% out.print(cost1); %>
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        Date: <% out.print(date1);%>  <br>
                                        Time: <% out.print(time1); %> <br>
                                        Flight Number: <% out.print(flightnum1); %>
                                    </div>
                                    <div class="seats">
                                        <%
                                             for(int j=0;j < fb1.getSeat_num_list().size();j++)
                                            {
                                                    out.println(fb1.getSeat_num_list().get(j)+"  ");
                                            }
                                         %>
                                    </div>
                                </div>
                            </div>   
                                            
                            <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source2); %> to <% out.print(destination2); %>
                                            <small>round trip flight</small>
                                        </h4>
                                        <span class="price">
                                            <small>Return Cost</small>
                                            <% out.print(cost2); %>
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        Date: <% out.print(date2);%>  <br>
                                        Time: <% out.print(time2); %> <br>
                                        Flight Number: <% out.print(flightnum2); %>
                                    </div>
                                    <div class="seats">
                                        <%
                                             for(int j=0;j < fb2.getSeat_num_list().size();j++)
                                            {
                                                    out.println(fb2.getSeat_num_list().get(j)+"  ");
                                            }
                                         %>
                                    </div>
                                </div>
                                    <div class="third-row">
                                        <div class="book" style="padding-bottom: 10px;">
                                            <br>
                                            <h4>Total Cost</h4>
                                            <h3><% out.print(t_cost);%></h3>
                                            <button type='submit' class='btn  login_btn' value='confirmPayment' style="width: -webkit-fill-available;">Flight Booked!</button>
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
