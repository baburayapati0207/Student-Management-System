package com.tudent.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import com.StudentDTO.Student;
import com.StudentDAO.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = null;
		StudentDAO st = new StudentDaoImp();
		PrintWriter out = resp.getWriter();
		s = st.getStudent(Long.parseLong(req.getParameter("phone")), req.getParameter("email"));
		
		if(req.getParameter("password").equals(req.getParameter("confirm"))) {
			if(s.getPassword().equals(req.getParameter("password"))) {
//				out.print("Password already exists, try another one..");
				req.setAttribute("pswderror", "Password already exists, try another one..");
				RequestDispatcher rd = req.getRequestDispatcher("ForgotPassword.jsp"); 
				rd.forward(req, resp);
			}
			else {
				s.setPassword(req.getParameter("password"));
				if(st.updateStudent(s)) {
//					out.print("<h1>Password has been changed successfully</h1>");
					req.setAttribute("set", "Password has been changed successfully..");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				else {
//					out.print("<i>Something went wrong</i>");
					req.setAttribute("pswderror", "Something went wrong");
					RequestDispatcher rd = req.getRequestDispatcher("ForgotPassword.jsp"); 
					rd.forward(req, resp);
				}
			}
		}
		else {
//			out.print("<h2>Password Mismatched</h2>");
			req.setAttribute("pswderror", "Password Mismatched..!!! Kindly enter same password");
			RequestDispatcher rd = req.getRequestDispatcher("ForgotPassword.jsp"); 
			rd.forward(req, resp);
		}
	}

}
