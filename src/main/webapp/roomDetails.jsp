<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.*, model.RoomItem, model.ViewedItem" %>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBconnect" %>
<%@ page session="true" %>

<%
    String arrival = (String) session.getAttribute("arrival");
    String departure = (String) session.getAttribute("departure");
    String username = (String) session.getAttribute("username");
    String userType = (String) session.getAttribute("userRole");
    
    String ridParam = request.getParameter("rid");
    int rid = 0;
    if (ridParam != null) {
        try {
            rid = Integer.parseInt(ridParam);
        } catch (NumberFormatException e) {
            out.println("<p>Invalid room ID.</p>");
            return;
        }
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String name = "", type = "", description = "", image = "";
    int childCap = 0, adultCap = 0, beds = 0;
    double price = 0.0, discount = 0.0;

    try {
        conn = DBconnect.getConnection();
        String sql = "SELECT * FROM Room WHERE RID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, rid);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            type = rs.getString("type");
            description = rs.getString("description");
            image = rs.getString("image");
            childCap = rs.getInt("childCapacity");
            adultCap = rs.getInt("adultCapacity");
            beds = rs.getInt("NoOfBeds");
            price = rs.getDouble("price");
            discount = rs.getDouble("discount");
        } else {
            out.println("<p>Room not found.</p>");
            return;
        }

    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }

    String dateRange = (arrival != null && departure != null) ? arrival + " to " + departure : "Not selected";
    double finalPrice = price - (price * discount / 100);

   
    RoomItem roomItem = new RoomItem(rid, name, image, dateRange, finalPrice, false);
    List<ViewedItem> viewedItems = (List<ViewedItem>) session.getAttribute("viewedItems");

    if (viewedItems == null) {
        viewedItems = new ArrayList<>();
    }

    boolean exists = false;
    for (ViewedItem item : viewedItems) {
        if (item.getId() == rid && "room".equals(item.getType())) {
            exists = true;
            break;
        }
    }

    if (!exists) {
        viewedItems.add(roomItem);
        session.setAttribute("viewedItems", viewedItems);
    }
%>

<%
    // Check if the request contains new arrival and departure dates
    String newArrival = request.getParameter("arrival");
    String newDeparture = request.getParameter("departure");

    if (newArrival != null && !newArrival.trim().isEmpty()) {
        session.setAttribute("arrival", newArrival);
        arrival = newArrival; // update local variable
    }

    if (newDeparture != null && !newDeparture.trim().isEmpty()) {
        session.setAttribute("departure", newDeparture);
        departure = newDeparture; // update local variable
    }
%>


<!DOCTYPE html>
<html lang="en">
	<head>
	   <meta charset="utf-8">
	   <meta http-equiv="X-UA-Compatible" content="IE=edge">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <title>Room Details | Moon Rock Travel</title>
	   <link rel="stylesheet" href="css/bootstrap.min.css">
	   <link rel="stylesheet" href="css/style.css">
	   <link rel="stylesheet" href="css/responsive.css">
	   <link rel="icon" href="images/fevicon.png" type="image/gif" />
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
	                           <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
	                           <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
	                           <li class="nav-item active"><a class="nav-link active" href="room.jsp">Our&nbsp;rooms</a></li>
	                           <li class="nav-item"><a class="nav-link" href="service.jsp">Services</a></li>
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
	         <input id="searchInput" class="search_input" type="text" placeholder="Search here..." onkeyup="searchItems()">
	         <button type="submit" class="search_icon"><i class="fa fa-search"></i></button>
	      </form>
	   </div>
	</div>
	
	<div class="back_re">
	   <div class="container">
	      <div class="row">
	         <div class="col-md-12">
	            <div class="title">
	               <h2>Room Details</h2>
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
	
	<div class="our_room">
	   <div class="container">
	      <div class="row">
	         <div class="col-md-6">
	            <img src="<%= image %>" alt="<%= name %>" class="img-fluid" />
	         </div>
	         <div class="col-md-6">
	            <h3><%= name %></h3>
				<p class="price" id="priceSection">
				   <strong id="priceValue" data-usd="<%= price %>" data-discount="<%= discount %>">$<%= price %> per night</strong>
				   <% if (discount > 0) { %>
				      <br><span id="discountText" style="color: green;">Discount: <%= discount %>%</span>
				   <% } %>
				   <br>
				   <button type="button" class="btn btn-sm btn-info mt-2" id="currencyToggleBtn" onclick="toggleCurrency()">Convert to LKR</button>
				</p>
	            <p><%= description %></p>
	            <ul class="list-unstyled">
	               <li>✔️ Type: <%= type %></li>
	               <li>✔️ Beds: <%= beds %></li>
	               <li>✔️ Adult Capacity: <%= adultCap %></li>
	               <li>✔️ Child Capacity: <%= childCap %></li>
	               <li>✔️ Free Wi-Fi</li>
	               <li>✔️ Room Service</li>
	            </ul>
				<form action="payment.jsp" method="get">
				   <div class="form-group">
				      <label for="arrival">Arrival Date</label>
				      <input type="date" id="arrival" name="arrival" class="form-control" value="<%= arrival != null ? arrival : "" %>">
				   </div>
				   <div class="form-group">
				      <label for="departure">Departure Date</label>
				      <input type="date" id="departure" name="departure" class="form-control" value="<%= departure != null ? departure : "" %>">
				   </div>
				   <input type="hidden" name="rid" value="<%= rid %>">
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
	                  <li class="active"><a href="room.jsp">Our Room</a></li>
	                  <li><a href="service.jsp">Services</a></li>
	                  <li><a href="gallery.jsp">Gallery</a></li>
	                  <li><a href="blog.jsp">Blog</a></li>
	                  <li><a href="contact.jsp">Contact Us</a></li>
	               </ul>
	            </div>
	            <div class="col-md-4">
	               <h3>Newsletter</h3>
	               <form class="bottom_form">
	                  <input class="enter" placeholder="Enter your email" type="text" name="email">
	                  <button class="sub_btn">Subscribe</button>
	               </form>
	               <ul class="social_icon">
	                  <li><a href="#"><i class="fa fa-facebook"></i></a></li>
	                  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
	                  <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
	                  <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
	               </ul>
	            </div>
	         </div>
	      </div>
	      <div class="copyright">
	         <div class="container">
	            <div class="row">
	               <div class="col-md-12 text-center">
	                  <p>© 2025 MOON ROCK HOTEL All Rights Reserved.<br>Group 8 @ SLIIT Kandy UNI</p>
	               </div>
	            </div>
	         </div>
	      </div>
	   </div>
	</footer>
	
	<script>
    function updateSessionDates() {
        const arrival = document.getElementById("arrival").value;
        const departure = document.getElementById("departure").value;

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "UpdateSessionDatesServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("arrival=" + encodeURIComponent(arrival) + "&departure=" + encodeURIComponent(departure));
    }

    document.getElementById("arrival").addEventListener("change", updateSessionDates);
    document.getElementById("departure").addEventListener("change", updateSessionDates);
	</script>
	
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/booking.js"></script>
	<script src="js/currencyToggle.js"></script>
	</body>
</html>





