<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.io.*" import="java.util.*"%>
    <%@ page import="com.easywallet.ProfilePage.Details_of_Profile"%> <%@ page import="com.easywallet.ProfilePage.Connect_to_Database"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Object uid1=session.getAttribute("UID");
String uid = uid1.toString();
if(uid!=null)
{
%>

<%
//String uid="U5E14BB";
Details_of_Profile profile = new Details_of_Profile();
	Connect_to_Database connection = new Connect_to_Database();
	//connection.getConnection("easywallet");
	//ResultSet userDetails,userDetails1 =null; 
	//String email1 = "lakshmi@gmail.com";
	//String uid = "UID1234";
	String button = request.getParameter("button");
	System.out.println("button = " + button);
	
	
	if(button.equals("infoUpdate")){
	String name= request.getParameter("fullname");
	String email = request.getParameter("email");
	String phone = request.getParameter("mobile");
	profile.editInfo(name, email, phone,uid);
	response.sendRedirect("profile.jsp?editInfo=success");
	} 
	else
		if(button.equals("cardDetails")){
			String cardname= request.getParameter("cardname");
			String cardnumber = request.getParameter("cardnumber");
			String bankname = request.getParameter("bankname");
			profile.addCards(uid,cardname,cardnumber,bankname);
			response.sendRedirect("profile.jsp?Card=success");
			
		}
		else
			if(button.equals("addressUpdate")){
				String address= request.getParameter("address");
				profile.updateAddress(uid, address);
				response.sendRedirect("profile.jsp?editAddress=success");
			}
			else
				if(button.equals("deleteMerchant")){
					String merchant= request.getParameter("merchant");
					profile.deleteMerchant(merchant);
					response.sendRedirect("profile.jsp?deleteMerchant=success");
				}
				else
					if(button.equals("addMerchant")){
						String merchantName= request.getParameter("merchantname");
						String merchantEmail= request.getParameter("merchantemail");
						String merchantType= request.getParameter("merchanttype");
						//System.out.println("old password = " + password);
						profile.addMerchant(uid, merchantName,merchantEmail);
						response.sendRedirect("profile.jsp?addMerchant=success");
					}
%>
</body>
</html>
<%
} else{
	request.getRequestDispatcher("Login.jsp").include(request, response);
}
%>


