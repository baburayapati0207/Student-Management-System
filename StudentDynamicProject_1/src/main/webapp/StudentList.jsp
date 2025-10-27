<%@ page import="com.StudentDTO.Student" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users</title>
<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  background-color: #f9f9f9;
  width:97vw;
  height:100vh;
}
.container {
  width: 100%;
  background: white;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0,0,0,0.2);
  padding: 20px;
}
.user-heading {
  text-align: center;
  margin-top:0px;
  color: #06d117;
  
}
.table-wrapper {
  overflow-x: auto;
  margin-top: 20px;
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
.navbar {
  text-align: right;
  margin-bottom: 10px;
  padding-right:20px;
}
#bck{
background-color: #f56207;
color:#faf7f5;
padding:5px 20px;
border-radius:8px;
margin-right:6px;
}
#logt{
background-color: #f56207;
color:#faf7f5;
padding:5px 20px;
border-radius:8px;
}
#bck:hover{
background-color: #f74e05;
color:black;
}
#logt:hover{
background-color: #f74e05;
color:black;
}
.navbar a {
  text-decoration: none;
  margin-left: 10px;
  color: #007BFF;
}
#student:hover{
background-color: #edf553;
color:black;
cursor:pointer;
}
</style>
</head>
<body>
<%
  Student current = (Student) session.getAttribute("student");
  if (current == null) {
      response.sendRedirect("login.jsp");
      return;
  }
%>

<div class="container">
  <div class="navbar">
    <a href="DashBoard.jsp" class="btns" id="bck">Back</a>
    <a href="logout" class="btns" id="logt">Logout</a>
    <h2 class="user-heading">All Registered Members</h2>
  </div>

 

  <%
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
    if (studentList != null && !studentList.isEmpty()) {
  %>
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
          <% for (Student st : studentList) { %>
            <tr id="student">
              <td><%= st.getId() %></td>
              <td><%= st.getName() %></td>
              <td><%= st.getPhone() %></td>
              <td><%= st.getEmail() %></td>
              <td><%= st.getBranch() %></td>
              <td><%= st.getLocation() %></td>
            </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  <% } else { %>
    <p style="text-align:center;">No students found</p>
  <% } %>
</div>
</body>
</html>
