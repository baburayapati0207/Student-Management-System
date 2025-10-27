<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Signup Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      padding: 20px;
    }

    form {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      max-width: 400px;
      margin: auto;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    fieldset {
      border: none;
    }

    legend {
      font-size: 1.5em;
      font-weight: bold;
      margin-bottom: 10px;
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
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    #button {
      background-color: #4CAF50;
      color: white;
      padding: 10px;
      margin-top: 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
    }

    #button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<% if(request.getAttribute("error")!= null){%>
	<%= request.getAttribute("error")%>
	<%}%>

	<form action="signup" method="post">
	  <fieldset>
	    <legend>SignUp</legend>
	
	    <label for="name">Name</label>
	    <input type="text" id="name" name="name" placeholder="Enter your name" required>
	
	    <label for="phone">Mobile Number</label>
	    <input type="tel" id="phone" name="phone" placeholder="Enter mobile number" required>
	
	    <label for="email">Email</label>
	    <input type="email" id="email" name="email" placeholder="Enter email" required>
	
	    <label for="branch">Branch</label>
	    <select name="branch" id="branch" required>
	      <option value="">Select Branch</option>
	      <option>Civil</option>
	      <option>Mechanical</option>
	      <option>CSE</option>
	      <option>ECE</option>
	      <option>MCA</option>
	      <option>MBA</option>
	      <option>MSC</option>
	      <option>MTech</option>
	      <option>MBBS</option>
	    </select>
	
	    <label for="location">Location</label>
	    <select name="location" id="location" required>
	      <option value="">Select Location</option>
	      <option>Anantapur</option>
	      <option>Bengalore</option>
	      <option>Chennai</option>
	      <option>Goa</option>
	      <option>Hyderabad</option>
	      <option>Tirupati</option>
	    </select>
	
	    <label for="password">Password</label>
	    <input type="password" id="password" name="password" placeholder="Enter Password" required>
	
	    <label for="confirm">Confirm Password</label>
	    <input type="password" id="confirm" name="confirm" placeholder="Confirm Password" required>
	
	    <input type="submit" name="Signup" id="button" value="Sign Up">
	  </fieldset>
	</form>

	<script>
	  document.querySelector("form").addEventListener("submit", function(e) {
	    const pwd = document.getElementById("password").value;
	    const confirm = document.getElementById("confirm").value;
	    if (pwd !== confirm) {
	      alert("Passwords do not match!");
	      e.preventDefault();
	    }
	  });
	</script>

</body>
</html>