<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Introduction Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<style>
body {background-color:deepskyblue}
h1   {color:white}
</style>
<body>
<%Object uid=session.getAttribute("UID");
if(uid==null)
{
	response.sendRedirect("Login.jsp");
}
%>
<li><a style="color: blue; font-size: 18px;margin-top=10%; margin-left:90%;" href="signOut.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
 
<h1 style = "font-size: 400%; margin-left:8%"> Welcome User! </h1>
<div class="container-fluid">
	<br>
	<br>
	<br>
	<table>
		<tr>
			<td style = "padding:40px">
  <p>
  	<a href="profile.jsp">
      <div>
  	<img src="images/profile.png" class="img-circle" alt="Cinque Terre" width="175" height="175"> 
    <p style ="font-size: 175%; margin-left:30%; color:white"> Profile </p>
  </div>
  	</a>
  </p>
  	</td>
  	<td style = "padding:40px">
  	<p>
  	<a href="activity.jsp">
      <div>
  		<img src="images/activities.jpg" class="img-circle" alt="Cinque Terre" width="175" height="175">
      <p style ="font-size: 175%; margin-left:20%; color:white"> Activities </p>
  </div>
  	</a>
  	</p>
  	</td>
  	<td style = "padding:40px">	
  	<p>
  	<a href="transactions.jsp">
      <div>
  		<img src="images/transactions1.jpg" class="img-circle" alt="Cinque Terre" width="175" height="175">
      <p style ="font-size: 175%; margin-left:10%; color:white"> Transactions </p>
  </div>
  	</a>
  	</p>
  	</td>
  	</tr>
	</table>
</div>
</body>
</html>