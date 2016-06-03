package com.easywallet.users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.easywallet.db.ConnectMySql;
import com.easywallet.security.BCrypt;

public class LoginService {
	
	public LoginService() {
		// TODO Auto-generated constructor stub
	}

	public boolean validateLogin(String email, String password) throws SQLException {
		// TODO Auto-generated constructor stub
		System.out.println("invalidate login");
		Statement statement;
		Connection connection = new ConnectMySql().getConnection("easywallet");
		
			statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from user where email='"
							+ email + "'");
			if (rs.next()) {
				if(BCrypt.checkpw(password,rs.getString("password"))) {
					return true;
				}
					
				else
					return false;
			}
			else
				return false;
	}	
	

}
