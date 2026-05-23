<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String username = (String) session.getAttribute("username");
    String userType = (String) session.getAttribute("userRole"); 
%>
   

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>MoonRockHotel</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/responsive.css">
   <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
</head>
<body class="main-layout">
   <div class="loader_bg">
      <div class="loader"><img src="images/loading.gif" alt="#"/></div>
   </div>
   <header>
      <div class="header">
         <div class="container">
            <div class="row align-items-center justify-content-between">
               <div class="col-xl-2 col-lg-2 col-md-3 col-sm-3 logo_section" style="padding-left: -10%;">
                  <div class="full">
                     <div class="center-desk">
                        <div class="logo">
                           <a href="index.jsp"><img src="images/logo.png" alt="#" /></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                  <nav class="navigation navbar navbar-expand-md navbar-dark justify-content-center">
                     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04"
                        aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                     </button>
                     <div class="collapse navbar-collapse" id="navbarsExample04" style="margin-left: 30%;">
                        <ul class="navbar-nav mx-auto">
                           <li class="nav-item active">
                              <a class="nav-link" href="index.jsp">Home</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="about.jsp">About</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="room.jsp">Our&nbsp;rooms</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="service.jsp">Services</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="gallery.jsp">Gallery</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="blog.jsp">Blog</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="contact.jsp">Contact&nbsp;Us</a>
                           </li>
                        </ul>
                     </div>
                  </nav>
               </div>
			   <% if (username == null) { %>
				      <div class="col-xl-2 col-lg-2 col-md-3 col-sm-3 text-right">
                         <div class="navbar-auth">
                             <a href="login.jsp">
                             	<button class="btn login-btn">Login</button>
                             </a>
                             <a href="register.jsp">
                             	<button class="btn signup-btn">Sign Up</button>
                         	 </a>
                         </div>
                      </div>
			   <% } else { %>
				      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
				      
				<div class="col-xl-2 col-lg-2 col-md-3 col-sm-3 text-right d-flex align-items-center justify-content-end">
				    <a href="saved.jsp" class="mr-3">
				        <img src="images/book-half.svg" alt="Bookmark" style="width: 26px; height: 26px; margin-right: 10px;">
				    </a>
				    <div class="dropdown">
				        <button class="btn dropdown-toggle p-0 border-0 bg-transparent" type="button" id="userDropdown"
				                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				            <img src="images/person-circle.svg" alt="User" style="width: 40px; height: 40px; border-radius: 50%;">
				        </button>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
						    <span style="margin-left: 10px;">Hello <%= username != null ? username : "Guest" %>!</span>
						
						    <% if ("admin".equals(userType)) { %>
						        <a class="dropdown-item" href="Admin.jsp">My Account</a>
						    <% } else if ("manager".equals(userType)) { %>
						        <a class="dropdown-item" href="manager.jsp">My Account</a>
						    <% } else if ("customer".equals(userType)) { %>
						        <a class="dropdown-item" href="user.jsp">My Account</a>
						    <% } %>
						
						    <!-- Always show logout option -->
						    <a class="dropdown-item" href="LogoutServlet">Logout</a>
						</div>
				    </div>
				</div>								
			   <% } %>
            </div>
         </div>  
      </div>
   </header>
   
   <div class="fullpage-wrapper">
      <div class="d-flex justify-content-center align-items-center h-100">
        <form class="search" onsubmit="return false;">
          <input id="searchInput" class="search_input" type="text" name="query" placeholder="Search here..." onkeyup="searchItems()">
          <button type="submit" class="search_icon">
            <i class="fa fa-search"></i>
          </button>
          <div id="myDropdown" class="dropdown-content"></div>
        </form>
      </div>
    </div>

	<section class="banner_main"> 
         <div id="myCarousel" class="carousel slide banner" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img class="first-slide" src="images/banner1.jpg" alt="First slide">
                  <div class="container">
                  </div>
               </div>
               <div class="carousel-item">
                  <img class="second-slide" src="images/banner2.jpg" alt="Second slide">
               </div>
               <div class="carousel-item">
                  <img class="third-slide" src="images/banner3.jpg" alt="Third slide">
               </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
         </div>
         <div class="booking_ocline">
            <div class="container">
               <div class="row">
                  <div class="col-md-5">
                     <div class="book_room">
                        <h1>Book a Room Online</h1>
                        <form class="book_now" action="BookingServlet" method="post">
                           <div class="row">
                              <div class="col-md-12">
                                 <span>Arrival</span>
                                 <img class="date_cua" src="images/date.png">
                                 <input class="online_book" placeholder="dd/mm/yyyy" type="date" name="arrival" required>
                              </div>
                              <div class="col-md-12">
                                 <span>Departure</span>
                                 <img class="date_cua" src="images/date.png">
                                 <input class="online_book" placeholder="dd/mm/yyyy" type="date" name="departure" required>
                              </div>
                              <div class="col-md-12">
                                 <button class="book_btn">Book Now</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      
      <div class="about">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-5">
                  <div class="titlepage">
                     <h2>About Us</h2>
                     <p>Founded in 2025, Moon Rock Hotel is committed to delivering exceptional hospitality with a perfect blend of modern luxury and personalized service. Designed to provide seamless stays, our hotel offers world-class amenities, innovative accommodations, and warm hospitality to ensure every guest feels at home. Whether you're traveling for business or leisure, we create unforgettable experiences that redefine comfort and elevate your journey.</p>
                     <a class="read_more" href="Javascript:void(0)"> Read More</a>
                  </div>
               </div>
               <div class="col-md-7">
                  <div class="about_img">
                     <figure><img src="images/about.png" alt="#"/></figure>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div  class="our_room">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Our Rooms</h2>
                     <p>Check out our best rooms </p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room1.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>Master Bed Room</h3>
                        <p>A spacious and elegant retreat designed for ultimate comfort and sophistication.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room2.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>King Bed Room</h3>
                        <p>A luxurious room featuring a plush king-size bed for restful nights.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room3.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>Queen Bed Room</h3>
                        <p>Cozy yet refined, offering a comfortable queen-size bed for relaxation.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room4.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>Deluxe Bed Room</h3>
                        <p>A premium experience with upscale amenities and stylish interiors.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room5.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>Vibe Bed Room</h3>
                        <p> A modern and energetic space curated for a trendy and vibrant stay.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6">
                  <div id="serv_hover"  class="room">
                     <div class="room_img">
                        <figure><img src="images/room6.jpg" alt="#"/></figure>
                     </div>
                     <div class="bed_room">
                        <h3>White Bed Room</h3>
                        <p>A serene haven with minimalist décor and a fresh, airy ambiance.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
     
      <div  class="gallery">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>gallery</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery1.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery2.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery3.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery4.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery5.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery6.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery7.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6">
                  <div class="gallery_img">
                     <figure><img src="images/gallery8.jpg" alt="#"/></figure>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div  class="blog">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Blog</h2>
                     <p>We care always</p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="blog_box">
                     <div class="blog_img">
                        <figure><img src="images/blog1.jpg" alt="#"/></figure>
                     </div>
                     <div class="blog_room">
                        <h3>New outdoor swimming pool</h3>
                        <span>The Moon Lake</span>
                        <p>Our recently completed clear water pool can be accessed by anyone</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="blog_box">
                     <div class="blog_img">
                        <figure><img src="images/blog2.jpg" alt="#"/></figure>
                     </div>
                     <div class="blog_room">
                        <h3>Hotel Lobby</h3>
                        <span>The Good Receptiom</span>
                        <p>Our improved hotel lobby can accomadate lot of people. Just like your heart theres no room we pack the lobby.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="blog_box">
                     <div class="blog_img">
                        <figure><img src="images/blog3.jpg" alt="#"/></figure>
                     </div>
                     <div class="blog_room">
                        <h3>New Bed Rooms</h3>
                        <span>Will be available soon</span>
                        <p>Our Moon Night hall will be open for bookings soon it will accomadate more than 100 people per day.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
     
      <div class="contact">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Contact Us</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-6">
                  <form id="request" class="main_form">
                     <div class="row">
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Name" type="type" name="Name"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Email" type="type" name="Email"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Phone Number" type="type" name="Phone Number">                          
                        </div>
                        <div class="col-md-12">
                           <textarea class="textarea" placeholder="Message" type="type" Message="Name">Message</textarea>
                        </div>
                        <div class="col-md-12">
                           <button class="send_btn">Send</button>
                        </div>
                     </div>
                  </form>
               </div>
               <div class="col-md-6">
                  <div class="map_main">
                     <div class="map-responsive">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15826.351091109405!2d81.333333!3d7.3999998499999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae4c32973ed7497%3A0x27ed19b0e7d90783!2sWarapitiya!5e0!3m2!1sen!2slk!4v1744727539763!5m2!1sen!2slk" width="600" height="400" frameborder="0" style="border:0; width: 100%;" allowfullscreen=""></iframe>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

   <footer>
      <div class="footer">
         <div class="container">
            <div class="row">
               <div class=" col-md-4">
                  <h3>Contact US</h3>
                  <ul class="conta">
                     <li><i class="fa fa-map-marker" aria-hidden="true"></i>22/2/2, JTLC rd., Warapitiya</li>
                     <li><i class="fa fa-mobile" aria-hidden="true"></i>0812 223 2231</li>
                     <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="#">moonrockwithatglock@gmail.com</a></li>
                  </ul>
               </div>
               <div class="col-md-4">
                  <h3>Menu Link</h3>
                  <ul class="link_menu">
                     <li class="active"><a href="index.jsp">Home</a></li>
                     <li><a href="about.jsp">About</a></li>
                     <li><a href="room.jsp">Our Room</a></li>
                     <li><a href="service.jsp">Services</a></li>
                     <li><a href="gallery.jsp">Gallery</a></li>
                     <li><a href="blog.jsp">Blog</a></li>
                     <li><a href="contact.jsp">Contact Us</a></li>
                  </ul>
               </div>
               <div class="col-md-4">
                  <h3>News letter</h3>
                  <form class="bottom_form">
                     <input class="enter" placeholder="Enter your email" type="text" name="Enter your email">
                     <button class="sub_btn">subscribe</button>
                  </form>
                  <ul class="social_icon">
                     <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                     <li><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="copyright">
            <div class="container">
               <div class="row">
                  <div class="col-md-10 offset-md-1">
                     <p>© 2025 MOON ROCK HOTEL All Rights Reserved.<br><br>Group 8 @ SLIIT Kandy UNI</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>

   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/jquery-3.0.0.min.js"></script>
   <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
   <script src="js/custom.js"></script>
   <script src="js/booking.js"></script>
   
</body>
</html>
