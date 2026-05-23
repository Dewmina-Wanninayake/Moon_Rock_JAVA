<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String username = (String) session.getAttribute("username");
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
   <link rel="icon" href="images/fevicon.png" type="image/gif" />
   <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
</head>
<body class="main-layout inner_page">
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
                           <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                           <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                           <li class="nav-item"><a class="nav-link" href="room.jsp">Our&nbsp;rooms</a></li>
                           <li class="nav-item"><a class="nav-link" href="service.jsp">Services</a></li>
                           <li class="nav-item active"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                           <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
                           <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact&nbsp;Us</a></li>
                        </ul>
                     </div>
                  </nav>
               </div>
               <% if (username == null) { %>
				      <div class="col-xl-2 col-lg-2 col-md-3 col-sm-3 text-right">
                         <div class="navbar-auth">
                             <button class="btn login-btn">Login</button>
                             <button class="btn signup-btn">Sign Up</button>
                         </div>
                      </div>
			   <% } else { %>
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
						            <a class="dropdown-item" href="dashboard.jsp">My Account</a>
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
            <button type="submit" class="search_icon"><i class="fa fa-search"></i></button>
            <div id="myDropdown" class="dropdown-content"></div>
         </form>
      </div>
   </div>

   <div class="back_re">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="title">
                  <h2>gallery</h2>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="gallery">
      <div class="container">
         <div class="row">
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery1.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery2.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery3.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery4.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery5.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery6.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery7.jpg" alt="#"/></figure></div></div>
            <div class="col-md-3 col-sm-6"><div class="gallery_img"><figure><img src="images/gallery8.jpg" alt="#"/></figure></div></div>
         </div>
      </div>
   </div>

   <footer>
      <div class="footer">
         <div class="container">
            <div class="row">
               <div class="col-md-4">
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
                     <li><a href="#">Home</a></li>
                     <li><a href="about.jsp">About</a></li>
                     <li><a href="room.jsp">Our Rooms</a></li>
                     <li><a href="service.jsp">Services</a></li>
                     <li class="active"><a href="gallery.jsp">Gallery</a></li>
                     <li><a href="blog.jsp">Blog</a></li>
                     <li><a href="contact.jsp">Contact Us</a></li>
                  </ul>
               </div>
               <div class="col-md-4">
                  <h3>News letter</h3>
                  <form class="bottom_form">
                     <input class="enter" placeholder="Enter your email" type="text" name="email">
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
</body>
</html>
