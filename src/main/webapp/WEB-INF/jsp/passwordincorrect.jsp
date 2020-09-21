<%-- 
    Document   : registerUser
    Created on : Mar 29, 2020, 8:36:54 AM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register User</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
      <div class="hero-wrap  js-fullheight overlay" style="background-image: url('images/image_2.jpg'); opacity: 0.9;background-size: cover;height: 1230px;" data-stellar-background-ratio="0.5">
            <div class="d-flex justify-content-center h-50">
                <div class="card" style="height: fit-content;">
			<div class="card-header">
				<h3 style = "color: white;">Password does not meet requirements</h3>
                                <small style = "color: white;">Password must contain at least 8 characters,at least 1 number,at least 1 upper case letter, at least 1 lower case letter, at least 1 special character,it must not contain any spaces</small>
			</div>
			<div class="card-body">
				<form action="./registerNewUser.htm" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" required name="username" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="password" required class="form-control" placeholder="password">
					</div>
                                        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="email" name="email" required class="form-control" placeholder="email_id">
					</div>
					<div class="form-group">
                                            <button type="submit" value="SignUp" class="btn float-right login_btn">Sign Up</button>
					</div>
				</form>
			</div>
	</div>   
        </div>
      </div>
    </body> 
</html>
