<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="css/manager.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <img src="images/logo.png" alt="Hotel Logo" style="width: 100px;" height="50">
        </div>
        <ul class="menu">
            <li class="active"><a href="#dashboard"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="#rooms"><i class="fa fa-door-open"></i><span>Rooms</span></a></li>
            <li><a href="#reservations"><i class="fa fa-calendar-check"></i><span>Reservations</span></a></li>
            <li class="logout"><a href="#logout"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li>
        </ul>
    </div>

    <div class="main-content">
        <!-- Header -->
        <section id="dashboard">
		<div class="header-wrapper">
		    <h2 class="header-title">Welcome Back, Manager! <%= request.getAttribute("firstName") %> <%= request.getAttribute("lastName") %></h2>
		</div>
        </section>

        <!-- Rooms Table -->
        <section id="rooms">
            <div class="tabular-wrapper">
                <h3 class="main-title" style="color:white;">Room Overview</h3>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Room ID</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Child Capacity</th>
                                <th>Adult Capacity</th>
                                <th>No Of Beds</th>
                               
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rm" items="${room}">


                            <tr>
                                <td>${rm.RID }</td>
                                <td>${rm.name }</td>
                                <td>${rm.type }</td>
                                <td>${rm.childCapacity }</td>
                                <td>${rm.adultCapacity }</td>
                                <td>${rm.noOfBeds }</td>
                                <td>${rm.description }</td>
                               
                               
                                <td><form action="DeleteRoom" method="post" onsubmit="return confirm('Are you sure you want to delete this room?');">
    <input type="hidden" name="id" value="${rm.RID}">
    <button type="submit" title="delete">
        <i class="fa-solid fa-trash"></i>
    </button>
</form>
</td> 
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
			<div class="icon-actions">
			    <form action="ManagerRoom" method="post">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
                </div>
            </div>
        </section>

        <!-- Reservations Table -->
        <section id="reservations">
            <div class="tabular-wrapper">
                <h3 class="main-title" style="color:white;">Reservations Overview</h3>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Reserve ID</th>
                                <th>User ID</th>
                                <th>Room ID</th>
                                <th>Service ID</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Re" items="${reservation}">


                            <tr>
    						<td>${Re.reserveID}</td>
    						<td>${Re.UID}</td>
    						<td>${Re.RID}</td>
    						<td>${Re.serviceID}</td>
    						<td>${Re.startDate}</td>
    						<td>${Re.endDate}</td>
   							<td>${Re.price}</td>


                               
                               
                                <td><form action="DeleteReservation" method="post" onsubmit="confirmDelete(event, this);">
                                    <input type="hidden" name="id1" value="${Re.reserveID}">
                                    <button type="submit"  title="delete">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form></td> 
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
			<div class="icon-actions">
			    <form action="ManagerReservation" method="post">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
                </div>
            </div>
        </section>
    </div>
</body>
</html>