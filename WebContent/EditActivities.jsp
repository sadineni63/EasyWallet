<%@page import="com.easywallet.ActivitiesPage.ActivityService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.easywallet.ActivitiesPage.RandomTransactionID" import= "java.io.*" import= "java.sql.*" import= "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%Object uid=session.getAttribute("UID");
//String uid="U5E14BB";
if(uid!=null)
{
%>


<% 
//ArrayList<String> merchants = new ArrayList<String>();
RandomTransactionID random = new RandomTransactionID();
	ActivityService activity = new ActivityService();
	String email=activity.getEmail(uid.toString());
	System.out.println("email in editActivities = " + email);
// 	String b_email="pavani@gmail.com";
// 	String c_email="indu@gmail.com";
	String status = "active";
	//String strt_id = "UID1234";
	String randomID = random.generateTransactionID();
	ResultSet set=null;
	//String uid="UID1234";
	String button = request.getParameter("button");
	boolean balance;
	if(button.equals("addmoney")){
		String cardName= request.getParameter("cards");
		String amountGiven = request.getParameter("amount");
		activity.addMoney(email,status,uid.toString(),randomID,amountGiven,cardName);
		response.sendRedirect("activity.jsp?addStatus=success");
	}
	
	if(button.equals("sendmoney")){
		String merchant= request.getParameter("merchants");
		String amount = request.getParameter("amount");
		System.out.println("merchants = " + merchant);
		System.out.println("amount = " + amount);
		System.out.println("status = " + status);
		System.out.println("email = " + email);
		System.out.println("randomId = " + randomID);
		balance= activity.hasSufficientBalance(uid.toString(),amount);
		if(balance){
			activity.sendMoney(merchant,uid.toString(),status,email,randomID,amount);
			response.sendRedirect("activity.jsp?sendStatus=success");
		}else{
			response.sendRedirect("activity.jsp?sendStatus=failed");
		}
	}
// 	if(button.equals("receivemoney")){
// 		String merchant= request.getParameter("merchants");
// 		String amountGiven = request.getParameter("amount");
// 		activity.receiveMoney(randomID,b_email,c_email,amountGiven,status);
// 		response.sendRedirect("activity.jsp?receiveStatus=success");
// 	}
	%>

	
</body>
</html>

<%}else{
	request.getRequestDispatcher("Login.jsp").include(request, response);
} %>
