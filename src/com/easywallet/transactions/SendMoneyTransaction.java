package com.easywallet.transactions;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.easywallet.db.ConnectMySql;

public class SendMoneyTransaction extends Transaction {
	
	String email;
	String bemail;
	int amount;
	
	
	public SendMoneyTransaction() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * @param email
	 * @param amount
	 */
	public SendMoneyTransaction(String email,String beamil, int amount,String status) {
		super(status);
		this.email = email;
		this.bemail=beamil;
		this.amount = amount;
	}
	
	public boolean performSendTransaction() throws SQLException {
		
		PreparedStatement transactionStatement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		transactionStatement=connection.prepareStatement("insert into send_transactions values(?,?,?,?,?,?)");
		transactionStatement.setString(1, getTransactionID());
		transactionStatement.setString(2, getDate());
		transactionStatement.setString(3, getBemail());
		transactionStatement.setString(4, getEmail());
		transactionStatement.setInt(5, getAmount());
		transactionStatement.setString(6, getStatus());
		if(transactionStatement.executeUpdate()==1)
		{
			if(new AddMoneyTransaction(bemail, amount, "Success", email, getTransactionID()).performAddTransaction())
			{
			connection.close();
			return true;
		}
		}
		
			return false;
	}

	public String getEmail() {
		return email;
	}

	public int getAmount() {
		return amount;
	}

	public String getBemail() {
		return bemail;
	}
	
	

	public ResultSet getSendTransactions(String email) throws SQLException {
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select * from send_transactions where c_email='"+email+"'");
		return rs;
	}
	
}
