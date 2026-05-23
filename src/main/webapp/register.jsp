<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hotel Manager Registration</title>
  <link rel="stylesheet" href="css/register.css">
  <style>
    body {
      margin: 0;
      padding: 0;
      background: url('images/run.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: Arial, sans-serif;
    }

    .close-icon {
      position: absolute;
      top: 10px;
      right: 15px;
      font-size: 22px;
      text-decoration: none;
      color: red;
      z-index: 10;
    }

    .close-icon:hover {
      color: black;
    }

    .form-container {
      position: relative;
      width: 350px;
      margin: 60px auto;
      padding: 25px;
      background-color: rgba(255, 255, 255, 0.95);
      border: 1px solid #ccc;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
    }

    label {
      display: block;
      margin-top: 10px;
      font-weight: bold;
    }

    input, select {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      box-sizing: border-box;
    }

    button {
      margin-top: 15px;
      padding: 10px;
      width: 100%;
      background-color: #007BFF;
      border: none;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>

<body>
  <div class="form-container">
    <a href="index.jsp" class="close-icon" title="Close">X</a>
    <h2>Hotel Manager Registration</h2>
    <form action="addnewCustomer" method="post">
      <label for="fname">First Name</label>
      <input type="text" id="fname" name="fname" required>

      <label for="lname">Last Name</label>
      <input type="text" id="lname" name="lname" required>

      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" required>

      <label for="phone">Telephone Number</label>
      <input type="tel" id="phone" name="phone" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
      
      <label for="address">Address</label>
      <input type="text" id="address" name="address" required>
      
      <label for="role">Role</label>
      <select id="role" name="role" required>
        <option value="customer">Customer</option>
        <option value="manager">Manager</option>
      </select>

      <button type="submit">Register</button>
    </form>
  </div>
</body>
</html>
