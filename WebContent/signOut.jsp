<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.easywallet.users.LoginService"%>
<%@ page import="com.easywallet.users.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		//String email = request.getParameter("email");	
		//String uid= new User().getUserId(email);
	    session.removeAttribute("UID");
		response.sendRedirect("Login.jsp");
	
		
	%>

</body>
</html>