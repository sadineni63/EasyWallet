<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Wallet</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">

 <script type="text/javascript">
 function echeck(str) {

    var at="@"
    var dot="."
    var lat=str.indexOf(at)
    var lstr=str.length
    var ldot=str.indexOf(dot)
    if (str.indexOf(at)==-1){
       alert("Invalid E-mail ID")
       return false
    }

    if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
       alert("Invalid E-mail ID")
       return false
    }

    if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
        alert("Invalid E-mail ID")
        return false
    }

     if (str.indexOf(at,(lat+1))!=-1){
        alert("Invalid E-mail ID")
        return false
     }

     if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
        alert("Invalid E-mail ID")
        return false
     }

     if (str.indexOf(dot,(lat+2))==-1){
        alert("Invalid E-mail ID")
        return false
     }
    
     if (str.indexOf(" ")!=-1){
        alert("Invalid E-mail ID")
        return false
     }

     return true          
  }

function ValidateForm(){
  var emailID=document.myForm.txtEmail
  
  if ((emailID.value==null)||(emailID.value=="")){
    alert("Please Enter your Email ID")
    emailID.focus()
    return false
  }
  if (echeck(emailID.value)==false){
    emailID.value=""
        emailID.focus()
    return false
  }
  return true
 }
</script>
<script type="text/javascript">

  function checkForm(form)
  {
    if(form.name.value == "") {
      alert("Error: Username cannot be blank!");
      form.name.focus();
      return false;
    }
    //re = ;
    if(!(/^\w+$/).test(form.name.value)) {
      alert("Error: Username must contain only letters, numbers and underscores!");
      form.name.focus();
      return false;
    }

    if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
      if(form.pwd1.value.length < 6) {
        alert("Error: Password must contain at least six characters!");
        form.pwd1.focus();
        return false;
      }
      else if(!(/[0-9]/).test(form.pwd1.value)) {
        alert("Error: password must contain at least one number (0-9)!");
        form.pwd1.focus();
        return false;
      }
      else if(!(/[a-z]/).test(form.pwd1.value)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        form.pwd1.focus();
        return false;
      }
      else if(!(/[A-Z]/).test(form.pwd1.value)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        form.pwd1.focus();
        return false;
      }
      /*else if(!form.pwd1.value.equals(form.pwd2.value)) {
        alert("Error: Passwords does not match!");
        form.pwd1.focus();
        form.pwd2.focus();
        return false;
      }*/
    } else {
      alert("Error: Passwords does not match!");
      form.pwd1.focus();
      return false;
    }

    return true;
  }

</script>



</head>
<body>
<div class="wrapper">
		<div class="banner">
				<div class="header">
			<div class="headerLeft"><img src="images/logo1.jpg" /></div>
			<div class="headerRight"><img src="images/Call.png"/></div>
		</div>		
		<div class="bimg">
			<img src="images/easy wallet.jpg">
		</div>	
			<div class ="xx">			
					<div class="container" style="padding:20px;">
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#login">Log In here</button>

  <!-- Modal -->
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body">
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
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#register">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
    </div>
  </div>
  </div>


					<div class="container">
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#register">Register Here</button>

  <!-- Modal -->
  <!-- Modal -->
  <div class="modal fade" id="register" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> SignUp</h4>
        </div>
        <div class="modal-body">
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
          
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#login">Login</a></p>
        </div>
      </div>
    </div>
  </div>
  
</div>
</div>
</div>								
			
</div>
</body>