<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakthi Steel India</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
 <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<style type="text/css">

.wrapper {
	width : 1350px;
	background : #eee;
	height: 700px;
	font-family: 'Open Sans', 'Droid Sans';
}
#well{
	background : #009999;
	
}
.buttonimg{
    width:auto;
    height:auto;
}
.button2{
float : right;
}

.rightspace{
margin-right:30px;
margin-top: 2px;
}
.left{
margin-left:10px;
}


</style>
<script>
function myconfirm()
{
 var r = confirm("Do you want to Logout?");
 if(r== true)
 {
 window.location="http://localhost:8085/shakthisteel/logout";
 }
 else
 {
   return false;
 }
}
</script>
</head>
<body>
<div class= "wrapper">
<br>
<font color="#228B22" class="left" >Welcome : ${pageContext.request.userPrincipal.name}</font>  <i style="font-size:20px; align: right; color : #228B22" class="fa fa-cog" ></i> 
<i class='fa fa-sign-out button2 rightspace' style='font-size:20px;color : #228B22'  onclick="return myconfirm()"></i>
<div class="well well-lg" id="well"> <center><h4><font color="white">SHAKTHI STEEL INDIA</font></h4></center></div>

  
 <div class ="container" >
 <div class="row text-center">
 
   <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/invoice.png'/>"/><br><br>
      <figcaption><input type="button"onclick="location.href='http://localhost:8085/shakthisteel/billgen';" value="Tax Invoice1"></figcaption>
      </figure>
    </div>
    <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/invoice.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='http://localhost:8085/shakthisteel/billgen2';" value="Tax Invoice2"></figcaption>
      </figure>
    </div>
    
     <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/icon-quote.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='http://localhost:8085/shakthisteel/proforma';" value="Proforma1"></figcaption>
      </figure>
    </div>
  <div class="col-xs-2">
      <figure>
       <img src="<c:url value='/Images/icon-quote.png'/>"/><br><br>
      <figcaption><input type="button" onclick="location.href='http://localhost:8085/shakthisteel/proforma2';" value="Proforma2"></figcaption>
      </figure>
    </div>
    
 </div>
 <br>

 </div>
 <br>
 
</div>
</body>
</html>