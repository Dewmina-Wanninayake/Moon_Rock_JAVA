<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator Update</title>
<link rel="stylesheet" type="text/css" href="css/Form.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

	<div class="container">
		<div class="form-box login">
		
			<i class='bx bx-x-circle close-btn' onclick="handleClose()"></i>
			
			<form id="adminForm" method="POST" action="UpdateAdmin">
				<h1>Administrator update</h1>
  				<div class="input-box">
					
					<input type="text" name="aid" value="${param.aid}" readonly>
					
				</div>
				<div class="input-box">
					
					<input type="text" id="fname" name="firstname" value="${param.firstname }" placeholder="First Name">
					
				</div>
				<div class="input-box">
					
					<input type="text" id="lname" name="lastname" value="${param.lastname }" placeholder="Last Name">
					
				</div>
				
				<div class="input-box">
					
					<input type="tel" id="phone" name="phone" value="${param.phone}" placeholder="Phone Number">
					
				</div>
				
				<div class="input-box">
					
					<input type="email" id="email" name="email" value="${param.email}" placeholder="Email">
					
				</div>
				<div class="input-box">
					
					<input type="text" id="password" name="password" value="${param.password}" placeholder="Password">
					
				</div>
				
				

				<button type="submit" class="btn">Update</button>

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
        }, 5000);
        
        
        function handleClose() {
            const form = document.getElementById("adminForm");//close button
            const inputs = form.querySelectorAll('input');

            
            let hasChanged = false;
            inputs.forEach(input => {
                if (input.defaultValue !== input.value) {
                    hasChanged = true;
                }
            });

            if (hasChanged) {
                if (confirm("You have unsaved changes. Are you sure you want to leave?")) {
                    window.location.href = "Admin.jsp";
                }
            } else {
                window.location.href = "Admin.jsp";
            }
        }
    </script>
</body>
</html>

  