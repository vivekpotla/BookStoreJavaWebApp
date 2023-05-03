package com.javaproject;
import java.sql.*;

public class DBConnect {
  private static Connection con;
  public static Connection getConn() {
	  try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vivek_db","root","");		  		  
	  } catch (Exception e) {
		  e.printStackTrace();
	}
	  return con;
  }  
}