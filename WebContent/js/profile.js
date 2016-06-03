

$(function(){
  $('#editInfo').hide();
});


function form(a)
{
    if(a!=1)
    document.getElementById("editInfo").style.display="none";
    else
    document.getElementById("editInfo").style.display="block";
}

function form1(a)
{
    if(a!=1)
    document.getElementById("editAddress").style.display="none";
    else
    document.getElementById("editAddress").style.display="block";
}



function fncSubmit()
{

if(document.ChangePasswordForm.OldPassword.value == "")
{
alert('Please input old password');
document.ChangePasswordForm.OldPassword.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input Password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}






