<%-- 
    Document   : addFlightsDetails
    Created on : Apr 19, 2020, 5:33:28 PM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
       <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_5.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content;">
                <div class="card-header">
				<h3>Please Enter Flight Details:</h3>
                </div>
                <div class="card-body">
                         <form  action="./updateFlights.htm" method="POST">
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style=" width: 180px;">Flight ID</span>
				</div>
                                <input type="text" class="form-control" required name="flightId1" >	
                            </div>
                            <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style=" width: 180px;">Flight Number</span>
				</div>
                                <input type="text" class="form-control" required name="flightnum" >	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style=" width: 180px;">Source</span>
				</div>
                                <input type="text" class="form-control" required name="source1" >	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;">Destination</span>
				</div>
                                <input type="text" class="form-control" required name="destination1">	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;"> Date</span>
				</div>
                                <input type="date" class="form-control" required name="ddate1">	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;"> Time</span>
				</div>
                                <input type="time" class="form-control" required name="ttime1">	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;">Airline</span>
				</div>
                                <input type="text" class="form-control" required name="airline1">	
                            </div>
                              <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;">Business Class Cost</span>
				</div>
                                <input type="text" class="form-control" required name="b_cost1">	
                            </div>
                              <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 180px;">Economy Class Cost</span>
				</div>
                                <input type="text" class="form-control" required name="e_cost1">	
                            </div>
                            <div class="form-group">
                                <button type="submit"  class="btn login_btn" style="width: 200px; height: 80px; margin-left: 120px;">Update Flight</button>
                            </div>
                    </form>  
                </div>
            </div>              
        </div>
    </div>
    </body>
</html>
