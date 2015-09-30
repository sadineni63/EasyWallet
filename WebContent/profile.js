

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