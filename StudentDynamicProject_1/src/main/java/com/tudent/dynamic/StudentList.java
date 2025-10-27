package com.tudent.dynamic;

import java.io.IOException;
import java.util.ArrayList;
import com.StudentDAO.StudentDAO;
import com.StudentDAO.StudentDaoImp;
import com.StudentDTO.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentList")
public class StudentList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        StudentDAO sd = new StudentDaoImp();
        ArrayList<Student> studentList = sd.getAllStudents();

        req.setAttribute("studentList", studentList);
        RequestDispatcher rd = req.getRequestDispatcher("StudentList.jsp");
        rd.forward(req, resp);
    }
}
