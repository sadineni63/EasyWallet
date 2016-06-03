<%@page import="com.easywallet.ActivitiesPage.ActivityService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.easywallet.ActivitiesPage.DatabaseConnection"%>
<%@ page import="java.io.*" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="CSS/activity.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/activity.js"></script>
</head>
<body>

<%Object uid=session.getAttribute("UID");
//String uid="U5E14BB";
if(uid!=null)
{
%>


	<%
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> sendList = new ArrayList<String>();
		DatabaseConnection data = new DatabaseConnection();
		ActivityService activity = new ActivityService();
		data.getConnection("easywallet");
		int balance = activity.getBalance(uid.toString());
		ResultSet set = null;
		//String uid = "UID1234";
		list = activity.getCards(uid.toString());
		sendList = activity.getMerchants(uid.toString());
		//sendList = activity.getMerchants(uid);
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: midnightblue; font-size: 30px"
					href="introductionPage.jsp"><b>EasyWallet</b></a>
			</div>
			<!-- navbar header -->


			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a style="color: blue; font-size: 18px"
						href="profile.jsp">Profile</a></li>
					<li class="active"><a style="color: blue; font-size: 18px"
						href="#">Activities</a></li>
					<li><a style="color: blue; font-size: 18px" href="transactions.jsp">Transactions</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a style="color: blue; font-size: 120%" href="signOut.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
			<!-- collapse navbar-collapse -->
		</div>
		<!-- container -->
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="container-container-body">
					<h3>Your wallet details:</h3>
					<div class="form-inline"
						style="padding-top: 15px; padding-left: 10px; padding-right: 10px;">
						<label for="name">Wallet Balance:</label> <input type="text" value="<%=balance%>"
							style="padding-right: 0px; padding-left: 15px;"
							class="form-control" id="email" disabled="disabled">
					</div>
					<p>
						To see your latest transactions: <a href="transactions.jsp">click here</a>
					</p>
					<p>
						To see your transactions <a href="transactions.jsp">click here</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="container-container-add">
					<form action="EditActivities.jsp" method="post">
						<h3>Add Money:</h3>
						<p>Amount:</p>

						<input class="form-control"
							style="width: 100px; margin-left: 160px; margin-top: -40px;"
							id="ex1" name="amount" type="text">
						<p></p>
						<p>Select a card:</p>
						<div class="merchants">

							<select multiple class="form-control" name="cards" id="sel2">
								<%
									for (int i = 0; i < list.size(); i++) {
								%>
								<option><%=list.get(i)%></option>
								<%
									}
									String addStatus = request.getParameter("addStatus");
								%>
							</select>
							<%
								if (addStatus != null && addStatus.equals("success")) {
							%>
							<p style="color: green;">Amount is added to your account.</p>
							<input type="submit" style=" margin-top: 0%;"
								name="button" value="addmoney" class="btn btn-info"
								value="Submit">
							<%
								} else {
							%><input type="submit" style="margin-left: 0px;"
								name="button" value="addmoney" class="btn btn-info"
								value="Submit">
							<%
								}
							%>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="container-container-body3">
					<form action="EditActivities.jsp" method="post">
						<h3>Send Money:</h3>
						<p>Amount:</p>

						<input class="form-control"
							style="width: 100px; margin-left: 160px; margin-top: -40px;"
							id="ex1" name="amount" type="text">
						<p></p>
						<p>Select a merchant:</p>
						<div class="merchants">
							<select multiple class="form-control" name="merchants" id="sel2">
								<%
									for (int i = 0; i < sendList.size(); i++) {
								%>
								<option><%=sendList.get(i)%></option>
								<%
									}
									String sendStatus = request.getParameter("sendStatus");
								%>
							</select>
							<%
								if (sendStatus != null && sendStatus.equals("success")) {
							%>
							<p style="color: green;">Successfully sent.</p>
							<input type="submit" style="margin-left: 0px; margin-top: 0%;"
								name="button" value="sendmoney" class="btn btn-info"
								value="Submit">
							<%
								} else if (sendStatus != null && sendStatus.equals("failed")) {
							%>
							<p style="color: red;">Insufficient balance.</p>

							<input type="submit" style="margin-left: 0px; margin-top: 0%;"
								name="button" value="sendmoney" class="btn btn-info"
								value="Submit">
							<%
								} else {
							%><input type="submit" style="margin-left: 0px;"
								name="button" value="sendmoney" class="btn btn-info"
								value="Submit">
							<%
								}
							%>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron-jumbotron-footer">
			<footer class="mainFooter">
			<p>
				Copyright &copy; 2013 <a href="http://1stwebdesigner.com">1stwebdesigner</a>
			</p>
			</footer>
		</div>
	</div>
</head>
<body>

</body>
</html>


<%}
else{
	request.getRequestDispatcher("Login.jsp").include(request, response);
}


%>

