package com.tudent.dynamic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		PrintWriter out = resp.getWriter();
		out.println("<h1>"+session.getAttribute("id")+"</h1>");
		out.println("<h1>"+session.getAttribute("name")+"</h1>");
		if(session != null) {
			out.print("Logout successfully");
			out.print("<a href=\"index.jsp\">Back</a>");
			session.invalidate();
			// which is used to destroy the session object
			resp.sendRedirect("login.jsp");
		}
		
		
	}
}
