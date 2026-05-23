<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
    String username = (String) session.getAttribute("username");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>MoonRockHotel</title>
  <link rel="stylesheet" href="css/signIn.css">
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
      font-size: 20px;
      text-decoration: none;
      color: red;
    }

    .close-icon:hover {
      color: black;
    }

    .form-container {
      position: relative;
      width: 300px;
      margin: 100px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.95);
      border: 1px solid #ccc;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }
  </style>
</head>
<body>
  <div class="form-container">
    <a href="index.jsp" class="close-icon" title="Close">X</a>
    <h2>Hotel Login</h2>
    <form action="CustomerLogin" method="post">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

      <button type="submit">Login</button>
    </form>
  </div>
</body>
</html>
