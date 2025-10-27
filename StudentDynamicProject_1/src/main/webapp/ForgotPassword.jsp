<%@ page import="com.StudentDTO.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot password</title>
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  background-color: #eaeaea;
  font-family: Arial, sans-serif;
}

form {
  width: 280px;
  padding: 50px;
  background-color: #f4f4f4;
  border-radius: 5px;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
}

label {
  display: block;
  margin-bottom: 0px;
  font-weight: bold;
  font-size: 14px;
}

input[type="email"],
input[type="tel"],
input[type="password"] {
  width: 100%;
  padding: 6px;
  margin-bottom: 0px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 14px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 6px;
  background-color: #444;
  color: white;
  border: none;
  border-radius: 3px;
  font-size: 14px;
  cursor: pointer;
}

button:hover {
  background-color: #222;
}
</style>
</head>
<body>

<% if(request.getAttribute("pswderror")!= null){%>
	<%= request.getAttribute("pswderror")%>
	<%}%>
	
	<form action="forgotpassword" method="post">
	  <label for="email">Email</label><br>
	  <input type="email" id="email" name="email" required placeholder="Enter registered email"><br><br>
	
	  <label for="phone">Phone Number</label><br>
	  <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required placeholder="Enter registered phone"><br><br>
	
	  <label for="password">Password</label><br>
	  <input type="password" id="password" name="password" required placeholder="Enter new password"><br><br>
	
	  <label for="confirm_password">Confirm Password</label><br>
	  <input type="password" id="confirm_password" name="confirm" required placeholder="confirm password"><br><br>
	
	  <button type="submit">Reset</button>
	</form>
</body>
</html>