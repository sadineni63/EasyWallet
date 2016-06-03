package com.easywallet.transactions;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Transaction {
	
	String transactionID;
	Date date;
	String status;
	
	
	public Transaction() {
		// TODO Auto-generated constructor stub
	}
	
	public Transaction(String status) {
		// TODO Auto-generated constructor stub
		transactionID=new RandomTransactionID().generateTransactionID();
		date=new Date();
		this.status=status;
		
	}

	public String getTransactionID() {
		return transactionID;
	}

	public String getDate() {
		
		String d;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		d = sdf.format(date);
		return d;
	}

	public String getStatus() {
		return status;
	}
	
	
	

}
