<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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

<div class="container " style="margin-top:6%">
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4">
          <form data-toggle="validator" role="form" name="myForm" method="post" action="reg.jsp" onsubmit="return checkForm(this)">
            <div class="form-group">
              <label for="name"><span class="glyphicon glyphicon-user"></span> Full Name:</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="Enter Full name" required>
            </div>
      
            <div class="form-group">
              <label for="email"><span class="glyphicon glyphicon-envelope"></span> Email:</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
              <label for="mobile"><span class="glyphicon glyphicon-phone"></span> Mobile:</label>
              <input type="number" class="form-control" name="mobile" id="mobile" pattern="[789][0-9]{9}" placeholder="Enter mobile number" required>
            </div>
      <div class="form-group">
              <label for="psw" ><span class="glyphicon glyphicon-eye-open"></span>Password:</label>
              <input type="password" class="form-control" name="pwd1" id="pwd1" placeholder="Enter password(contains atleast one 0-9/a-z/A-Z)" required>
            </div>
            <div class="form-group">
              <label for="rpsw"><span class="glyphicon glyphicon-eye-open"></span>Retype Password:</label>
              <input type="password" class="form-control" name="pwd2" id="pwd2" placeholder="Re-enter password" required>
            </div>
            <div class="form-group">
              <label for="address"><span class="glyphicon glyphicon-home"></span>Address:</label>
              <textarea rows="3" class="form-control" name="address" id="address" placeholder="Input your address" required></textarea>
            </div>
            <div class="form-group">
              
            <button type="submit" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> SignUp</button>
            </div>
            
            <div class="form-group">
              <label for="" style="color: red;">An account already exists with given email. Please choose another email.</label>
              
            </div>
          
          </form>
          </div>
          <div class="col-md-4"></div>
          </div>
        </div>
</body>
</html>