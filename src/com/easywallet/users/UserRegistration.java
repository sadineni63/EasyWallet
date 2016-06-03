package com.easywallet.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.easywallet.db.ConnectMySql;
import com.easywallet.security.BCrypt;

public class UserRegistration {
	private User user;
	
	public UserRegistration() {
		// TODO Auto-generated constructor stub
	}

	public UserRegistration(User user) {
		super();
		this.user = user;
	}
	
	public boolean isEmailExisted(String email) 
	{
		return new User().isValidEmail(email);
	}
	
	public boolean registerUser() throws SQLException{
		PreparedStatement transactionStatement;
		Connection connection=new ConnectMySql().getConnection("easywallet");
		transactionStatement=connection.prepareStatement("insert into user values(?,?,?,?,?,?)");
		transactionStatement.setString(1, user.getUid());
		transactionStatement.setString(2, user.getName());
		transactionStatement.setString(3, user.getEmail());
		transactionStatement.setLong(4, user.getPhone());
		transactionStatement.setString(5, user.getAddress()	);
		String password=BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		transactionStatement.setString(6, password);
		if(transactionStatement.executeUpdate()==1)
		{
			connection.close();
			if(createAccount())
				return true;
		}
		
			return false;
	}

	private boolean createAccount() throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement transactionStatement;
		Connection connection=new ConnectMySql().getConnection("easywallet");
		transactionStatement=connection.prepareStatement("insert into accounts values(?,?,?)");
		transactionStatement.setString(1, user.getUid());
		transactionStatement.setInt(2, 0);
		transactionStatement.setString(3, user.getEmail());
		if(transactionStatement.executeUpdate()==1)
		{
			connection.close();
				return true;
		}
		
			return false;
	}
	

}
