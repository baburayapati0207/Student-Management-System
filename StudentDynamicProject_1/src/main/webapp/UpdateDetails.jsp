<%@ page import="com.StudentDTO.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Details</title>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f5f6fa;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  background-color: #fff;
  padding: 40px 50px;
  width: 420px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
}

.header {
  text-align: center;
  margin-bottom: 25px;
  color: #333;
}

.update-form {
  display: flex;
  flex-direction: column;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
  color: #444;
  display: block;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 15px;
  outline: none;
  transition: 0.3s;
}

input:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0,123,255,0.3);
}

.btn-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 10px;
}

.update-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 12px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
}

.update-btn:hover {
  background-color: #0056b3;
}

.back-btn {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 12px 20px;
  border-radius: 5px;
  font-size: 16px;
  transition: 0.3s;
}

.back-btn:hover {
  background-color: #333;
}
</style>
</head>
<body>

	<%Student s = (Student) session.getAttribute("student"); 
	  if(s != null) {
	%>
	
	  <div class="container">
	    <h1 class="header">Update Your Details</h1>
	
	    <form class="update-form" action="updateStudent" method="post">
	      <div class="form-group">
	        <label for="id">Id</label>
	        <input type="text" id="id" name="id" value="<%= s.getId() %>" readonly>
	      </div>
	
	      <div class="form-group">
	        <label for="name">Name</label>
	        <input type="text" id="name" name="name" placeholder="Enter name" required>
	      </div>
	
	      <div class="form-group">
	        <label for="phone">Phone</label>
	        <input type="tel" id="phone" name="phone" placeholder="Enter phone number" required>
	      </div>
	
	      <div class="form-group">
	        <label for="email">Email</label>
	        <input type="email" id="email" name="email" placeholder="Enter email" required>
	      </div>
	
	      <div class="form-group">
	        <label for="branch">Branch</label>
	        <input type="text" id="branch" name="branch" placeholder="Enter Branch" required>
	      </div>
	      <div class="form-group">
	        <label for="loc">Location</label>
	        <input type="text" id="loc" name="location" placeholder="Enter Location" required>
	      </div>
	
	      <div class="btn-container">
	      		<a href="DashBoard.jsp" class="back-btn">Back</a>
	      		<button type="submit" class="update-btn">Update</button>
	      </div>
	    </form>
	    
	  </div>
	  
	    <% 
	    }
	    else{
	    	request.setAttribute("error", "Session expired");
	    	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	    	rd.forward(request, response);
	    }
	  	%>
	
</body>
</html>