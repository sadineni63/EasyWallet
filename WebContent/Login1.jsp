<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Easy Wallet</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">
</head>
<body>
<%Object uid=session.getAttribute("UID");
if(uid!=null)
{
	response.sendRedirect("introductionPage.jsp");
}
%>
<div class="container " style="margin-top:6%">
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4">
<form role="form" method="post" action="signIn.jsp">
            <div class="form-group">
              <label for="email"><span class="glyphicon glyphicon-envelope"></span> Email Id</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="Enter password" required>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            <button type="submit" class="btn btn-info btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
            <div class="form-group">
              <label for="" style="color: red;">Wrong mail id/password.Sign in again.</label>
              
            </div>
</form>

</div>
<div class="col-md-4"></div>
</div>
</div>
</body>
</html>