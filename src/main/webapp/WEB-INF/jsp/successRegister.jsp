<%-- 
    Document   : successRegister
    Created on : Mar 29, 2020, 11:03:55 AM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>successRegister</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
       <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_2.jpg'); opacity: 0.9;background-size: cover;height: 1230px;" data-stellar-background-ratio="0.5">
            <div class="d-flex justify-content-center h-50">
		<div class="card">
			<div class="card-header">
				<h3 style = "color: white;">Welcome ${username}! You are Registered!</h3>
                        </div>
                    <form action="./login.htm" method="POST">
                        <div class="form-group">
                                 <input type="hidden" id="username" name="username" value="${username}">
                                 <button type="submit" value="Go To HomePage" class="btn login_btn" style="width: fit-content;height: 100px;margin-left: 100px;margin-top: 40px;">Proceed to Login</button>
                        </div>
                    </form>
		</div>
	</div>
        </div>
    </body>
</html>
