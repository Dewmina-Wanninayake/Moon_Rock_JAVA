<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Service</title>
    <link rel="stylesheet" type="text/css" href="css/ServiceForm.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="form-box login">
        	<i class='bx bx-x-circle close-btn' onclick="handleClose()"></i>
            <form id="serviceForm" method="post" action="AddPackage">
                <h1>Add Service</h1>
                <br>

                
                <div class="input-box">
                    <input type="text" id="sname" name="serviceName" placeholder="Service Name" required>
                </div>

                <div class="input-box">
                    <select id="stype" name="serviceType" required>
                        <option value="" disabled selected>Select Service Type</option>
                        <option value="Health and Relaxation">Health and Relaxation</option>
                        <option value="Laundry Service">Laundry Service</option>
                        <option value="Food Beverages">Food and Beverages</option>
                        <option value="Recreation">Recreation</option>
                    </select>
                </div>


                
                <div class="input-box">
                    <select name="availability">
                        <option value="1">Available</option>
                        <option value="0">Not Available</option>
                    </select>
                </div>

                
                <div class="input-box">
                    <input type="number" step="0.01" name="price" placeholder="Price (e.g., 99.99)" required>
                </div>

                
                <div class="input-box">
                    <input type="number" step="0.01" name="discount" placeholder="Discount (e.g., 5.00)">
                </div>

                
                <div class="input-box">
                    <input type="date" name="dateAdded" placeholder="Date Added" required>
                </div>

                
                <div class="input-box">
                    <textarea name="description" placeholder="Description" rows="4" required></textarea>
                </div>

                
                <div class="input-box">
                    <input type="text" name="image" placeholder="Enter Image URL" required>
                </div>

                <br>

                
                <button type="submit" class="btn">Submit</button>
            </form>
        </div>

        
        <div class="toggle-box">
            <div class="slideshow">
                <img src="images/pexels-cottonbro-4691224.jpg" alt="Image Description" class="active">
                <img src="images/pexels-elly-fairytale-3865676.jpg">
                <img src="images/pexels-bemistermister-3434523.jpg">
                <img src="images/pexels-diana-onfilm-9562210.jpg">
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
            const form = document.getElementById("serviceForm");
            if (form.checkValidity() === false || !form.querySelectorAll('input').some(input => input.value !== "")) {
                window.location.href = "Admin.jsp";
            } else {
                if (confirm("You have unsaved changes. Are you sure you want to leave?")) {
                    window.location.href = "Admin.jsp";
                }
            }
        }
    </script>
</body>
</html>
