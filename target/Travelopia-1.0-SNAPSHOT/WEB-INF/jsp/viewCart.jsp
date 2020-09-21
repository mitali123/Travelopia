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
                  <li class="nav-item">
                    <form action="./flights.htm" method="POST">
                      <button type="submit" class="btn  login_btn_menu" value="Flights">Flights</button>
                    </form>
                  </li>
                  <li class="nav-item active">
                  <form action="./viewcart.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="View Cart">View <c:out value="${sessionScope.username}"/>'s Cart</button>
                  </form>
                  </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_1.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;"> Your Cart Contains: </h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
         <%                  
                         
                        ArrayList<FlightBooking> fbcartlist  = (ArrayList<FlightBooking>)session.getAttribute("cart");
                        //int bookingid = (int)request.getAttribute("bookingid");
                        FlightBooking fb = new FlightBooking();
                        String source = null;
                        String destination = null;
                        String date = null;
                        String time = null;
                        String airline = null;
                        String seat_type = null;
                        int bookingid = 0;
                        String flightnum = null;
                        String paymentstatus = null;
                        int cost = 0;
                        if(fbcartlist.isEmpty())
                        {
                            out.println("<form action='./flights.htm' method='POST'>");
                            out.print("<div class='card_details' style='padding-left: 15px; background-color: white;'><div class='third-row'><div class='book'><h4>Your Cart is Empty</h4><br><button type='submit' class='btn  login_btn' style='width: -webkit-fill-available;'>Check Flight Availablity</button></div></div></form>");
                        }
                        else
                        {
                            out.println("<form action='./confirmpaymentflight.htm' method='POST'>");
                            for(int i = 0; i<fbcartlist.size();i++)
                            {
                                fb = fbcartlist.get(i);
                                source = fb.getFlight().getSource();
                                destination = fb.getFlight().getDestination();
                                date = fb.getFlight().getDdate();
                                time = fb.getFlight().getTtime();
                                flightnum = fb.getFlight().getFlightnum();
                                airline = fb.getFlight().getAirline();
                                paymentstatus = fb.getStatus();
                                cost = fb.getCost();
                                bookingid = fb.getBookingid();
                                String seat_no = fb.getSeat_num_list().get(0);
                                Set<Seats> seatSet = fb.getFlight().getSeatSet();
                                Iterator<Seats> itr1 = seatSet.iterator();
                                while(itr1.hasNext())
                                {
                                    Seats s = itr1.next();
                                    if(s.getSeatNum().equalsIgnoreCase(seat_no))
                                    {
                                        seat_type = s.getSeat_type();
                                    }
                                    
                                }
                                
            %>
                              
        
                        <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                            <% out.print(source); %> to <% out.print(destination); %>
                                            <small><% out.print(seat_type); %></small>
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
                                        <br>
                                         Booking ID: <%out.print(bookingid);%></h3>
                                    </div>
                                </div>
                                    <div class="third-row">
                                        <div class="book" style="padding-bottom: 10px;">
                                            <% out.print("<input type='hidden' name='bookingid' value='"+bookingid+"'>");%>
                                            <h3><%out.print(paymentstatus);%></h3>
                                            <% if(paymentstatus.equalsIgnoreCase("payment_pending"))
                                                {
                                                    out.print("<button type='submit' class='btn  login_btn' value='confirmPayment' style='width: -webkit-fill-available;'>Complete Payment</button></form>");
                                                    out.println("<form action='./removefromcart.htm' method='POST'>");
                                                    out.print("<input type='hidden' name='bookingid' value='"+bookingid+"'>");
                                                    out.print("<button type='submit' class='btn  login_btn' value='removefromcart' style='width: -webkit-fill-available;'>Remove</button></form>");
                                                
                                                }
                                            %>
                                            
                                        </div>
                                    </div>
                            </div>   
                            <% } 
                            } %>
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
            </div>
          </div>
        </div>
      </div>
    </footer>
    
  </body>
</html>
