package com.tudent.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import com.StudentDAO.StudentDaoImp;
import com.StudentDTO.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUp extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = new Student();
		StudentDaoImp st = new StudentDaoImp();
		PrintWriter out = resp.getWriter();
//		String name = req.getParameter("name");
//		s.setName(name);
		// rather doing this in 2 lines we go for one line
		s.setName(req.getParameter("name"));
//		s.setPhone(req.getParameter("phone"));  this will throw an datatype error, 
//												to avoid that we go parse method
//		String phone = req.getParameter("phone");
//		long l = Long.parseLong(phone);
//		s.setPhone(l);						
		
//		rather than doing this much lengthy code we go for one line code
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setEmail(req.getParameter("email"));
		s.setBranch(req.getParameter("branch"));
		s.setLocation(req.getParameter("location"));
		String pass = req.getParameter("password");
		String confirm = req.getParameter("confirm");
		if(pass.equals(confirm)) {
			s.setPassword(pass);
//			boolean res = st.insertStudent(s);
			if(st.insertStudent(s)) {
//				out.println("Sign up successful..");
				req.setAttribute("success", "Signup successful, login to your account");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
			else {
//				out.println("Something went wrong..!!, Try Again!");
				req.setAttribute("error", "Data already exits.!!!");
				RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
		}
		else {
//			out.println("SignUp failed..!!, password mismatch");
			req.setAttribute("error", "Password Mismatch!!");
			RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
			
		}
	}
	
}
