<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String username = (String) session.getAttribute("username");
	String firstName = (String) request.getAttribute("firstName");
	String lastName = (String) request.getAttribute("lastName");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="css/manager.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<c:set var="user" value="${userdetails}"/>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Hotel Logo" style="width: 100px; height: 50px;">
        
       </div>
        <ul class="menu">
            <li class="active"><a href="#dashboard"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
           
            <li><a href="#payments"><i class="fa fa-wallet"></i><span>Payments</span></a></li>
            <li><a href="profile.jsp"><i class="fa fa-user"></i><span>Profile</span></a></li>
            <form id="profileForm" action="UserInfo" method="post" style="display: none;">
    		<input type="hidden" name="email" value="${user.email}">
 		 	</form>
            <li class="logout"><a href="LogoutServlet"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="main-content">
        <!-- Dashboard Section -->
        <section id="dashboard">
            <div class="header-wrapper">
                <h2 class="header-title">Welcome Back, User!</h2>
            </div>

            <!-- Removed the card-container section -->
        </section>

       
        <!-- Payment Section -->
        <section id="payment" class="hidden">
            <div class="tabular-wrapper">
                <h3 class="main-title" style="color:white;">Payment History</h3>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Payment ID</th>
                                <th>Amount</th>
                                <th>Paid Date</th>
                                <th>Paid Method</th>
                                
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="Pa" items="${payment}">


                            <tr>
    						<td>${Pa.PID}</td>
    						<td>${Pa.amount}</td>
    						<td>${Pa.paidDate}</td>
    						<td>${Pa.paidMethod}</td>
    						

                            </tr>
                        </c:forEach>
                            
                        </tbody>
                    </table>
                    <br>
                    <div class="icon-actions">
			    <form action="UserPayment" method="post">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
                </div>
                
                </div>
            </div>
        </section>
    </div>

    
</body>
</html>