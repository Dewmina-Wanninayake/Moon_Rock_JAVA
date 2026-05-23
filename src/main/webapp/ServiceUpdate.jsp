<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Update</title>
    <link rel="stylesheet" type="text/css" href="css/ServiceForm.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <div class="container">
        <div class="form-box login">
        	<i class='bx bx-x-circle close-btn' onclick="handleClose()"></i>
            <form id="serviceForm" method="POST" action="UpdateService">
                <h1>Service Update</h1>

               
                <div class="input-box">
                    <input type="text" name="serviceID" value="${param.serviceID}" readonly>
                </div>

                
                <div class="input-box">
                    <input type="text" name="serviceName" value="${param.serviceName}" placeholder="Service Name" required>
                </div>

                <div class="input-box">
                    <select name="serviceType" required>
                        <option value="" disabled>Select Service Type</option>
                        <option value="Health and Relaxation" ${param.serviceType == 'Health and Relaxation' ? 'selected' : ''}>Health and Relaxation</option>
                        <option value="Laundry Service" ${param.serviceType == 'Laundry Service' ? 'selected' : ''}>Laundry Service</option>
                        <option value="Food Beverages" ${param.serviceType == 'Food Beverages' ? 'selected' : ''}>Food and Beverages</option>
                        <option value="Recreation" ${param.serviceType == 'Recreation' ? 'selected' : ''}>Recreation</option>
                    </select>
                </div>
				
                
                
                <div class="input-box">
                    <select name="availability">
                        <option value="1" ${param.availability == '1' ? 'selected' : ''}>Available</option>
                        <option value="0" ${param.availability == '0' ? 'selected' : ''}>Not Available</option>
                    </select>
                </div>
                

                
                <div class="input-box">
                    <input type="number" step="0.01" name="price" value="${param.price}" placeholder="Price" required>
                </div>

               
                <div class="input-box">
                    <input type="number" step="0.01" name="discount" value="${param.discount}" placeholder="Discount">
                </div>

                
                <div class="input-box">
                    <input type="date" name="dateAdded" value="${param.dateAdded}" placeholder="Date Added" required>
                </div>

                
                <div class="input-box">
                    <textarea name="description" placeholder="Description" required>${param.description}</textarea>
                </div>

                
                <div class="input-box">
                    <input type="text" name="image" value="${param.image}" placeholder="Image URL" required>
                </div>

              
                <button type="submit" class="btn">Update</button>
				
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
        
        function handleClose() {
            const form = document.getElementById("serviceForm");//close button
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
