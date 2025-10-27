package com.tudent.dynamic;

import java.io.IOException;

import com.StudentDAO.*;
import com.StudentDTO.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/updateStudent")
public class UpdateDetails extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO st = new StudentDaoImp();
		HttpSession session = req.getSession(false);
		Student s = (Student)session.getAttribute("student");
		if(s != null) {
			s.setName(req.getParameter("name"));
			s.setPhone(Long.parseLong(req.getParameter("phone")));
			s.setEmail(req.getParameter("email"));
			s.setBranch(req.getParameter("branch"));
			s.setLocation(req.getParameter("location"));
			
			if(st.updateStudentDetails(s)) {
				req.setAttribute("success", "Details updated successfully");
				RequestDispatcher rd = req.getRequestDispatcher("DashBoard.jsp");
				rd.forward(req, resp);			
			}
			else {
				req.setAttribute("fails", "Failed to update details");
				RequestDispatcher rd = req.getRequestDispatcher("DashBoard.jsp");
				rd.forward(req, resp);
			}

		}
	}
}
