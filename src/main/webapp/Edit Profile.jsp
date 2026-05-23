<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Profile</title>
  <link rel="stylesheet" href="css/EditProfile.css">

  <!-- JavaScript validation for phone number -->
  <script>
    function validateForm() {
      const phoneInput = document.getElementById("phone").value;
      const phonePattern = /^[0-9]{10}$/;

      if (!phonePattern.test(phoneInput)) {
        alert("Please enter a valid 10-digit phone number.");
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
  <div class="form-container">

    <h2>Edit Profile</h2>

    <form action="UpdateCustomer" method="post" onsubmit="return validateForm();">
      <div class="name-row">
        <div class="input-group">
          <label for="fname">First Name</label>
          <input type="text" id="fname" name="fname" value="${param.fname}" required>
        </div>
        <div class="input-group">
          <label for="lname">Last Name</label>
          <input type="text" id="lname" name="lname" value="${param.lname}" required>
        </div>
      </div>

      <div class="input-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${param.email}" required>
      </div>

      <div class="input-group">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" value="${param.phone}" required
               pattern="[0-9]{10}" title="Enter a 10-digit phone number (e.g., 0771234567)">
      </div>

      <div class="input-group">
        <label for="address">Address</label>
        <input type="text" id="address" name="address" value="${param.address}" required>
      </div>

      <button type="submit">Save Changes</button>
      <a href="index.jsp" class="cancel-btn">Cancel</a>
    </form>
  </div>
</body>
</html>