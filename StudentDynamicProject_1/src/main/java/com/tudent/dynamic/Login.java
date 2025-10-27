package com.tudent.dynamic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import com.StudentDTO.Student;
import com.StudentDAO.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = null;
		HttpSession session = req.getSession(true);
		StudentDAO st = new StudentDaoImp();
		PrintWriter out = resp.getWriter();
		s = st.getStudent(req.getParameter("email"), req.getParameter("password"));
		if(s != null) {
//			out.println("Login Successful..");
//			req.setAttribute("student", s);
			session.setAttribute("student", s);
			req.setAttribute("loginsuccess", "Login Successful..");
			RequestDispatcher rd = req.getRequestDispatcher("DashBoard.jsp");
			rd.forward(req, resp);
		}
		else {
//			out.print("Login Failed..!!!");
			req.setAttribute("loginfail", "Failed to login, try again");
			RequestDispatcher rs = req.getRequestDispatcher("login.jsp");
			rs.forward(req, resp);
		}
	}
	
}
