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
     
    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/flight2.jpg'); opacity: 0.9;" data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width:500px;height: 670px;margin-top: 150px;background-color: black;opacity: 1;">
                <div class="card-header">
				<h3>Please Enter Your Travel Details:</h3>
                </div>
                <div class="card-body">
                         <form  action="./viewflightuser.htm" method="POST">
                            <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text" style=" width: 150px;">Source</span>
				</div>
                                <input type="text" class="form-control" required name="source" >	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 150px;">Destination</span>
				</div>
                                <input type="text" class="form-control" required name="destination">	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 150px;">Departure Date</span>
				</div>
                                <input type="date" class="form-control" required name="departureDate">	
                            </div>
                            <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 150px;">Return Date</span>
				</div>
                                <input type="date" class="form-control" required name="returnDate" >	
                            </div>
                             <div class="input-group form-group">
				<div class="input-group-prepend">
					<span class="input-group-text"  style=" width: 150px;">Number of Seats</span>
				</div>
                                <input type="text" class="form-control" required name="numSeats">	
                            </div>
                            <div class="input-group form-group">
                                <label for="trip">Round Trip</label>
                                <input type="radio" class="form-control" required name="trip"  id="round" value="roundTrip" >
                                 <label for="trip">One Way Trip</label>
                                <input type="radio" class="form-control" required name="trip"  id="oneway" value="oneway" >
                            </div>
                             <div class="input-group form-group">
                                 <label for="class">Economy</label>
                                <input type="radio" class="form-control" required  name="class" id="economy" value="economy" >
                                <label for="class">Business</label>
                                <input type="radio" class="form-control" required name="class"  id="business" value="business" >
                            </div>
                            <div class="form-group">
                                <button type="submit" value="Login" class="btn login_btn" style="width: 200px; height: 80px; margin-left: 120px;">View Available Flights</button>
                            </div>
                    </form>  
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
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  </body>
</html>