<%-- 
    Document   : errorRegister
    Created on : Mar 29, 2020, 11:04:16 AM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>errorRegister</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
   
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
       <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/flight2.jpg'); opacity: 0.9;background-size: cover;height: 1230px;" data-stellar-background-ratio="0.5">
            <div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-body">
				<h3 style="color: white;">Input Error! Please Try Again</h3>
                                <form action="./flights.htm" method="POST">
                                    <button type="submit" class="btn login_btn"  style="width: fit-content;height: 100px;margin-left: 40px;margin-top: 40px;">Try again</button>
                                </form>
                        </div>
		</div>
	</div>
        </div>
    </body>
</html>
