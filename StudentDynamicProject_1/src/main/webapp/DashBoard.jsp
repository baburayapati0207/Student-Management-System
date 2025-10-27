<%@ page import="com.StudentDTO.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  background-color: #f9f9f9;
}

.container {
  width: 100%;
  background: white;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0,0,0,0.2);
  padding-bottom: 20px;
}

.success-msg {
  background-color: #333;
  color: #22f007;
  text-align: left;
  padding:5px 10px;
  margin:0;
  font-size: 20px;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #444;
  color: white;
  padding: 10px 20px;
}

.welcome-text {
  font-size: 18px;
}

.nav-links {
  display: flex;
  align-items: center;
}

.nav-links a {
  color: white;
  text-decoration: none;
  margin-right: 20px;
  font-size: 15px;
}

.nav-links a:hover {
  text-decoration: underline;
}

.logout-btn {
  background-color: #e74c3c;
  color: white;
  border: none;
  padding: 6px 14px;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
}

.logout-btn:hover {
  background-color: #c0392b;
}

.user-heading {
  text-align: center;
  margin-top: 20px;
  color: #333;
}

.table-wrapper {
  overflow-x: auto;
  margin: 20px;
}

.user-table {
  width: 100%;
  border-collapse: collapse;
}

.user-table th,
.user-table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

.user-table th {
  background-color: #f2f2f2;
}

.user-table tr:nth-child(even) {
  background-color: #fafafa;
}

.welcomeName {
  color: hotpink;
  font-size: 25px;
}
</style>
</head>
<body>
<%
  Student s = (Student) session.getAttribute("student");
  if (s == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<% if (session.getAttribute("success") != null) { %>
  <h1><%= session.getAttribute("success") %></h1>
<% } %>

<div class="container">
  <h1 class="success-msg">Logged in successfully!!</h1>

  <div class="navbar">
    <div class="welcome-text">WelCome <span class="welcomeName"><%= s.getName() %></span></div>
    <div class="nav-links">
      <% if (s.getId() == 18 || s.getId() == 56) { %>
        <a href="studentList">View_users</a>
      <% } %>
      <a href="UpdateDetails.jsp">UpdateDetails</a>
      <a href="UpdatePassword.jsp">UpdatePassword</a>
      <form action="logout" method="get" style="display:inline;">
        <input type="submit" class="logout-btn" value="Logout">
      </form>
    </div>
  </div>

  <div class="table-wrapper">
    <table class="user-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Email</th>
          <th>Branch</th>
          <th>Location</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><%= s.getId() %></td>
          <td><%= s.getName() %></td>
          <td><%= s.getPhone() %></td>
          <td><%= s.getEmail() %></td>
          <td><%= s.getBranch() %></td>
          <td><%= s.getLocation() %></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>