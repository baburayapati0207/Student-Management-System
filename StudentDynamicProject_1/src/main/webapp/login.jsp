<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <style>
		.outer-div {
		  font-family: Arial, sans-serif;
		  background: #f4f4f4;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  height: 100vh;
		}
		
		.login-container {
		  background: #fff;
		  padding: 30px;
		  border-radius: 8px;
		  box-shadow: 0 0 10px rgba(0,0,0,0.1);
		  width: 300px;
		}
		
		.login-container h2 {
		  text-align: center;
		  margin-bottom: 20px;
		}
		
		.form-group {
		  margin-bottom: 15px;
		}
		
		.form-group label {
		  display: block;
		  margin-bottom: 5px;
		}
		
		.form-group input {
		  width: 100%;
		  padding: 8px;
		  box-sizing: border-box;
		}
		
		.forgot-password {
		  text-align: right;
		  margin-top: 5px;
		  font-size: 0.9em;
		}
		
		.forgot-password a {
		  color: #007BFF;
		  text-decoration: none;
		}
		
		.forgot-password a:hover {
		  text-decoration: underline;
		}
		
		button {
		  width: 100%;
		  padding: 10px;
		  background-color: #333;
		  color: #fff;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}
		
		.actions {
		  text-align: Center;
		  margin-top: 20px;
		  display : flex;
		  justify-content:Space-evenly;
		  align-items:center;
		}
		
		.actions a {
		  display: block;
		  margin: 5px 0;
		  text-decoration: none;
		  color: #007BFF;
		}
		.message {
		  text-align: center;
		  margin-bottom: 20px;
		  font-weight: bold;
		  padding: 10px;
		  border-radius: 5px;
		  width: 300px;
		}
		
		.success {
		  background-color: #d4edda;
		  color: #155724;
		  border: 1px solid #c3e6cb;
		}
		
		.error {
		  background-color: #f8d7da;
		  color: #721c24;
		  border: 1px solid #f5c6cb;
		}


		
  </style>
</head>
<body>
	<div class="msg-div">
		<% if(request.getAttribute("success") != null) { %>
		  <div class="message success"><%= request.getAttribute("success") %></div>
		<% } %>
		
		<% if(request.getAttribute("set") != null) { %>
		  <div class="message success"><%= request.getAttribute("set") %></div>
		<% } %>
		
		<% if(request.getAttribute("loginsuccess") != null) { %>
		  <div class="message success"><%= request.getAttribute("loginsuccess") %></div>
		<% } %>
		
		<% if(request.getAttribute("loginfail") != null) { %>
		  <div class="message error"><%= request.getAttribute("loginfail") %></div>
		<% } %>
	</div>


  		<div class="outer-div">
  			<div class="login-container">
			    <h2>Login</h2>
			    <form action="login" method="post">
			      <div class="form-group">
			        <label for="email">Email</label>
			        <input type="email" id="email" name="email" required />
			      </div>
			      <div class="form-group">
			        <label for="password">Password</label>
			        <input type="password" id="password" name="password" required />
			        <div class="forgot-password">
			          <a href="ForgotPassword.jsp">Forgot password?</a>
			        </div>
			      </div>
			      <button type="submit">Login</button>
			    </form>
			    <div class="actions">
			      <p class="btn">Don't have an account?</p>
			      <a href="signup.jsp" class="btn">Sign up</a>
			    </div>
			 </div>
  		</div>


</body>
</html>