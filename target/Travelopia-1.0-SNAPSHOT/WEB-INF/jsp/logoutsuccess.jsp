<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Travelopia</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
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
                    <form action="./login.htm" method="POST">
                        <button type="submit" class="btn login_btn_menu" style="background-color: #ffb400;" value="Login">Login</button>
                    </form>
                  </li>
                  <li class="nav-item active">
                    <form action="./index.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="Home">Home</button>
                    </form>
                  </li>
                  <li class="nav-item">
                    <form action="./flights.htm" method="POST">
                      <button type="submit" class="btn  login_btn_menu" value="Flights">Flights</button>
                    </form>
                  </li>
                  <li class="nav-item">
                    <form action="./thingstodo.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="Things To Do">Things To Do</button>
                    </form>
                  </li>
                  <li class="nav-item">
                  <form action="./viewcart.htm" method="POST">
                      <button type="submit" class="btn login_btn_menu" value="View Cart">View Cart</button>
                  </form>
                  </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight overlay" style="background-image: url('images/3.jpg'); opacity: 0.9;" data-stellar-background-ratio="0.5">
<!--      <div class="overlay"></div>-->
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true" overlay>
          <div class="col-md-7 ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 2.6 }">Fuel Your Wanderlust</h1>
            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 2.6 }">Let's Travel the World!</p>
          </div>
        </div>
  </div>

    <section class="ftco-section ftco-no-pb ftco-no-pt">
    	<div class="container">
	    	<div class="row">
					<div class="col-md-12">
						<div class="search-wrap-1 ftco-animate p-4">
							<form action="#" class="search-property-1">
		        		<div class="row">
		        			<div class="col-lg align-items-end">
		        				<div class="form-group">
		        					<label for="#">Destination</label>
		          				<div class="form-field">
		          					<div class="icon"><span class="ion-ios-search"></span></div>
				                <input type="text" class="form-control" placeholder="Search place">
				              </div>
			              </div>
		        			</div>
		        			<div class="col-lg align-items-end">
		        				<div class="form-group">
		        					<label for="#">Check-in date</label>
		        					<div class="form-field">
		          					<div class="icon"><span class="ion-ios-calendar"></span></div>
				                <input type="text" class="form-control checkin_date" placeholder="Check In Date">
				              </div>
			              </div>
		        			</div>
		        			<div class="col-lg align-items-end">
		        				<div class="form-group">
		        					<label for="#">Check-out date</label>
		        					<div class="form-field">
		          					<div class="icon"><span class="ion-ios-calendar"></span></div>
				                <input type="text" class="form-control checkout_date" placeholder="Check Out Date">
				              </div>
			              </div>
		        			</div>
		        			<div class="col-lg align-items-end">
		        				<div class="form-group">
		        					<label for="#">Price Limit</label>
		        					<div class="form-field">
		          					<div class="select-wrap">
		                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                      <select name="" id="" class="form-control">
		                        <option value="">$5,000</option>
		                        <option value="">$10,000</option>
		                        <option value="">$50,000</option>
		                        <option value="">$100,000</option>
		                        <option value="">$200,000</option>
		                        <option value="">$300,000</option>
		                        <option value="">$400,000</option>
		                        <option value="">$500,000</option>
		                        <option value="">$600,000</option>
		                        <option value="">$700,000</option>
		                        <option value="">$800,000</option>
		                        <option value="">$900,000</option>
		                        <option value="">$1,000,000</option>
		                        <option value="">$2,000,000</option>
		                      </select>
		                    </div>
				              </div>
			              </div>
		        			</div>
		        			<div class="col-lg align-self-end">
		        				<div class="form-group">
		        					<div class="form-field">
				                <input type="submit" value="Search" class="form-control btn btn-primary">
				              </div>
			              </div>
		        			</div>
		        		</div>
		        	</form>
		        </div>
					</div>
	    	</div>
	    </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4">Best Place to Travel</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/destination-1.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$400</h4>
	    					<span>15 Days Tour</span>
	    					<h3><a href="project.html">Gurtnellen, Swetzerland</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/destination-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/destination-2.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$400</h4>
	    					<span>15 Days Tour</span>
	    					<h3><a href="project.html">Gurtnellen, Swetzerland</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/destination-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/destination-3.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$400</h4>
	    					<span>15 Days Tour</span>
	    					<h3><a href="project.html">Gurtnellen, Swetzerland</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/destination-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/destination-4.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$400</h4>
	    					<span>15 Days Tour</span>
	    					<h3><a href="project.html">Gurtnellen, Swetzerland</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/destination-4.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-yatch"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Activities</h3>
                <p>	203 Fake St. Mountain View, San Francisco, California, USA</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-around"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Travel Arrangements</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-compass"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Private Guide</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-map-of-roads"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Location Manager</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
   	
    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(images/about.jpg);"></div>
    			</div>
    			<div class="col-md-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Traveland</h2>
		            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
		          </div>
		        </div>
		    		<div class="row">
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="30">0</strong>
		                <span>Amazing Deals</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="200">0</strong>
		                <span>Sold Tours</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="2500">0</strong>
		                <span>New Tours</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="40">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>


    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4">Hotel &amp; Restaurant</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/hotel-resto-1.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$600</h4>
	    					<span>300 per person</span>
	    					<h3><a href="project.html">New Orleans Hotel</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/hotel-resto-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/hotel-resto-2.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$600</h4>
	    					<span>300 per person</span>
	    					<h3><a href="project.html">New Orleans Hotel</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/hotel-resto-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="images/hotel-resto-3.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price">$600</h4>
	    					<span>300 per person</span>
	    					<h3><a href="project.html">New Orleans Restaurant</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="images/hotel-resto-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 order-md-last d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(images/about-1.jpg);"></div>
    			</div>
    			<div class="col-md-6 pr-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">Things to Know Before Traveling to other Places</h2>
		            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
		          </div>
		        </div>
		        <div class="row">
		        	<div class="col-md-12">
		        		<p class="ftco-animate tips"><span>1.</span> A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
		        		<p class="ftco-animate tips"><span>2.</span> A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		        		<p class="ftco-animate tips"><span>3.</span> It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		        		<p class="ftco-animate mt-4"><a href="#" class="btn btn-primary py-3 px-5">Read more</a></p>
		        	</div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
		

    <section class="ftco-section ftco-no-pb testimony-section" style="background-image: url(images/bg_1.jpg);">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Happy Traveler Says</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12 testimonial">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap img" style="background-image: url(images/traveler-1.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Marketing Manager</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-2.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Interface Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-3.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-4.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Web Developer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-5.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">System Analyst</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
		
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