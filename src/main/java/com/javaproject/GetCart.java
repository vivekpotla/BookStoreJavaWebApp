package com.javaproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GetCart {
	
	
	public List<Book> getAllBooks() {  		
  		List<Book> list = new ArrayList<Book>();
  		Book b=null;
  		Connection con = DBConnect.getConn();
	    try {        
		   String sql="select * from bookscart";
		   PreparedStatement ps = con.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   
		   while(rs.next()) {
			   
			b=new Book();
			b.id =rs.getString(1);
			b.name=rs.getString(2);
			b.author =rs.getString(3);
			b.cost=rs.getString(4);
			b.imgURL =rs.getString(5);		
			list.add(b);			
		   }		   
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
  	}

}
