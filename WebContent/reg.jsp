<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.easywallet.users.User"%>
<%@ page import="com.easywallet.users.UserRegistration"%>
<%@ page import="com.easywallet.security.BCrypt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd1");
		String email = request.getParameter("email");
		long phone = Long.parseLong(request.getParameter("mobile"));
		String addrs = request.getParameter("address");
		if (!new UserRegistration().isEmailExisted(email)) {
			User user = new User(name, pwd, email, phone, addrs);
			new UserRegistration(user).registerUser();
			response.sendRedirect("introductionPage.jsp");
	
		} else {
			response.sendRedirect("Registration1.html");
		}
	%>

</body>
</html>