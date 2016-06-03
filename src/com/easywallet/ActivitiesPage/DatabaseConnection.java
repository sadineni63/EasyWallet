package com.easywallet.ActivitiesPage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	
	public Connection getConnection(String databaseName)
	{
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseName,"root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Driver could not be loaded: " + e);
		}
		return con;

	}
}
		
