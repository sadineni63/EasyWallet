
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.io.*" import="java.util.*"%>
    <%@ page import="com.easywallet.ProfilePage.Details_of_Profile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/profile.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/profile.js"></script>

<title>Profile</title>
</head>
<body>

<%Object uid=session.getAttribute("UID");
if(uid!=null)
{
%>

<%
Hashtable<String,String> table = new Hashtable<String,String>();
ArrayList<String> merchants = new ArrayList<String>();
	Details_of_Profile prof = new Details_of_Profile();
	//System.out.println("uid = " + uid.toString());
	//String uid="U5E14BB";
	//String email = "lakshmi@gmail.com";
	int balance = prof.getBalance(uid.toString());
	table = prof.UserInfo(uid.toString());
	merchants = prof.merchantsInfo(uid.toString());
%>


	<!-- Main navigation bar -->

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
					<li class="active"><a style="color: blue; font-size: 18px"
						href="profile.jsp">Profile</a></li>
					<li><a style="color: blue; font-size: 18px"
						href="activity.jsp">Activities</a></li>
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
	<!-- navigation bar -->

	<!--End of main navigation bar -->


	<!-- Main jumbotron -->
	
	<div class="container">
	
		<div class="jumbotron">
		
			<table>
				<tr>
				
					<td><a href="#uploadImage"><img src="images/profile.png"
							class="img-circle img-responsive" data-toggle="modal"
							data-target="#uploadImage" width="155" height="155"></img></a></td>
					<td><h2 class="heading">Welcome</h2>
						<p class="comment" style="font-size: 250%;"><%= table.get("fullname") %></p></td>
						
				</tr>
				
			</table>
	
		</div>
		
		<!-- jumbotron  -->
		<!-- Modal -->
		<div class="modal fade" id="uploadImage" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 style="color: red;">
							<span class="glyphicon glyphicon-image"></span> Upload Image:
						</h4>
					</div>
					<div class="modal-body">




						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 200px; height: 150px;"></div>
							<div>
								<span class="btn btn-default btn-file"><input type="file"
									name="..."></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>





						<form role="form" method="post">
							<button type="submit"
								class="btn btn-default btn-success btn-block">
								<span class="glyphicon glyphicon-off"></span>Upload
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container  -->

	<!-- End of jumbotron -->


	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="container-container-walletBalance">
					<h3>Your wallet details:</h3>					
					<div class="form-inline"
						style="padding-top: 15px; padding-left: 10px; padding-right: 10px;">
						
						<label for="name">Wallet Balance:</label>
						 <input type="text" value="<%=balance%>"
							style="padding-right: 1%; padding-left:5%;"  class="form-control" id="balance"
							disabled="disabled">		
							
					</div>
					
					<p>
						Add money to your wallet <a href="activity.jsp">click here</a>
					</p>
					<p>
						To see your transactions <a href="transactions.jsp">click
							here</a>
					</p>
				</div>
				<!-- container-container-body -->


				<div class="container-container-addCard">
					<h3>Add a card to your wallet:</h3>
					<form class="form" action="EditProfile.jsp" method="post">
						<h4 style="color: blue">Card Details:</h4>
						<div class="form-group">
							<label for="name">Card Name</label> <input type="text" name="cardname"
								class="form-control" id="cardname" placeholder="Card Name"
								required>
						</div>
						<div class="form-group">
							<label for="number">Card Number</label> <input type="number" name="cardnumber"
								class="form-control" id="cardnumber" placeholder="Card Number"
								required>
						</div>

						<div class="form-group">
							<label for="password">Bank Name</label> <input type="text" name="bankname"
								class="form-control" id="pin" placeholder="Bank Name" required>
						</div>

						<button type="submit" style="color: blue;" name="button" value="cardDetails"
							class="btn btn-default">Submit</button>
					</form>
				</div>
				<!-- container-container-body1 -->
			</div>
			<!-- column -->



			<div class="col-sm-9">
				<div class="container-container-navigationBar">
					<nav class="navbar navbar-default">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target="#bodyNavbar">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="bodyNavbar">
								<ul class="nav nav-tabs">
									<li class="active"><a style="color: blue; font-size: 16px" name="infoTab"
										data-toggle="tab" href="#info">Personal-Info</a></li>
									<li><a style="color: blue; font-size: 16px" name="addressTab"
										data-toggle="tab" onclick="form1(0)" href="#address">Address</a></li>
									<li><a style="color: blue; font-size: 16px" name="passwordTab"
										data-toggle="tab" href="#password">Add Merchant</a></li>
									<li><a style="color: blue; font-size: 16px" name="merchantsTab"
										data-toggle="tab" href="#merchants">Merchants</a></li>
								</ul>
							</div>
							<!-- collapse navbar-collapse -->
						</div>
						<!-- container -->
					</nav>
				</div>
				<!-- container-container-navigationBar -->
				

				<div class="tab-content">
					<div id="info" class="tab-pane fade in active">
						<div class="container-container-info">
							<h3>Your Info:</h3>
							<a class="link pull-right" onclick="form(1)" href="#"><b>Edit
									your Info</b></a>
							<table>
								<tr>
									<td id="fullname"><p>
											<b>Username:</b>
										</p></td>
									<td id="email"><p>
											<b>Email:</b>
										</p></td>
									<td id="mobile"><p>
											<b>Mobile:</b>
										</p></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="fullname"
										 value="<%=table.get("fullname")%>" disabled="disabled"></td>
									<td><input type="text" class="form-control" id="email"
										 value="<%=table.get("email")%>" disabled="disabled"></td>
									<td><input type="text" class="form-control" id="mobile"
										 value="<%=table.get("mobile")%>" disabled="disabled"></td>
								</tr>
							</table>
						</div>
						<!-- container-container-info -->
						


						<div class="container-container-edit-info" id="editInfo">
							<a class="link pull-right" onclick="form(0)" href="#"><b>Cancel</b></a>
							<form data-toggle="validator" action="EditProfile.jsp" method="post" role="form">
								<h3>Update your details</h3>
								<div class="form-group">
									<label for="fullname">FullName:</label> <input type="text"
										class="form-control" name="fullname" id="fullname" placeholder="FullName"
										required>
								</div>
								<div class="form-group">
									<label for="email">Email:</label> <input type="email"
										class="form-control" name="email" id="email" placeholder="Email Id"
										required>
								</div>

								<div class="form-group">
									<label for="mobile">Mobile:</label> <input type="number"
										class="form-control" name="mobile" id="mobile" placeholder="mobile" required>
								</div>

								<button type="submit" id="updateInfo" style="color: blue;" name="button" value="infoUpdate"
									class="btn btn-default">Update</button>
							</form>
						</div>
						<!-- container-container-edit-info -->


					</div>
					<!-- tab-pane fade in active -->

					<div id="address" class="tab-pane fade">
						<div class="container-container-address">
							<h3>Your Adress:</h3>
							<a class="link pull-right" onclick="form1(1)" href="#"><b>Edit
									your address</b></a>
							<form class="form" method="post" "form">
								<div class="form-group">
									<label for="comment">Address:</label>
									<textarea class="form-control"
										style="height: 150px; width: 500px;" rows="5" id="addressarea"
										 disabled="disabled"> <%=table.get("address")%></textarea>
								</div>
							</form>
						</div>
						<!-- container-container-address -->

						<div class="container-container-edit-address" id="editAddress">
							<a class="link pull-right" onclick="form1(0)" href="#"><b>Cancel</b></a>
							<form data-toggle="validator" class="form" action="EditProfile.jsp" method="post" role="form">
								<h3>Update your address</h3>
								<label for="comment">Address:</label>
								<textarea class="form-control"
									style="height: 150px; width: 500px;" rows="5" id="addressarea" name="address"
									required></textarea>
								<p></p>
								<button type="submit" id="updateAddress" style="color: blue;" name="button" value="addressUpdate"
									class="btn btn-default">Update</button>
							</form>
						</div>
						<!-- container-container-edit-address -->
					</div>



					<div id="password" class="tab-pane fade">
						<div class="container-container-password">
							<div class="container-container-edit-password" id="editpassword">
								<form data-toggle="validator" action="EditProfile.jsp" method="post" class="form" onsubmit="return fncSubmit();" role="form">
									<h3>Add Merchant</h3>
									<div class="form-group">
										<label for="oldpassword">Merchant Name</label> <input
											type="text" class="form-control" name="merchantname"
											placeholder="name" required>
									</div>
									<div class="form-group">
										<label for="password">Merchant Email</label> <input
											type="email" class="form-control"
											placeholder="email" name="merchantemail" required>
									</div>

									<div class="form-group">
										<label for="password">Merchant Type</label> <input
											type="text" class="form-control"
											placeholder="type" name=merchantype>
									</div>

									<button type="submit" style="color: blue;" name="button" value="addMerchant"
										class="btn btn-default">Add</button>
								</form>
							</div>
						</div>
					</div>



					<div id="merchants" class="tab-pane fade">
						<div class="container-container-merchants">
					
							<h3>Merchants:</h3>
							<table style="width: 800px;">
								<tr>
								<%for(int i=0;i<merchants.size();i++){ %>
									<td><p><%= merchants.get(i)%></p></td>
									<td>
									<form action="EditProfile.jsp?merchant=<%=merchants.get(i)%>" method="post"><button type="submit" onclick="" style="float: right;" name="button" value="deleteMerchant"
											class="btn btn-md pull-right">Remove</button></form></td>
								</tr>
								<% }%>
							</table>
						
						</div>
					</div>



				</div>
				<!-- tab-content -->
			</div>
			<!-- column -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
	
	
		<%
		String infoStatus = request.getParameter("editInfo");
		String addressStatus = request.getParameter("editAddress");
		String merchantStatus = request.getParameter("deleteMerchant");
		String cardStatus = request.getParameter("Card");
		String addMerchantStatus = request.getParameter("addMerchant");
		System.out.println("status = " + addressStatus);
		if(addressStatus!=null && addressStatus.equals("success")){
			%>
			<script type="text/javascript">
			alert("Your address is updated");
			</script>
			<%
		}
		else
			if(merchantStatus!=null && merchantStatus.equals("success")){
				%>
				<script type="text/javascript">
				alert("Merchant Deleted");
				</script>
				<%
			}
			else
				if(infoStatus!=null && infoStatus.equals("success")){
					%>
					<script type="text/javascript">
					alert("Your personal info updated");
					</script>
					<%
				}
				else
					if(cardStatus!=null && cardStatus.equals("success")){
						%>
						<script type="text/javascript">
						alert("Card added to your cards");
						</script>
						<%
					}
					else
						if(addMerchantStatus!=null && addMerchantStatus.equals("fail")){
							%>
							<script type="text/javascript">
							alert("Please check your merchant details");
							</script>
							<%
						}
		
						else
							if(addMerchantStatus!=null && addMerchantStatus.equals("success")){
								%>
								<script type="text/javascript">
								alert("Succesfully added merchant");
								</script>
								<%
							}
	
	%>


	<div class="container">
		<div class="jumbotron-jumbotron-footer">
			<footer class="mainFooter">
				<p>
					Copyright &copy; 2013 <a href="http://1stwebdesigner.com">1stwebdesigner</a>
				</p>
			</footer>
		</div>
	</div>
</body>
</html>

<%}else{
	request.getRequestDispatcher("Login.jsp").include(request, response);
}
	%>