package com.easywallet.transactions;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.easywallet.db.ConnectMySql;

public class RequestMoneyTransaction extends Transaction {

	String bemail;
	String cemail;
	int amount;
	
	
	public RequestMoneyTransaction() {
		// TODO Auto-generated constructor stub
	}
	public RequestMoneyTransaction(String email, String bemail, int amount,String status) {
		// TODO Auto-generated constructor stub
		super(status);
		this.bemail=bemail;
		this.cemail=email;
		this.amount=amount;
		
	}
	
	
public boolean performRequestTransaction() throws SQLException {
		
		PreparedStatement transactionStatement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		transactionStatement=connection.prepareStatement("insert into request_transactions values(?,?,?,?,?,?)");
		transactionStatement.setString(1, getTransactionID());
		transactionStatement.setString(2, getDate());
		transactionStatement.setString(3, getBemail());
		transactionStatement.setString(4, getCemail());
		transactionStatement.setInt(5, getAmount());
		transactionStatement.setString(6, getStatus());
		if(transactionStatement.executeUpdate()==1)
		{
			
		}
		
			return false;
	}

	public String getCemail() {
		return cemail;
	}

	public int getAmount() {
		return amount;
	}

	public String getBemail() {
		return bemail;
	}
	
	
	public ResultSet getRequestTransactions(String email) throws SQLException {
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select * from request_transactions where b_email='"+email+"'");
		return rs;
	}
	



}
