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
				<h3>Please Enter Flight ID </h3>
                </div>
                <div class="card-body">
                         <form  action="./removeFlights.htm" method="POST">
                            <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style=" width: 150px;">Flight ID</span>
				</div>
                                <input type="text" class="form-control" required name="flightId" >	
                            </div>
                             
                            <div class="form-group">
                                <button type="submit"  class="btn login_btn" style="width: 200px; height: 80px; margin-left: 120px;">Remove Flight</button>
                            </div>
                    </form>  
                </div>
            </div>              
        </div>
    </div>
    </body>
</html>
