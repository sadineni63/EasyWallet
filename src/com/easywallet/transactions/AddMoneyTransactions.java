package com.easywallet.transactions;

import java.sql.Date;

public class AddMoneyTransactions {
	private String tid;
	private String email;
	private Date date;
	private Integer amount;
	private String status;
	private String source;
	private String strt_id;
	
	public AddMoneyTransactions(){
		
	}

	public AddMoneyTransactions(String tid, String email, Date date,
			Integer amount, String status, String source, String strt_id) {
		super();
		this.tid = tid;
		this.email = email;
		this.date = date;
		this.amount = amount;
		this.status = status;
		this.source = source;
		this.strt_id = strt_id;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getStrt_id() {
		return strt_id;
	}

	public void setStrt_id(String strt_id) {
		this.strt_id = strt_id;
	}

}
