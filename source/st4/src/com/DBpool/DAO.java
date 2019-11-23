package com.DBpool;
import java.sql.Connection;
import java.sql.DriverManager;
public class DAO{
	 public Connection getConn()throws Exception{
		 Connection conn;
		  Class.forName("com.mysql.jdbc.Driver");
		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/liuyan", "root", "123");
		  return conn;
	  }
}