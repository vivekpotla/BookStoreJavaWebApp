package com.javaproject;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("idvalue");
		System.out.println(id + "hi");
		Connection con = DBConnect.getConn();
		String name=null;
		String author=null;
		String cost=null;
		String imgURL=null;
		 
		 boolean alreadyexist = false;
		 
		 try {
		    String sql ="select * from bookscart where bookid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				alreadyexist =true;
			}
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		if(!alreadyexist) { 
				try {
					String sql ="select * from books where bookid=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) 
					{
						name=rs.getString(2);
						author=rs.getString(3);
						cost=rs.getString(4);
						imgURL=rs.getString(5);
					}
					sql = "INSERT INTO bookscart(`bookid`, `name`, `author`, `cost`, `imageURL`) VALUES (?,?,?,?,?)";
				    ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ps.setString(2, name);
					ps.setString(3, author);
					ps.setString(4, cost);
					ps.setString(5, imgURL);
					ps.executeUpdate();
		
					con.close();
					resp.sendRedirect("home.jsp?msg=done");
					
				}
				catch (Exception ex) 
				{
					ex.printStackTrace();
				}
		}
		else {
			
			resp.sendRedirect("home.jsp?msg=exist");
		}
		
		
			
	}

}
