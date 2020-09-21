<%-- 
    Document   : login.jsp
    Created on : Mar 28, 2020, 8:11:57 PM
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
		<div class="card">
			<div class="card-header">
				<h3 style = "color: white;">Sign In</h3>
			</div>
			<div class="card-body">
				<form action="./loginUser.htm" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
                                            <input type="text" class="form-control" required="" name="username" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="password" required class="form-control" placeholder="password">
					</div>
					<div class="form-group">
                                            <button type="submit" value="Login" class="btn float-right login_btn">Login</button>
					</div>
				</form>
			</div>
                    <form action="./loginRegister.htm" method="post">
			<div class="card-footer">
                            <div class="form-group">
                                <label>Don't have an account?</label><button type="submit" value="Sign Up" class="btn float-right login_btn">Sign Up</button>
                            </div>
			</div>
                    </form>
		</div>
	</div>
        </div>
    </body>
</html>
