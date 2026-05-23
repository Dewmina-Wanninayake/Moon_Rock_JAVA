<%@ page import="java.util.*, services.CustomerService, model.User, javax.servlet.http.*,javax.servlet.*" %>

<%
    String username = (String) session.getAttribute("username");
    String userType = (String) session.getAttribute("userRole"); 
%>

<%
    CustomerService service1 = new CustomerService();
    ArrayList<User> customer = service1.getAllCus();
    request.setAttribute("customer", customer);
%>

<%@ page import="java.util.*, services.StaffService, model.User" %>


<%
    StaffService service = new StaffService();
    ArrayList<User> staff = service.getAllStaff();
    request.setAttribute("staff", staff);
%>

<%@ page import="java.util.*, services.AdminService, model.Admin" %>


<%
    AdminService service3 = new AdminService();
    ArrayList<Admin> admin = service3.getAllAdmin();
    request.setAttribute("admin", admin);
%>

<%@ page import="java.util.*, services.AdminPackage, model.APackage" %>


<%
	AdminPackage service5 = new AdminPackage();
	ArrayList<APackage> serviceP = service5.getAllPack();
	request.setAttribute("serviceP", serviceP);
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ page contentType="text/html; charset=UTF-8" language="java" %>
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/AdminDash.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bungee+Spice&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.archivo-black-regular {
  font-family: "Archivo Black", sans-serif;
  font-weight: 400;
  font-style: normal;
}


</style>

<meta charset="UTF-8">
<title>Admin Panel</title>
</head>
<body>


   <div class="sidebar">
    <div class="logo"></div>
        <ul class="menu">
            <li class="active">
                <a href="#dashboard">
                    <i class="fa fa-tachometer" aria-hidden="true"></i>
                    <span>Menu</span>
                </a>
            </li>
            <li>
                <a href="#customer">
                   <i class="fa-solid fa-user"></i>
					<span>Customer</span>
                   
                </a>
            </li>
            <li>
                <a href="#staff">
                    <i class="fa-solid fa-user-tie"></i>
                    <span>Staff</span>
                </a>
            </li>
            <li>
                <a href="#service package details">
                    <i class="fa fa-id-card" aria-hidden="true"></i>
                    <span>Service </span>
                </a>
            </li>
            <li> 
                <a href="#admin">
                    <i class="fa-solid fa-id-card-clip"></i>
                    <span>Admin</span>
                </a>
            </li>
            <li class="logout">
                <a href="LogoutServlet">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>

    <!--Main content-->

    <div class="main-content">
       <div class="header-wrapper">
        <div class="header-title">
        	<h2>Welcome, Nanda Malini</h2>
        	<p>nanda@gmail.com</p>
             <br>
    </div> 
            </div>

	<div class="card-container">
        <h3 class="main-title" id="menu"></h3>
        <div class="card-wrapper">
            <div class="payment-card">
                <div class="card-header">
                    <div class="amount">
                        <span class="title">Total Customer</span>
                        <span class="amount-value"><%= customer.size() %></span>
                    </div>
                </div>
            </div>
            <div class="payment-card">
                <div class="card-header">
                    <div class="amount">
                        <span class="title">Total Staff</span>
                        <span class="amount-value"><%= staff.size() %></span>
                    </div>
                </div>
            </div>
            <div class="payment-card">
                <div class="card-header">
                    <div class="amount">
                        <span class="title">Total Services</span>
                        <span class="amount-value"><%= serviceP.size() %></span>
                    </div>
                </div>
            </div>
            <div class="payment-card">
                <div class="card-header">
                    <div class="amount">
                        <span class="title">Total Administrators</span>
                        <span class="amount-value"><%= admin.size() %></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <div class="tabular-wrapper">
        <h3 class="main-title" id="customer">Customer Details</h3>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                     	<th scope="col">ID</th>
			 			<th scope="col">First name</th>
						<th scope="col">Last name</th>
						<th scope="col">E-mail</th>
						<th scope="col">Password</th>
						<th scope="col">Phone number</th>
						<th scope="col">Address</th>
						<th scope="col">Type</th>
						<th scope="col">Action</th>
						<th scope="col"> </th>
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach var="cus" items="${customer}">
		
						<tr>
							<td>${cus.uid }</td>
							<td>${cus.firstname }</td>
							<td>${cus.lastname }</td>
							<td>${cus.email }</td>
							<td>${cus.password }</td>
							<td>${cus.phone }</td>
							<td>${cus.address }</td>
							<td>${cus.type }</td>
							<td>
            					<a href="CustomerUpdate.jsp?uid=${cus.uid}
            					&firstname=${cus.firstname}
            					&lastname=${cus.lastname}
            					&email=${cus.email}
            					&password=${cus.password}
            					&phone=${cus.phone}
            					&address=${cus.address}">
                				<button type="button" title="edit">
                					<i class="fa-solid fa-pen-to-square"></i>
                				</button>
            					</a>
        					</td>
							<td><form action="DeleteCustomer" method="post" onsubmit="confirmDelete(event, this);">
								<input type="hidden" name="id" value="${cus.uid}">
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
			    <form action="AdminCustomerTbl" method="get">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
			
			    <a href="CustomerReg.jsp" title="add">
			        <i class="fa-solid fa-user-plus"></i>
			    </a>
			</div>

            
        </div>
    </div> 
       
       
        
        <!--Staff table-->
        <div class="tabular-wrapper">
        <h3 class="main-title" id="staff">Staff Details</h3>
        <div class="table-container">
        
	          <table>
                <thead>
                    <tr>
                    	<th scope="col">ID</th>
			 			<th scope="col">First name</th>
						<th scope="col">Last name</th>
						<th scope="col">E-mail</th>
						<th scope="col">Password</th>
						<th scope="col">Phone number</th>
						<th scope="col">Address</th>
						<th scope="col">Type</th>
						<th scope="col">Action</th>
						<th scope="col"> </th>
                        
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach var="stf" items="${staff}">
		
						<tr>
							<td>${stf.uid }</td>
							<td>${stf.firstname }</td>
							<td>${stf.lastname }</td>
							<td>${stf.email }</td>
							<td>${stf.password }</td>
							<td>${stf.phone }</td>
							<td>${stf.address }</td>
							<td>${stf.type }</td>
							<td>
            					<a href="SUpdate.jsp?uid=${stf.uid}
            					&firstname=${stf.firstname}
            					&lastname=${stf.lastname}
            					&email=${stf.email}
            					&password=${stf.password}
            					&phone=${stf.phone}
            					&address=${stf.address}
            					&type=${stf.type}">
                				<button type="button" title="edit">
                					<i class="fa-solid fa-pen-to-square"></i>
                				</button>
            					</a>
        					</td>
							<td><form action="DeleteStaff" method="post" onsubmit="confirmDelete(event, this);">
								<input type="hidden" name="id" value="${stf.uid}">
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
			    <form action="AdminStaffTbl" method="get">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
			
			    <a href="StaffRegister.jsp" title="add">
			        <i class="fa-solid fa-user-plus"></i>
			    </a>
			</div>

            
        </div>
    </div> 
    
    <!-- Service table -->
    
        <div class="tabular-wrapper">
        <h3 class="main-title" id="service package details">Service Package Details</h3>
        <div class="table-container">
        
	          <table>
                <thead>
                    <tr>
                    	<th scope="col">Service ID</th>
			 			<th scope="col">Service name</th>
						<th scope="col">Service Type</th>
						<th scope="col">Availability</th>
						<th scope="col">Price</th>
						<th scope="col">Discount</th>
						<th scope="col">Date Added</th>
						<th scope="col">Description</th>
						<th scope="col">Image</th>
						<th scope="col">Action</th>
						<th scope="col"> </th>
                        
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach var="serviceP" items="${serviceP}">
		
						<tr>
                        <td>${serviceP.serviceID}</td>
                        <td>${serviceP.serviceName}</td>
                        <td>${serviceP.serviceType}</td>
                        <td>${serviceP.availability ? "Available" : "Not Available"}</td>
                        <td>${serviceP.price}</td>
                        <td>${serviceP.discount}</td>
                        <td>${serviceP.dateAdded}</td>
                        <td>${serviceP.description}</td>
                        <td>
                            <a href="${serviceP.image}" target="_blank">
                                <img src="${serviceP.image}" alt="Service Image" style="width: 100px; height: 100px; object-fit: cover;">
                            </a>
                        </td>

							<td>
					            <a href="ServiceUpdate.jsp?serviceID=${serviceP.serviceID}
					                    &serviceName=${fn:escapeXml(serviceP.serviceName)}
					                    &serviceType=${fn:escapeXml(serviceP.serviceType)}
					                    &availability=${serviceP.availability ? 1 : 0}
					                    &price=${serviceP.price}
					                    &discount=${serviceP.discount}
					                    &dateAdded=${serviceP.dateAdded}
					                    &description=${fn:escapeXml(serviceP.description)}
					                    &image=${fn:escapeXml(serviceP.image)}">
							        <button type="button" title="edit">
							            <i class="fa-solid fa-pen-to-square"></i>
							        </button>
            					</a>
            					
        					</td>
							<td><form action="DeleteService" method="post" onsubmit="confirmDelete(event, this);">
								<input type="hidden" name="serviceID" value="${serviceP.serviceID}">
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
			    <form action="AdminServiceTbl" method="get">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
			
			    <a href="ServiceAdd.jsp" title="add">
			        <i class="fa-solid fa-user-plus"></i>
			    </a>
			</div>

            
        </div>
    </div>
    
    
    <!-- Admin table --> 
    
        <div class="tabular-wrapper">
        <h3 class="main-title" id="admin">Admin Details</h3>
        <div class="table-container">
        
	          <table>
                <thead>
                    <tr>
                    	<th scope="col">Admin ID</th>
			 			<th scope="col">First name</th>
						<th scope="col">Last name</th>
						<th scope="col">Phone number</th>
						<th scope="col">E-mail</th>
						<th scope="col">Password</th>
						<th scope="col">Action</th>
						<th scope="col"> </th>
                        
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach var="admin" items="${admin}">
		
						<tr>
							<td>${admin.aid }</td>
							<td>${admin.firstname }</td>
							<td>${admin.lastname }</td>
							<td>${admin.phone}</td>
							<td>${admin.email }</td>
							<td>${admin.password }</td>
							<td>
            					<a href="AdminUpdate.jsp?aid=${admin.aid}
            					&firstname=${admin.firstname}
            					&lastname=${admin.lastname}
            					&phone=${admin.phone}
            					&email=${admin.email}
            					&password=${admin.password}">
                				<button type="button" title="edit">
                					<i class="fa-solid fa-pen-to-square"></i>
                				</button>
            					</a>
        					</td>
							<td>
							    <form action="DeleteAdmin" method="post" onsubmit="confirmDelete(event, this);">
							        <input type="hidden" name="id" value="${admin.aid}">
							        <button type="submit" title="delete">
							            <i class="fa-solid fa-trash"></i>
							        </button>
							    </form>
							</td>

					</c:forEach>
 						
                   </tbody>
                
            </table>
            <br>
			<div class="icon-actions">
			    <form action="AdminTable" method="get">
			        <button type="submit" title="view">
			            <i class="fa-solid fa-square-caret-down"></i>
			        </button>
			    </form>
			
			    <a href="AdminRegister.jsp" title="add">
			        <i class="fa-solid fa-user-plus"></i>
			    </a>
			</div>

            
        </div>
    </div> 
    
    
</div><!--close main div--> 

<script>

function confirmDelete(event, form) {
	event.preventDefault(); // stop form from submitting right away
	
	
    Swal.fire({
        title: 'Are you sure want to delete this user?',
        text: "This action will permanently delete the user.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit(); // submit only if confirmed
        }
    });
}
    
    
    document.querySelectorAll('.menu a').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();  

            
            const targetId = this.getAttribute('href').substring(1); 

           
            document.getElementById(targetId).scrollIntoView({
                behavior: 'smooth', 
                block: 'start'      
            });
        });
    });
</script>

</body>

</html>