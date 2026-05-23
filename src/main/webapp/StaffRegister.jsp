<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Form.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
   .error-message {
         color: red;
         font-size: 0.7em;
         margin-top: 2px;
}
</style>
</head>
<body>
	
	<div class="container">
		<div class="form-box login">
			<i class='bx bx-x-circle close-btn' onclick="handleClose()"></i>
			<form id="staffForm" method="post" action="AddStaff">
				<h1>Staff Registration</h1>
				<br>
				<div class="input-box">
					<input type="text" id="fname" name= "firstname" placeholder="First Name"
							value="<%= request.getParameter("firstname") != null ? request.getParameter("firstname") : "" %>" required>
                    <div id="fnameError" class="error-message"></div>
					
				</div>
				<div class="input-box">
					<input type="text" id="lname" name= "lastname" placeholder="Last Name" 
							value="<%= request.getParameter("lastname") != null ? request.getParameter("lastname") : "" %>" required>
                    <div id="lnameError" class="error-message"></div>
					
				</div>
				<div class="input-box">
					<input type="email" id="email" name="email" placeholder="E-mail"
					         value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
                    <div id="emailError" class="error-message"></div>
				</div>
				<div class="input-box">
					<input type="tel" id="phone" name="phone" placeholder="Phone Number"
					          value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" required>
                    <div id="phoneError" class="error-message"></div>
				</div>
				<div class="input-box">
					<input type="text" id="address" name="address" placeholder="Address"
					          value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" required>
                    <div id="addressError" class="error-message"></div>
				</div>
				
				<div class="input-box">
					<input type="password" id="password" name="password" placeholder="Password" required>
					<div id="passwordError" class="error-message"></div>
				</div>
				
				<div class="input-box">
					<input type="text" id="type" name="type" placeholder="Type" required>
				</div>
				
				<br>
				
				<button type="submit" class="btn">Submit</button>

			</form>
		</div>
		
        <div class="toggle-box">
            <div class="slideshow">
                <img src="images/el-a5hTpFFqrxw-unsplash.jpg" alt="Image Description" class="active">
                <img src="images/pexels-pixabay-261102.jpg">
                <img src="images/pexels-cottonbro-5378686.jpg">
                <img src="images/pexels-rahimegul-30303984.jpg">
            </div>
        </div>
    </div>
    
    <script>
        const slides = document.querySelectorAll('.slideshow img');
        let currentSlide = 0;

        setInterval(() => {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }, 5000);
        
        function handleClose() { //close button
            const form = document.getElementById("staffForm");
            if (form.checkValidity() === false || !form.querySelectorAll('input').some(input => input.value !== "")) {
                window.location.href = "Admin.jsp";
            } else {
                if (confirm("You have unsaved changes. Are you sure you want to leave?")) {
                    window.location.href = "Admin.jsp";
                }
            }
        }
        
        const form = document.getElementById("staffForm");

        function clearErrors() {
            document.getElementById("fnameError").textContent = "";
            document.getElementById("lnameError").textContent = "";
            document.getElementById("phoneError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("addressError").textContent = "";
            document.getElementById("passwordError").textContent = "";
        }

        form.addEventListener("submit", function (e) {
            clearErrors();
            let isValid = true;

            const namePattern = /^[A-Z][a-zA-Z]*$/;
            const phonePattern = /^0\d{9}$/;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!namePattern.test(fname.value)) {
                fnameError.textContent = "First name must start with a capital letter.";
                isValid = false;
            }

            if (!namePattern.test(lname.value)) {
                lnameError.textContent = "Last name must start with a capital letter.";
                isValid = false;
            }

            if (!phonePattern.test(phone.value)) {
                phoneError.textContent = "Phone number must start with 0 and be exactly 10 digits long.";
                isValid = false;
            }

            if (!emailPattern.test(email.value)) {
                emailError.textContent = "Please enter a valid email address.";
                isValid = false;
            }

            if (address.value.trim() === "") {
                addressError.textContent = "Address cannot be empty.";
                isValid = false;
            }

            if (password.value.trim() === "") {
                passwordError.textContent = "Password cannot be empty.";
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>

