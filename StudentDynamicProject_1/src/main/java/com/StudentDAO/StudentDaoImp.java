package com.StudentDAO;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.StudentDTO.Student;
import com.connector.Connectors;

public class StudentDaoImp implements StudentDAO{

	Connection con = null;
	public StudentDaoImp() {
		this.con = Connectors.getConnection();
	}
	@Override
	public boolean insertStudent(Student s) {
		
		int res = 0;
		String query = "INSERT INTO STUDENT VALUES(0,?,?,?,?,?,?,SYSDATE())";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6, s.getPassword());
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res > 0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	
	
	@Override
	public boolean updateStudent(Student s) {
	    String query = "UPDATE STUDENT SET PASSWORD=? WHERE SID=?";
	    int res = 0;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, s.getPassword());
	        ps.setInt(2, s.getId());
	        res = ps.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    if(res>0) {
	    	return true;
	    }
	    else {
	    	return false;
	    }
	}
	
	
	
	
	@Override
	public boolean deleteStudent(Student s) {
	    String query = "DELETE FROM STUDENT WHERE SID = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, s.getId());

	        int rowsDeleted = ps.executeUpdate();
	        if (rowsDeleted > 0) {
	            System.out.println("Deleted student with ID: " + s.getId());
	            return true;
	        } else {
	            System.out.println("No student found with ID: " + s.getId());
	        }
	    } catch (SQLException e) {
	        System.out.println("Error while deleting student:");
	        e.printStackTrace();
	    }
	    return false;
	}
	
	
	
	
	@Override
	public Student getStudent(String email, String password) {
		ResultSet rs = null;
		Student s = null;
		String query = "SELECT * FROM STUDENT WHERE EMAIL = ? AND PASSWORD = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2,password);
			rs = ps.executeQuery();
			while(rs.next()) {
				s = new Student();
				s.setId(rs.getInt("SID"));
				s.setName(rs.getString("Name"));
				s.setPhone(rs.getLong("Phone"));
				s.setEmail(rs.getString("EMail"));
				s.setBranch(rs.getString("Branch"));
				s.setLocation(rs.getString("Location"));
				s.setPassword(rs.getString("Password"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(s != null) {
			return s;
		}
		else {
			return null;
		}
	}
	
	
	
	
	@Override
	public ArrayList<Student> getAllStudents() {
		ArrayList<Student> li = new ArrayList<Student>();
		String query = "SELECT * FROM STUDENT";
		ResultSet rs = null;
		Student s = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			rs = ps.executeQuery();	
			while(rs.next()) {
				s = new Student();
				s.setId(rs.getInt("SID"));
				s.setName(rs.getString("NAME"));
				s.setPhone(rs.getLong("PHONE"));
				s.setEmail(rs.getString("EMAIL"));
				s.setBranch(rs.getString("BRANCH"));
				s.setLocation(rs.getString("LOCATION"));
//				s.setPassword(rs.getString("PASSWORD"));
				li.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}
	
	
	
	@Override
	public Student getStudent(long phone, String email) {
		
		Student s = null;
		String query = "SELECT * FROM STUDENT WHERE PHONE=? AND EMAIL=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1,phone);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Student();
				s.setId(rs.getInt("sid"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setEmail(rs.getString("email"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	
	
	
	@Override
	public boolean updateStudentDetails(Student s) {
		String query = "UPDATE STUDENT SET NAME=?, PHONE=?, EMAIL=?, BRANCH=?,LOCATION=? WHERE SID=?";
		int res = 0;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setInt(6, s.getId());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	

}
