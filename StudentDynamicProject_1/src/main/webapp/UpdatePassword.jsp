<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<style>
/* General body styling */
body {
  font-family: Arial, sans-serif;
  background-color: #f4f6f8;
  margin: 0;
  padding: 20px;
}

/* Center the form */
form {
  max-width: 400px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Form group spacing */
.form-group {
  margin-bottom: 20px;
}

/* Label styling */
label {
  display: block;
  margin-bottom: 8px;
  font-weight: bold;
  color: #333333;
}

/* Input styling */
input[type="email"],
input[type="tel"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #cccccc;
  border-radius: 4px;
  box-sizing: border-box;
}

/* Help text */
.form-text {
  font-size: 0.9em;
  color: #6c757d;
}

/* Submit button */
button[type="submit"] {
  background-color: #007bff;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1em;
  margin-left:300px;
}

/* Button hover effect */
button[type="submit"]:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>
  <div class="container">
    <form action="forgotpassword" method="post" class="form-box">
      <h2>Reset Password</h2>

      <div class="form-group">
        <label for="emailInput">Email address</label>
        <input type="email" name="email" class="form-control" id="emailInput" required>
      </div>

      <div class="form-group">
        <label for="phoneInput">Phone</label>
        <input type="tel" name="phone" class="form-control" id="phoneInput" required>
      </div>

      <div class="form-group">
        <label for="passwordInput">New Password</label>
        <input type="password" name="password" class="form-control" id="passwordInput" required>
      </div>

      <div class="form-group">
        <label for="confirmPasswordInput">Confirm Password</label>
        <input type="password" name="confirm" class="form-control" id="confirmPasswordInput" required>
      </div>

      <button type="submit" class="btn">Submit</button>
    </form>
  </div>
</body>
</html>