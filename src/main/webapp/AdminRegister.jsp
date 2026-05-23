<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrator Registration</title>
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

			
            <form id="adminForm" method="post" action="AddAdmin">
                <h1>Administrator Registration</h1>
                <br>

                <div class="input-box">
                    <input type="text" id="fname" name="firstname" placeholder="First name"
                           value="<%= request.getParameter("firstname") != null ? request.getParameter("firstname") : "" %>" required>
                    <div id="fnameError" class="error-message"></div>
                </div>

                <div class="input-box">
                    <input type="text" id="lname" name="lastname" placeholder="Last name"
                           value="<%= request.getParameter("lastname") != null ? request.getParameter("lastname") : "" %>" required>
                    <div id="lnameError" class="error-message"></div>
                </div>

                <div class="input-box">
                    <input type="tel" id="phone" name="phone" placeholder="Phone Number"
                           value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" required>
                    <div id="phoneError" class="error-message"></div>
                </div>

                <div class="input-box">
                    <input type="email" id="email" name="email" placeholder="E-mail"
                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
                    <div id="emailError" class="error-message"></div>
                </div>

                <div class="input-box">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <div id="passwordError" class="error-message"></div>
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
    
    const slides = document.querySelectorAll('.slideshow img'); //form images
    let currentSlide = 0;

    setInterval(() => {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add('active');
    }, 4000);
    
    
    
    function handleClose() { //close button
        const form = document.getElementById("adminForm");
        if (form.checkValidity() === false || !form.querySelectorAll('input').some(input => input.value !== "")) {
            window.location.href = "Admin.jsp";
        } else {
            if (confirm("You have unsaved changes. Are you sure you want to leave?")) {
                window.location.href = "Admin.jsp";
            }
        }
    }
    

        const form = document.getElementById("adminForm"); //validation

        
        function clearErrors() {
            document.getElementById("fnameError").textContent = "";
            document.getElementById("lnameError").textContent = "";
            document.getElementById("phoneError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("passwordError").textContent = "";
        }

        form.addEventListener("submit", function (e) {
            clearErrors();
            let isValid = true;

            const firstname = document.getElementById("fname").value;
            const lastname = document.getElementById("lname").value;
            const phone = document.getElementById("phone").value;
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;

            
            const namePattern = /^[A-Z][a-zA-Z]*$/;
            const phonePattern = /^0\d{9}$/;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            
            if (!namePattern.test(firstname)) {
                document.getElementById("fnameError").textContent = "First name must start with a capital letter and contain only letters.";
                isValid = false;
            }

            
            if (!namePattern.test(lastname)) {
                document.getElementById("lnameError").textContent = "Last name must start with a capital letter and contain only letters.";
                isValid = false;
            }

            
            if (!phonePattern.test(phone)) {
                document.getElementById("phoneError").textContent = "Phone number must start with 0 and be exactly 10 digits long.";
                isValid = false;
            }

            
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").textContent = "Please enter a valid email address.";
                isValid = false;
            }

            
            if (password.trim() === "") {
                document.getElementById("passwordError").textContent = "Password cannot be empty.";
                isValid = false;
            }

           
            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
