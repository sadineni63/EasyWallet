package com.easywallet.ProfilePage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.ServletException;


public class Details_of_Profile {
	
	static Details_of_Profile profile = new Details_of_Profile();
	Hashtable<String,String> table = new Hashtable<String,String>();
	ArrayList<String> merchants = new ArrayList<String>();
	Connection conn = new Connect_to_Database().getConnection("easywallet");
	
	
	public int getBalance(String uid) throws SQLException{
		System.out.println("entered into getbalance");
		ResultSet balance = null;
		Statement statement = null;
		int bal = 0;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		statement = conn.createStatement();
		balance = statement.executeQuery("select balance from accounts where uid='"+uid+"'");
		
		while(balance.next()){
			System.out.println(balance.getString(1));
			bal=balance.getInt(1);
		}
		conn.close();
		return bal;		
	}
	
	public void addCards(String uid, String cardname, String cardnumber, String bankname) throws SQLException{
//		ResultSet balance = null;
//		Statement statement = null;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		//statement = conn.createStatement();
		@SuppressWarnings("unused")
		int result=0;
		PreparedStatement statement1 =(PreparedStatement) conn.prepareStatement("insert into cards values(?,?,?,?)");
		statement1.setString(1, uid);
		statement1.setString(2, cardname);
		statement1.setString(3, cardnumber);
		statement1.setString(4, bankname);
		result = statement1.executeUpdate();
		conn.close();
	}
	
	
	public void updateAddress(String uid, String address) throws SQLException{
		@SuppressWarnings("unused")
		int result=0;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		PreparedStatement statement1 =(PreparedStatement) conn.prepareStatement("update user set address='"+address+"'where uid='"+uid+"'");
		result = statement1.executeUpdate();
		conn.close();
	}

	public Hashtable<String,String> UserInfo(String uid) throws SQLException{
		Statement statement = null;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		statement = conn.createStatement();
		ResultSet rs=statement.executeQuery("select * from user where uid='"+uid+"'");
		while(rs.next()){
		table.put("uid",rs.getString(1));
		table.put("fullname",rs.getString(2));
		table.put("email",rs.getString(3));
		table.put("mobile",rs.getString(4));
		table.put("address",rs.getString(5));
		
		//i = i+1;
		}
		conn.close();
		dummy();
		return table;
		
	}
	
	
	public ArrayList<String> merchantsInfo(String uid) throws SQLException{
		Statement statement = null;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		statement = conn.createStatement();
		ResultSet rs=statement.executeQuery("select merchant from merchants where uid='"+uid+"'");
		while(rs.next()){
			merchants.add(rs.getString(1));
		}
		//dummy();
		conn.close();
		return merchants;
		
	}
	
	
	public void editInfo(String name, String email, String phone, String uid) throws SQLException, ServletException, IOException{
		Statement statement = null;
		System.out.println("entered");
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		statement = conn.createStatement();
		@SuppressWarnings("unused")
		int result=statement.executeUpdate("update user set name='"+name+"', email='"+email+"', phone='"+phone+"' where uid='"+uid+"'");
		conn.close();
		
	}
	
	public void deleteMerchant(String merchant) throws SQLException{
		Statement statement = null;
		System.out.println("merchant = " + merchant);
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		statement = conn.createStatement();
		@SuppressWarnings("unused")
		int result=statement.executeUpdate("delete from merchants where merchant='"+merchant+"'");
		conn.close();
	}
	
	public void addMerchant(String tid,String merchant,String email) throws SQLException{
		@SuppressWarnings("unused")
		int result=0;
		int balance = 0;
		Connection conn = new Connect_to_Database().getConnection("easywallet");
		PreparedStatement statement1 =(PreparedStatement) conn.prepareStatement("insert into merchants values(?,?,?,?)");
		statement1.setString(1, tid);
		statement1.setString(2, merchant);
		statement1.setString(3, email);
		statement1.setInt(4, balance);
		result = statement1.executeUpdate();
	}
	
	
//	
//	
	public void dummy(){
		
		System.out.println("size = "+table.size());
		for(int i=0;i<table.size();i++){
		System.out.println("get = "+table.get(i));
	}
	}
////	
	public static void main(String[] args) throws SQLException, ServletException, IOException {
//		profile.merchantsInfo("nikhilreddy93@outlook.com");
//		String name="lakshmi";
//		String email="lakshmi@gmail.com";
//		String phone="9652146";
//		String uid = "UID1234";
		//profile.editInfo(name, email, phone, uid);
		//profile.getBalance(uid);
	}
	
	
	
	

}
