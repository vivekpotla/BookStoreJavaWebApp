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


@WebServlet("/addbook")
public class AddBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookid = req.getParameter("bookid");
		String name = req.getParameter("bookName");
        String author = req.getParameter("author");
        String cost = req.getParameter("cost");
        String imgURL = req.getParameter("imgURL");
		System.out.println(bookid +"\n"+ name +"\n"+ author +"\n"+ cost +"\n"+ imgURL);
		Connection con = DBConnect.getConn();
		boolean flag= false;
			try {
				String sql = "select * from books where bookid=? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,bookid);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) 
				{
					flag=true;
				}
			} catch (Exception ex) 
			{
				ex.printStackTrace();
			}		
		if(flag==true) 
		{
			resp.sendRedirect("addBook.jsp?msg=BookIDalreadyexists");			
		}
		else {
			
			try {
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO books(`bookid`, `name`, `author`, `cost`, `imageURL`) VALUES (?,?,?,?,?)");
			ps.setString(1, bookid);
			ps.setString(2, name);
			ps.setString(3, author);
			ps.setString(4, cost);
			ps.setString(5, imgURL);
			ps.executeUpdate();
			resp.sendRedirect("addBook.jsp?msg=done");	
			con.close();
			}
			catch(Exception ex) {
				ex.printStackTrace();
				
			}
	
		}
	}
}
