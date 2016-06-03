package com.easywallet.transactions;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.easywallet.db.ConnectMySql;



public class AddMoneyTransaction extends Transaction {
	
	String email;
	int amount;
	String source;
	String stID;
	
	public AddMoneyTransaction() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	/**
	 * @param email
	 * @param amount
	 */
	public AddMoneyTransaction(String email, int amount,String status,String source,String stID) {
		super(status);
		this.email = email;
		this.amount = amount;
		this.source=source;
		this.stID=stID;
	}
	
	
	public boolean performAddTransaction() throws SQLException {
		
		PreparedStatement transactionStatement;
		Connection connection=new ConnectMySql().getConnection("paypal");
		transactionStatement=connection.prepareStatement("insert into add_transactions values(?,?,?,?,?,?,?)");
		transactionStatement.setString(1, getTransactionID());
		transactionStatement.setString(2, getEmail());
		transactionStatement.setString(3, getDate());
		transactionStatement.setInt(4, getAmount());
		transactionStatement.setString(5, getStatus());
		transactionStatement.setString(6, getSource());
		transactionStatement.setString(7, getStID());
		if(transactionStatement.executeUpdate()==1)
		{
			connection.close();
			return true;
		}
		
			return false;
	}

	public String getEmail() {
		return email;
	}

	public int getAmount() {
		return amount;
	}

	public String getSource() {
		return source;
	}

	public String getStID() {
		return stID;
	}
	
	public ResultSet getAddTransactions(String uid) throws SQLException {
		Statement statement;
		Connection connection=new ConnectMySql().getConnection("easywallet");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select * from add_transactions where email='"+uid+"'");
		return rs;
	}
//	public static void main(String[] args) throws SQLException {
//		AddMoneyTransaction t=new AddMoneyTransaction();
//		ResultSet r=t.getAddTransactions("lakshman.sadineni@gmail.com");
//		if(r.next())
//			System.out.println("Open");
//		else
//			System.out.println("Closed");
//		
//	}
	

}
