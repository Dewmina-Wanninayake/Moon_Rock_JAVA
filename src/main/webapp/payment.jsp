<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBconnect" %>
<%@ page session="true" %>
<%
    // Dummy session attributes for testing login
    
        session.setAttribute("username", "Shantha");
        session.setAttribute("uid", 2); // You can assign any dummy user ID
    
%>


<%
	String username = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("userRole");
    String arrival = request.getParameter("arrival");
    String departure = request.getParameter("departure");
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

    String name = "", type = "", image = "";
    double price = 0.0, discount = 0.0;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBconnect.getConnection();
        String sql = "SELECT name, type, price, discount, image FROM Room WHERE RID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, rid);
        rs = stmt.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            type = rs.getString("type");
            price = rs.getDouble("price");
            discount = rs.getDouble("discount");
            image = rs.getString("image");
        } else {
            out.println("<p>Room not found.</p>");
            return;
        }
    } catch (Exception e) {
        out.println("<p>Error loading booking summary: " + e.getMessage() + "</p>");
        return;
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }

    LocalDate arrivalDate = LocalDate.parse(arrival);
    LocalDate departureDate = LocalDate.parse(departure);
    long nights = ChronoUnit.DAYS.between(arrivalDate, departureDate);

    if (nights <= 0) {
        out.println("<p style='color:red;'>Invalid date range. Please go back and select valid dates.</p>");
        return;
    }

    double finalPricePerNight = price - (price * (discount / 100));
    double totalAmount = nights * finalPricePerNight;

    LocalDate currentDate = LocalDate.now();
    String today = currentDate.format(DateTimeFormatter.ISO_DATE);
%>

<%
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
    String formattedArrival = arrivalDate.format(formatter);
    String formattedDeparture = departureDate.format(formatter);
%>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>MoonRockHotel</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/responsive.css">
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
                           <li class="nav-item"><a class="nav-link" href="room.jsp">Our&nbsp;rooms</a></li>
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
               <h2>Make Payment</h2>
            </div>
         </div>
      </div>
   </div>
</div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="AddPayment" method="post" class="bg-light p-4 shadow rounded">
                <h4 class="mb-4">Payment Details</h4>
                <input type="hidden" name="rid" value="<%= rid %>">
                <input type="hidden" name="arrival" value="<%= arrival %>">
                <input type="hidden" name="departure" value="<%= departure %>">

                <div class="form-group">
                    <label for="amount">Total Amount (USD)</label>
                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" required value="<%= String.format("%.2f", totalAmount) %>">
                </div>

                <div class="form-group">
                    <label for="paidDate">Paid Date</label>
                    <input type="date" class="form-control" id="paidDate" name="paidDate" value="<%= today %>" required>
                </div>

                <div class="form-group">
                    <label for="paidMethod">Payment Method</label>
                    <select class="form-control" id="paidMethod" name="paidMethod" required onchange="togglePaymentFields()">
                        <option value="">Select a method</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Debit Card">Debit Card</option>
                        <option value="PayPal">PayPal</option>
                        <option value="Cash">Cash</option>
                    </select>
                </div>

                <div id="creditCardFields" style="display:none;">
                    <div class="form-group"><label>Card Number</label><input type="text" name="cardNumber" class="form-control"></div>
                    <div class="form-group"><label>Expiry Date</label><input type="text" name="expiryDate" class="form-control" placeholder="MM/YY"></div>
                    <div class="form-group"><label>CVV</label><input type="text" name="cvv" class="form-control"></div>
                </div>

                <div id="paypalFields" style="display:none;">
                    <div class="form-group"><label>PayPal Email</label><input type="email" name="paypalEmail" class="form-control"></div>
                </div>

                <div id="cashFields" style="display:none;">
                    <div class="form-group"><label>Amount Received</label><input type="number" name="cashReceived" class="form-control"></div>
                    <div class="form-group"><label>Change Given</label><input type="number" name="changeGiven" class="form-control"></div>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Complete Payment</button>
            </form>
        </div>

        <div class="col-md-5">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Booking Summary</h5>
                    </div>
                    <div class="card-body">
                        <img src="<%= image %>" alt="Room Image" class="img-fluid mb-3 rounded">
                        <p><strong>Room:</strong> <%= name %> (<%= type %>)</p>
                        <p><strong>Arrival:</strong> <%= formattedArrival %></p>
                        <p><strong>Departure:</strong> <%= formattedDeparture %></p>
                        <p><strong>Number of nights:</strong> <%= nights %></p>
                        <p><strong>Original price per night:</strong> $<%= String.format("%.2f", price) %></p>
                        <p><strong>Discount:</strong> <%= discount %>%</p>
                        <p><strong>Discounted price per night:</strong> $<%= String.format("%.2f", finalPricePerNight) %></p>
                        <p><strong>Total amount:</strong> <span class="text-success">$<%= String.format("%.2f", totalAmount) %></span></p>
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
                     <li><a href="#">Home</a></li>
                     <li><a href="about.jsp">About</a></li>
                     <li class="active"><a href="room.jsp">Our Room</a></li>
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
   <script src="js/redirect.js"></script>
   <script src="js/custom.js"></script>
   
<script>
function togglePaymentFields() {
    var method = document.getElementById("paidMethod").value;
    document.getElementById("creditCardFields").style.display = (method === "Credit Card" || method === "Debit Card") ? "block" : "none";
    document.getElementById("paypalFields").style.display = (method === "PayPal") ? "block" : "none";
    document.getElementById("cashFields").style.display = (method === "Cash") ? "block" : "none";
    
    document.querySelector("form[action='AddPayment']").addEventListener("submit", function(e) {
        const method = document.getElementById("paidMethod").value;

        if (!method) {
            alert("Please select a payment method.");
            e.preventDefault();
            return;
        }

        if (method === "Credit Card" || method === "Debit Card") {
            const cardNumber = document.querySelector("[name='cardNumber']").value.trim();
            const expiryDate = document.querySelector("[name='expiryDate']").value.trim();
            const cvv = document.querySelector("[name='cvv']").value.trim();

            if (!/^\d{16}$/.test(cardNumber)) {
                alert("Please enter a valid 16-digit card number.");
                e.preventDefault();
                return;
            }

            if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiryDate)) {
                alert("Expiry date must be in MM/YY format.");
                e.preventDefault();
                return;
            }

            if (!/^\d{3}$/.test(cvv)) {
                alert("Please enter a valid 3-digit CVV.");
                e.preventDefault();
                return;
            }
        }

        if (method === "PayPal") {
            const email = document.querySelector("[name='paypalEmail']").value.trim();
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                alert("Please enter a valid PayPal email.");
                e.preventDefault();
                return;
            }
        }

        if (method === "Cash") {
            const received = parseFloat(document.querySelector("[name='cashReceived']").value);
            const change = parseFloat(document.querySelector("[name='changeGiven']").value);
            const total = parseFloat(document.querySelector("#amount").value);

            if (isNaN(received) || received < total) {
                alert("Cash received must be equal to or greater than the total amount.");
                e.preventDefault();
                return;
            }

            if (isNaN(change)) {
                alert("Please enter the change given.");
                e.preventDefault();
                return;
            }
        }
    });
}
</script>

</body>
</html>
