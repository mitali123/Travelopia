<%-- 
    Document   : manageFlights
    Created on : Apr 5, 2020, 6:24:01 PM
    Author     : manja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travelopia</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
       <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/image_1.jpg');opacity: 0.9;background-size: cover;height: 1230px; " data-stellar-background-ratio="0.5">
        <div class="d-flex justify-content-center h-50">
            <div class="card" style="width: 800px; height: fit-content">
                <div class="card-header" style="background-color: #e9ecef;">
                    <h3 style="color: #111010;"> Flight Details:  </h3>
                </div>
                <div class="card-body" style="background-color: #e9ecef;">
                    <div class="card-listing">
                        <c:forEach var="flight" items="${flightlist}">
                        <div class="card_details" style="padding-left: 15px; background-color: white;">
                                <div class="first-row">
                                        <h4 class="box-title">
                                             ${flight.source} to ${flight.destination}
                                        </h4>
                                        <span class="price">
                                            Airline
                                            ${flight.airline}
                                        </span>
                                </div>
                                <div class="second-row">
                                    <div class="time">
                                        Date: ${flight.ddate} <br>
                                        Time: ${flight.ttime} <br>
                                    </div>
                                    <div class="seats">
                                        <h3> Flight ID: ${flight.flightid} </h3>
                                    </div>
                                </div>
                            
                            </div>  
                        </c:forEach>               
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

