package com.javaproject;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/removefromcart")
public class RemoveFromCartServlet extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("idvalue");
		System.out.println("Deleting " + id);
		Connection con = DBConnect.getConn();
		try {
			String sql ="DELETE from bookscart where bookid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.execute();
			con.close();
			resp.sendRedirect("cart.jsp?msg=done");
			
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		
		
			
	}

}
