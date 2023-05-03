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


@WebServlet("/signup")
public class UserSignUpServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName = req.getParameter("fullName");
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        String ContactNo = req.getParameter("ContactNo");
		System.out.println(fullName + email + password + ContactNo);
		Connection con = DBConnect.getConn();
		boolean flag= false;
			try {
				String sql = "select * from bookusers where email=? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) 
				{
					flag=true;
				}
			} catch (Exception ex) 
			{
				ex.printStackTrace();
			}

		HttpSession session = req.getSession();
		
		if(flag==true) 
		{
						
			session.setAttribute("msg", "User Already Exists");
			resp.sendRedirect("signup.jsp?msg=User Already Exists");			
		}
		else {
			
			try {
			
			PreparedStatement ps = con.prepareStatement("INSERT into bookusers(name,email,password,contact) VALUES(?,?,?,?)");
			ps.setString(1, fullName);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, ContactNo);
			ps.executeUpdate();
			con.close();
			}
			catch(Exception ex) {
				ex.printStackTrace();
				
			}

			session.setAttribute("email", email);
			session.setAttribute("name", fullName);
			resp.sendRedirect("signup.jsp?msg=valid");			
		}
	}
}
