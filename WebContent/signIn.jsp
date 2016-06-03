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
		String email = request.getParameter("email");
	    String pwd = request.getParameter("pwd1");
		System.out.println("email = " + email);
		System.out.println("password = " + pwd);
		if (new LoginService().validateLogin(email,pwd)) {
			//User user = new User(name, pwd, email, phone, addrs);
			//new UserRegistration(user).registerUser();
		System.out.println("entered in login");
	     String uid= new User().getUserId(email);
	     session.setAttribute("UID",uid );
		response.sendRedirect("introductionPage.jsp");
	
		} else {
			System.out.println("entered in login else");
			response.sendRedirect("Login1.jsp");
		}
	%>

</body>
</html>