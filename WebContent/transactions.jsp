<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.io.*" import="java.util.*" 
    	import="com.easywallet.ActivitiesPage.DatabaseConnection"
    	import="com.easywallet.ActivitiesPage.ActivityService"
    	import="com.easywallet.transactions.AddMoneyTransactions"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/transactions.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css">

<script type="text/javascript" src="js/datatables.min.js"></script>
<script type="text/javascript" charset="utf-8">
	//$(document).ready(function() {
		//$('#example').DataTable();
	//});
</script>
<style type="text/css"></style>
<script type="text/javascript"
	src="chrome-extension://bfbmjmiodbnnpllbbbfblcplfjjepjdn/js/injected.js"></script>
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
	
</head>

</head>
<body>
<%
Object uid=session.getAttribute("UID");
String email = request.getParameter("email");
System.out.println("email = " + email);
	AddMoneyTransactions add = new AddMoneyTransactions();
	Statement statement = null;
	Connection conn = new DatabaseConnection().getConnection("easywallet");
	statement  = conn.createStatement();
	ResultSet addTransactions = new ActivityService().getAddTransactions(uid.toString());
	ResultSet sendTransactions = new ActivityService().getSendTransactions(uid.toString());
	ResultSet rewardTransactions = new ActivityService().getRewardTransactions(uid.toString());
	//System.out.println("tid = " + addTransactions.getString("tid"));
	//System.out.println("tid = " + addTransactions.getString("tid"));
	//ResultSet sendTransactions = statement.executeQuery("select balance from accounts where uid='"+"'");
	//ResultSet rewardTransactions = statement.executeQuery("select balance from accounts where uid='"+"'");
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
				href="#"><b>EasyWallet</b></a>
		</div>
		<!-- navbar header -->


		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a style="color: blue; font-size: 18px" href="profile.jsp">Profile</a></li>
				<li><a style="color: blue; font-size: 18px"
					href="activity.jsp">Activities</a></li>
				<li class="active"><a style="color: blue; font-size: 18px"
					href="transactions.jsp">Transactions</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: blue; font-size: 18px" href="#"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
		<!-- collapse navbar-collapse -->
	</div>
	<!-- container --> </nav>
	<!-- navigation bar -->

	<!--End of main navigation bar -->
	<div class="container">
		<br> <br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="panel with-nav-tabs panel-primary">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab2" data-toggle="tab">Add Transactions</a></li>
							<li><a href="#tab3" data-toggle="tab">Send Transactions</a></li>
							<li><a href="#tab4" data-toggle="tab">Reward
									Transactions</a></li>
							<!--                             <li class="dropdown"> -->
							<!--                                 <a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a> -->
							<!--                                 <ul class="dropdown-menu" role="menu"> -->
							<!--                                     <li><a href="#tab4primary" data-toggle="tab">Primary 4</a></li> -->
							<!--                                     <li><a href="#tab5primary" data-toggle="tab">Primary 5</a></li> -->
							<!--                                 </ul> -->
							<!--                             </li> -->
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
								<div id="example_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">
									<div class="row">
										<div class="col-sm-12">
											<table id="example"
												class="table table-striped table-bordered dataTable no-footer"
												cellspacing="0" width="100%" role="grid"
												aria-describedby="example_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															style="width: 100px;" aria-sort="ascending">Transaction
															Id</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 396px;">Transaction Type</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Date</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 154px;">Amount</th>
													</tr>
												</thead>
												<tbody>
													<tr role="row" class="odd">
													<% %>
														<td class="sorting_1">1</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">2</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="odd">
														<td class="sorting_1">3</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">4</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="odd">
														<td class="sorting_1">5</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">6</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="odd">
														<td class="sorting_1">7</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">8</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="odd">
														<td class="sorting_1">9</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
													<tr role="row" class="even">
														<td class="sorting_1">10</td>
														<td>Add</td>
														<td>15-08-2015</td>
														<td>$162,700</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="tab2">
								<div id="example_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">


									<div class="row">
										<div class="col-sm-12">
											<table id="example"
												class="table table-striped table-bordered dataTable no-footer"
												cellspacing="0" width="100%" role="grid"
												aria-describedby="example_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															style="width: 100px;" aria-sort="ascending">Transaction
															Id</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 396px;">Email</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Date</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 154px;">Amount</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 154px;">Status</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 154px;">Source</th>
													</tr>
												</thead>
												<tbody>
												<%while(addTransactions.next()){
														//add.setTid(addTransactions.getString("tid"));
														//add.setEmail(addTransactions.getString("email"));
														//add.setDate(addTransactions.getDate("date"));
														//add.setAmount(addTransactions.getInt("amount"));
														//add.setStatus(addTransactions.getString("status"));
														//add.setSource(addTransactions.getString("source"));
														//add.setStrt_id(addTransactions.getString("strt_id"));
														//System.out.println(add.getTid());
																								 %>
													<tr role="row" class="odd">
														<td class="sorting_1"><%=addTransactions.getString("tid")%></td>
														<td><%=addTransactions.getString("email")%>%></td>
														<td><%=addTransactions.getDate("date")%></td>
														<td><%=addTransactions.getInt("amount")%></td>
														<td><%=addTransactions.getString("status")%></td>
														<td><%=addTransactions.getString("source")%></td>
													</tr>
												<% } %>
									
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab3">
								<div id="example_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">


									<div class="row">
										<div class="col-sm-12">
											<table id="example"
												class="table table-striped table-bordered dataTable no-footer"
												cellspacing="0" width="100%" role="grid"
												aria-describedby="example_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															style="width: 100px;" aria-sort="ascending">Transaction
															Id</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 396px;">Merchant Name</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Date</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															style="width: 154px;">Amount</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Email</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Status</th>
													</tr>
												</thead>
												<tbody>
												<%while(sendTransactions.next()){ %>
													<tr role="row" class="odd">
														<td class="sorting_1"><%=sendTransactions.getString("tid") %></td>
														<td><%=sendTransactions.getString("merchant") %></td>
														<td><%=sendTransactions.getDate("date") %></td>
														<td><%=sendTransactions.getInt("amount") %></td>
														<td><%=sendTransactions.getString("c_email") %></td>
														<td><%=sendTransactions.getString("status") %></td>
													</tr>
													<%} %>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab4">
								<div id="example_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">


									<div class="row">
										<div class="col-sm-12">
											<table id="example"
												class="table table-striped table-bordered dataTable no-footer"
												cellspacing="0" width="100%" role="grid"
												aria-describedby="example_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															style="width: 20%" aria-sort="ascending">Transaction
															Id</th>
														<th class="sorting" tabindex="0" aria-controls="example"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 20%">Merchant Name</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 20%">Date</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															style="width: 20%">Reward Amount</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															style="width: 20%">Send Teansaction Id</th>
														<th class="sorting" tabindex="0" rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 195px;">Status</th>
													</tr>
												</thead>
												<tbody>
													<%while(rewardTransactions.next()){ %>
													<tr role="row" class="odd">
														<td class="sorting_1"><%=rewardTransactions.getString("tid") %></td>
														<td><%=rewardTransactions.getString("merchant") %></td>
														<td><%=rewardTransactions.getDate("date") %></td>
														<td><%=rewardTransactions.getInt("reward_amount") %></td>
														<td><%=rewardTransactions.getString("send_tid") %></td>
														<td><%=rewardTransactions.getString("status") %></td>
													</tr>
													<%} %>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript">
			// For demo to fit into DataTables site builder...
			$('#example').removeClass('display').addClass(
					'table table-striped table-bordered');
		</script>
</html>