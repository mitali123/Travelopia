<%-- 
    Document   : adminLogin
    Created on : Apr 4, 2020, 1:37:39 PM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
         <div class="hero-wrap  js-fullheight overlay" style="background-image: url('images/bg_1.jpg'); opacity: 0.9;background-size: cover;height: 1230px;" data-stellar-background-ratio="0.5">
            <div class="d-flex justify-content-center h-50">
                <div class="card" style="height: fit-content;margin-top: 80px;">
			<div class="card-header">
				<h3 style = "color: white;">Admin Panel</h3>
			</div>
			<div class="card-body">
                            <form action="./viewFlights.htm" method="post">
					<div class="form-group">
                                            <button type="submit" class="btn float-right login_btn" style="width: 150px;height: 100px; margin-right: 100px; margin-top: 40px;">View Added Flights</button>
					</div>
                            </form>
                            <form action="./addFlightsDetails.htm" method="post">
					<div class="form-group">
                                            <button type="submit" class="btn float-right login_btn" style="width: 150px;height: 100px; margin-right: 100px; margin-top: 40px;">Add Flights</button>
					</div>
                            </form>
                             <form action="./updateFlightsDetails.htm" method="post">
					<div class="form-group">
                                            <button type="submit" class="btn float-right login_btn" style="width: 150px;height: 100px; margin-right: 100px; margin-top: 40px;">Update Flights</button>
					</div>
                            </form>
                            <form action="./removeFlightsDetails.htm" method="post">
					<div class="form-group">
                                            <button type="submit" class="btn float-right login_btn" style="width: 150px;height: 100px; margin-right: 100px; margin-top: 40px;">Delete Flights</button>
					</div>
                            </form>
                            <form action="./logout.htm" method="post">
					<div class="form-group">
                                            <button type="submit" class="btn float-right login_btn" style="width: 150px;height: 100px; margin-right: 100px; margin-top: 40px;">Logout</button>
					</div>
                            </form>
			</div>
		</div>
	</div>
        </div>

    </body>
</html>
                                                            