<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, java.util.*, java.util.Map" %>
<%@ page import="utils.DBconnect" %>
<%@ page session="true" %>


<%
    String username = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("userRole");

    String serviceIdParam = request.getParameter("serviceId");
    int serviceId = 0;

    if (serviceIdParam != null) {
        try {
            serviceId = Integer.parseInt(serviceIdParam);
        } catch (NumberFormatException e) {
            out.println("<p>Invalid Service ID.</p>");
            return;
        }
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String serviceName = "", serviceType = "", description = "", image = "";
    boolean availability = false;
    double price = 0.0, discount = 0.0;
    java.sql.Date dateAdded = null;

    try {
        conn = DBconnect.getConnection();
        String sql = "SELECT * FROM Service WHERE ServiceID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, serviceId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            serviceName = rs.getString("serviceName");
            serviceType = rs.getString("serviceType");
            description = rs.getString("description");
            image = rs.getString("image");
            availability = rs.getBoolean("availability");
            price = rs.getDouble("price");
            discount = rs.getDouble("discount");
            dateAdded = rs.getDate("dateAdded");
        } else {
            out.println("<p>Service not found.</p>");
            return;
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }

    List<Map<String, Object>> viewedServices = (List<Map<String, Object>>) session.getAttribute("viewedServices");
    if (viewedServices == null) {
        viewedServices = new ArrayList<>();
    }

    Map<String, Object> serviceDetails = new HashMap<>();
    serviceDetails.put("image", image);
    serviceDetails.put("description", description);
    serviceDetails.put("date", dateAdded);
    serviceDetails.put("price", price - (price * discount / 100));

    boolean alreadyExists = false;
    for (Map<String, Object> s : viewedServices) {
        if (s.get("description").equals(description)) {
            alreadyExists = true;
            break;
        }
    }

    if (!alreadyExists) {
        viewedServices.add(serviceDetails);
    }

    session.setAttribute("viewedServices", viewedServices);
%>



<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Service Details | Moon Rock Travel</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/responsive.css">
</head>
<body class="main-layout">
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
                           <li class="nav-item active"><a class="nav-link" href="service.jsp">Services</a></li>
                           <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                           <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
                           <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact&nbsp;Us</a></li>
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
	               <h2>Service Details</h2>
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
	
	<div class="our_room">
	   <div class="container">
	      <div class="row">
	         <div class="col-md-6">
	            <img src="<%= image %>" alt="<%= serviceName %>" class="img-fluid" />
	         </div>
	         <div class="col-md-6">
	            <h3><%= serviceName %></h3>
				<p class="price" id="priceSection">
				   <strong id="priceValue" data-usd="<%= price %>" data-discount="<%= discount %>">$<%= price %> per night</strong>
				   <% if (discount > 0) { %>
				      <br><span id="discountText" style="color: green;">Discount: <%= discount %>%</span>
				   <% } %>
				   <br>
				   <button type="button" class="btn btn-sm btn-info mt-2" id="currencyToggleBtn" onclick="toggleCurrency()">Convert to LKR</button>
				</p>
	            <p><%= description %></p>
	            
				<form action="payment.jsp" method="get">
				   <div class="form-group">
				      <label for="bookingDate">Booking Date</label>
				      <input type="date" id="bookingDate" name="bookingDate" class="form-control" required>
				   </div>
				   <input type="hidden" name="serviceId" value="<%= serviceId %>">
				   <button type="submit" class="btn btn-primary" style="float: right; margin-left: 15px;">Book Now</button>
				   <a href="javascript:history.back()" class="btn btn-outline-secondary" style="float: right;">Cancel</a>
				</form>

	         </div>
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
                     <li><a href="index.jsp">Home</a></li>
                     <li><a href="about.jsp">About</a></li>
                     <li><a href="room.jsp">Our Room</a></li>
                     <li class="active"><a href="service.jsp">Services</a></li>
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
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/bookingService.js"></script>
	<script src="js/currencyToggle.js"></script>
</body>
</html>
