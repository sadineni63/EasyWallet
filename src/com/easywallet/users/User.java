package com.easywallet.users;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.UUID;

import com.easywallet.db.ConnectMySql;

public class User {
	
	String uid;
	String name;
	String password;
	String email;
	long phone;
	String address;
	String dob;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String uid,String name, String email, long phone, String address, String dob,String password) {
		super();
		this.uid=uid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.dob = dob;
		this.password=password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getUid() {
		return uid;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public boolean isValidEmail(String email) throws SQLException {
		
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select * from accounts where email='"+email+"'");
		
		if(rs.next())
		{
			connection.close();
			return true;
		}	
		else
		{
			connection.close();
			return false;
		}
	}
	
public boolean isValidEmail(String email,String accountType) throws SQLException {
		
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select * from accounts where email='"+email+"' and type='"+accountType+"'");
		
		if(rs.next())
		{
			connection.close();
			return true;
		}	
		else
		{
			connection.close();
			return false;
		}
	}
	
	
	public boolean isAccountActivated(String email) throws SQLException
	{
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select status from accounts where email='"+email+"'");
		rs.next();
		if(rs.getString(1).equalsIgnoreCase("Activated"))
		{
			connection.close();
			return true;
		}

		else
		{
			connection.close();
			return false;
		}
		
	}

public static void main(String[] args) {
	RandomUserID u=new RandomUserID();
		
	}
}

