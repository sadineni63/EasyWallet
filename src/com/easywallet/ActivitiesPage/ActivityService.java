package com.easywallet.ActivitiesPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.easywallet.ProfilePage.Connect_to_Database;

public class ActivityService {	
	ArrayList<String> list = new ArrayList<String>();
	ArrayList<String> merchants = new ArrayList<String>();
	//ArrayList<String> list2 = new ArrayList<String>();
	static ActivityService service = new ActivityService();
	static RandomTransactionID tranId = new RandomTransactionID();
	
	
	
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
	
	
	public String getEmail(String uid) throws SQLException{
		Statement statement = null;
		String email = "";
		Connection conn = new DatabaseConnection().getConnection("easywallet");
		statement  = conn.createStatement();
		ResultSet result = statement.executeQuery("select email from user where uid = '"+uid+"'");
		while(result.next()){
			email = result.getString(1);
		}
		return email;
		
	}
	
	
	
	public ArrayList<String> getCards(String uid) throws SQLException{
		Statement statement = null;
		Connection conn = new DatabaseConnection().getConnection("easywallet");
		statement  = conn.createStatement();
		ResultSet result = statement.executeQuery("select cardname from cards where uid = '"+uid+"'");
		while(result.next()){
			//System.out.println(result.getString(1));
			list.add(result.getString(1));
		}
		return list;		
	}
	
	public ArrayList<String> getMerchants(String uid) throws SQLException{
		Statement statement = null;
		Connection conn = new DatabaseConnection().getConnection("easywallet");
		statement  = conn.createStatement();
		ResultSet result = statement.executeQuery("select merchant from merchants where uid = '"+uid+"'");
		while(result.next()){
			merchants.add(result.getString(1));
		}
		System.out.println("merchants size = "+merchants.size());
		return merchants;		
	}
	
	
	
	public void addMoney(String email,String status, String strt_id, String tid, String amount, String source) throws SQLException{
		System.out.println("email = " + email);
		System.out.println("status = " + status);
		System.out.println("strt_id = "+ strt_id );
		System.out.println("tid = " + tid);
		System.out.println("amount = " + amount);
		System.out.println("source = " + source);
		Statement statement = null;
		String prevAmount=""; 
		int givenAmount = Integer.parseInt(amount);
		Connection conn = new DatabaseConnection().getConnection("easywallet");
		statement  = conn.createStatement();
		ResultSet rs = statement.executeQuery("select balance from accounts where uid='"+strt_id+"'");
		while(rs.next()){
			 prevAmount = rs.getString(1);
		}
		System.out.println("previousAmount = " + prevAmount);
		System.out.println("given amount = " + givenAmount);
		amount=Integer.parseInt(prevAmount)+givenAmount+"";
		System.out.println("amount = "+ amount);
		int result1 = statement.executeUpdate("update accounts set balance='"+amount+"' where uid='"+strt_id+"'");
		amount=givenAmount+"";
		System.out.println("Amount after insertion = " + amount);
		int result =0;
		String transactionStatus = "success";
		PreparedStatement statement1 = (PreparedStatement) conn.prepareStatement("insert into add_transactions values(?,?,NOW(),?,?,?,?)");
		statement1.setString(1, tid);
		statement1.setString(2, email);
		statement1.setString(3, amount);
		statement1.setString(4, transactionStatus);
		statement1.setString(5, source);
		statement1.setString(6, strt_id);
		result = statement1.executeUpdate();
	}
	public void sendMoney(String merchant,String uid,String status, String c_email, String tid, String amount){
		try{
			System.out.println("entered in send money");
			Statement statement = null;
			double prevAmount=0;
			System.out.println("given amount = " + amount);
			int givenAmount = Integer.parseInt(amount);
			Connection conn = new DatabaseConnection().getConnection("easywallet");
			statement  = conn.createStatement();
			System.out.println("email in activity service = " + c_email);
			ResultSet rs = statement.executeQuery("select balance from accounts where email='"+c_email+"'");
			//System.out.println("value = " + rs.getInt(0));
			while(rs.next()){
				 prevAmount = rs.getDouble("balance");
			}
			int discount = (givenAmount/100)*10;
			amount=prevAmount-givenAmount+discount+"";
			int result1 = statement.executeUpdate("update accounts set balance='"+amount+"' where email='"+c_email+"'");
			amount=givenAmount+"";
			ResultSet merchantBalanceResultSet = statement.executeQuery("select balance from merchants where uid='"+uid+"' and merchant='"+merchant+"'");
			merchantBalanceResultSet.next();
			int merchantBalance = merchantBalanceResultSet.getInt("balance")+Integer.parseInt(amount);
			System.out.println("merchant balance = " + merchantBalance);
			int updateMerchantBalance = statement.executeUpdate("update merchants set balance='"+merchantBalance+"' where uid='"+uid+"' and merchant='"+merchant+"'");
			System.out.println("updateMerchantBalance = " + updateMerchantBalance);
			
			System.out.println("discount="+discount);
			int result =0;
			System.out.println("merchant = " + merchant);
			System.out.println("uid = " + uid);
			PreparedStatement statement1 = (PreparedStatement) conn.prepareStatement("insert into send_transactions values(?,?,NOW(),?,?,?,?)");
			statement1.setString(1, tid);
			statement1.setString(2, uid);
			statement1.setString(3, merchant);
			statement1.setString(4, c_email);
			statement1.setString(5, amount);
			statement1.setString(6, status);
			result = statement1.executeUpdate();
			service.rewardTransaction(merchant,uid,discount,tid);
			//System.out.println("result = "+ result);
		}catch(Exception sql){
			sql.printStackTrace();
			System.out.println("exception in send money");
		}
	}
	
public boolean hasSufficientBalance(String uid,String amount) throws SQLException {
		int amount1=Integer.parseInt(amount);
		Statement statement;
		Connection connection=new DatabaseConnection().getConnection("easywallet");
		statement=connection.createStatement();
		ResultSet rs=statement.executeQuery("select balance from accounts where uid='"+uid+"'");
		
		rs.next();
		if(amount1<=rs.getInt(1))
		{
			connection.close();
			return true;
		}	
		else	
			return false;
		
	}

	public void rewardTransaction(String merchant,String uid, int discount, String send_tid) throws SQLException{
		try{
			Statement statement = null;
			Connection conn = new DatabaseConnection().getConnection("easywallet");
			statement  = conn.createStatement();
			int result =0;
			String reward_amount=discount+"";
			String tid = tranId.generateTransactionID();
			PreparedStatement statement1 = (PreparedStatement) conn.prepareStatement("insert into reward_transactions values(?,?,NOW(),?,?,?,?)");
			statement1.setString(1, tid);
			statement1.setString(2, uid);
			statement1.setString(3, merchant);
			statement1.setString(4, reward_amount);
			statement1.setString(5, "success");
			statement1.setString(6, send_tid);
			result=statement1.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			Statement statement = null;
			Connection conn = new DatabaseConnection().getConnection("easywallet");
			statement  = conn.createStatement();
			int result =0;
			String reward_amount=discount+"";
			String tid = tranId.generateTransactionID();
			PreparedStatement statement1 = (PreparedStatement) conn.prepareStatement("insert into reward_transactions values(?,?,NOW(),?,?,?,?)");
			statement1.setString(1, tid);
			statement1.setString(1, uid);
			statement1.setString(2, merchant);
			statement1.setString(3, reward_amount);
			statement1.setString(4, "failed");
			statement1.setString(5, send_tid);
			result=statement1.executeUpdate();

		}
	}
	


	
	public void receiveMoney(String tid,String b_email,String c_email,String amount,String status) throws SQLException{
		Statement statement = null;
		Connection conn = new DatabaseConnection().getConnection("easywallet");
		statement  = conn.createStatement();
		int result =0;
		PreparedStatement statement1 = (PreparedStatement) conn.prepareStatement("insert into request_transactions values(?,NOW(),?,?,?,?)");
		statement1.setString(1, tid);
		statement1.setString(2, b_email);
		statement1.setString(3, c_email);
		statement1.setString(4, amount);
		statement1.setString(5, status);
		result = statement1.executeUpdate();
	}
	
	
	public ResultSet getAddTransactions(String uid) throws SQLException {
		try{
			Statement statement;
			Connection connection=new DatabaseConnection().getConnection("easywallet");
			statement=connection.createStatement();
			System.out.println("uid in getAddTransactions = "+uid);
			ResultSet rs = statement.executeQuery("select * from add_transactions where strt_id='"+uid+"'");
//			rs.next();
//			System.out.println("tid = " + rs.getString("tid"));
//			System.out.println("size = " + rs.getFetchSize());
			return rs;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet getSendTransactions(String uid) throws SQLException {
		try{
			Statement statement;
			Connection connection=new DatabaseConnection().getConnection("easywallet");
			statement=connection.createStatement();
			System.out.println("uid in getSendTransactions = "+uid);
			ResultSet rs = statement.executeQuery("select * from send_transactions where uid='"+uid+"'");
//			rs.next();
//			System.out.println("tid = " + rs.getString("tid"));
//			System.out.println("size = " + rs.getFetchSize());
			return rs;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet getRewardTransactions(String uid) throws SQLException {
		try{
			Statement statement;
			Connection connection=new DatabaseConnection().getConnection("easywallet");
			statement=connection.createStatement();
			System.out.println("uid in getRewardTransactions = "+uid);
			ResultSet rs = statement.executeQuery("select * from reward_transactions where uid='"+uid+"'");
//			rs.next();
//			System.out.println("tid = " + rs.getString("tid"));
//			System.out.println("size = " + rs.getFetchSize());
			return rs;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	
	
	public static void main(String[] args) throws SQLException {
//		String uid = "UID1234";
//	page.getCards(uid);
//	page1.getMerchants(uid);
//		String merchant="merchant1";
//		String status = "active";
//		String c_email = "a@gmail.com";
//		String tid = "G5678";
//		String amount="20000";
	//page2.getMerchants(uid);
	//page.sendMoney(merchant, status, c_email, tid, amount);
	}

}
