<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <link rel="stylesheet" href="css/profile.css">
</head>
<c:set var="user" value="${userdetails}" />
<body>

  <div class="form-container">
    <h2>User Profile</h2>
    <form class="profile-info">
      <div class="name-row">
        <div class="info-block">
          <label for="firstName">First Name</label>
          <input type="text" id="firstName" name="firstName" value="${user.fname}" readonly />
        </div>
        <div class="info-block">
          <label for="lastName">Last Name</label>
          <input type="text" id="lastName" name="lastName" value="${user.lname}" readonly />
        </div>
      </div>

      <div class="info-block">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${user.email}" readonly />
      </div>

      <div class="info-block">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" value="${user.phone}" readonly />
      </div>

      <div class="info-block">
        <label for="address">Address</label>
        <input type="text" id="address" name="address" value="${user.address}" readonly />
      </div>
    </form>

    <!-- Buttons -->
    <div class="btn-group">
      <form action="EditProfile.jsp" method="post">
        <input type="hidden" name="firstname" value="${user.fname}">
        <input type="hidden" name="lastname" value="${user.lname}">
        <input type="hidden" name="email" value="${user.email}">
        <input type="hidden" name="phone" value="${user.phone}">
        <input type="hidden" name="address" value="${user.address}">
        <button type="submit">Edit Profile</button>
      </form>

      <button type="button" onclick="location.href='user.jsp'">Cancel</button>
    </div>
  </div>

</body>
</html>
