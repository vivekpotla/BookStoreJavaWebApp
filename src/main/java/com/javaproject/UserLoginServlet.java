package com.javaproject;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName=null;
	    String email = null;
		String email_input = req.getParameter("email");
		String pass = req.getParameter("password");
		
		Connection con = DBConnect.getConn();
			try {
				String sql = "select * from bookusers where email=? and password=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email_input);
				ps.setString(2, pass);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) 
				{
					fullName=(rs.getString(1));
					email = (rs.getString(2));
				}
			} catch (Exception ex) 
			{
				ex.printStackTrace();
			}

		HttpSession session = req.getSession();
		
		if(fullName!=null) 
		{
			session.setAttribute("email", email);
			session.setAttribute("name", fullName);
			
			session.setAttribute("validMsg", "Successfully Login...");
			
			resp.sendRedirect("login.jsp");			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");			
		}
	}
}
