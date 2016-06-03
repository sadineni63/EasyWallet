package com.easywallet.users;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.easywallet.db.ConnectMySql;
import com.easywallet.transactions.AddMoneyTransaction;
import com.easywallet.transactions.RequestMoneyTransaction;
import com.easywallet.transactions.SendMoneyTransaction;

public abstract class Account {
	
	String uid;
	static final String BUSINESS_ACCOUNT="Business Account";
	static final String PERSONAL_ACCOUNT="Personal Account";
	static final String STUDENT_ACCOUNT="Student Account";
	int balance;
	String status;
	String activation_code;
	String email;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getActivation_code() {
		return activation_code;
	}
	public void setActivation_code(String activation_code) {
		this.activation_code = activation_code;
	}
	
	public abstract String getAccountType();
	
	
	
	
	
	public boolean isValidActivationCode(String email,String code) throws SQLException {
		
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select activation_code from accounts where email='"+email+"'");
		
		rs.next();
		if(code.equalsIgnoreCase(rs.getString(1)))
		{
			connection.close();
			return true;
		}	
		else	
			return false;
		
	}
	
	
	public ResultSet getAccountDetails(String type,String email) throws SQLException
	{
		
		System.out.println(type+"   "+email);
		ResultSet rs;
		if(!new User().isValidEmail(email,type))
		{
			return null;
		}
		else
		{
		
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(type.equalsIgnoreCase("Student Account"))
		{
			rs=statement.executeQuery("select user.uid,name,user.email,phone,dob,address,balance,status,accounts.email,activation_code from user,accounts where user.uid=accounts.uid and accounts.email='"+email+"'");
			return rs;
		}
		else
		{
		rs=statement.executeQuery("select user.uid,name,user.email,phone,dob,address,balance,status,accounts.email,activation_code from user,accounts where user.email='"+email+"' and accounts.email='"+email+"'");
		return rs;
		}
		}
	}
	
	
	
	
	
	public boolean activateAccount(String email) throws SQLException {
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(statement.executeUpdate("update accounts set status='Activated' where email='"+email+"'")==1)
		{
			connection.close();
			return true;
		}
		else
			return false;
	}
	
	
	public boolean suspendAccount(String email) throws SQLException {
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(statement.executeUpdate("update accounts set status='Suspended' where email='"+email+"'")==1)
		{
			connection.close();
			return true;
		}
		else
			return false;
		
		
		
	}
	
	
	
	public boolean hasSufficientBalance(String email,int amount) throws SQLException {
		
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select balance from accounts where email='"+email+"'");
		
		rs.next();
		if(amount<=rs.getInt(1))
		{
			connection.close();
			return true;
		}	
		else	
			return false;
		
	}
	
	
	public boolean creditAmount(String email,int amount,String source,String tid) throws SQLException
	{
		  
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(statement.executeUpdate("update accounts set balance=balance+"+amount+" where email='"+email+"'")==1)
		{
			if(new AddMoneyTransaction(email, amount,"success",source,tid).performAddTransaction())
				return true;
			else
			{
				connection.rollback();
				new AddMoneyTransaction(email, amount,"failed",source,tid).performAddTransaction();
				connection.close();
				return false;
			}
			
		}
		else
		{
			new AddMoneyTransaction(email, amount,"failed",source,tid).performAddTransaction();
			return false;
		}	
	}
	
	public boolean debitAmount(String email,String bemail,int amount) throws SQLException
	{
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(statement.executeUpdate("update accounts set balance=balance-"+amount+" where email='"+email+"'")==1)
		{
			if(new SendMoneyTransaction(email,bemail, amount,"success").performSendTransaction())
				
				return true;
			else
			{
				connection.rollback();
				new SendMoneyTransaction(email,bemail, amount,"failed").performSendTransaction();
				connection.close();
				return false;
			}
			
		}
		else
		{
			new SendMoneyTransaction(email,bemail, amount,"success").performSendTransaction();
			return false;
		}	
	}
	
	

	public boolean requestAmount(String email,String bemail,int amount) throws SQLException
	{
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		if(statement.executeUpdate("update accounts set balance=balance-"+amount+" where email='"+email+"'")==1)
		{
			if(new RequestMoneyTransaction(email,bemail, amount,"success").performRequestTransaction())
				
				return true;
			else
			{
				connection.rollback();
				new RequestMoneyTransaction(email,bemail, amount,"failed").performRequestTransaction();
				connection.close();
				return false;
			}
			
		}
		else
		{
			new RequestMoneyTransaction(email,bemail, amount,"success").performRequestTransaction();
			return false;
		}	
	}

}
