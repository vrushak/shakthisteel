<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--   <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SHAKTHI STEEL INDIA</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/billgen.css" />' type='text/css' media='all' />
<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

<style type="text/css">

.wrapper {
  height : auto;
  background: #eaeaea;  
  font-family: 'Open Sans', sans-serif;
}


#form1 h1 {
  font-size: 18px;
  background: #009999 none repeat scroll 0% 0%;
  color: rgb(255, 255, 255);
  padding: 22px 25px;
  border-radius: 5px 5px 0px 0px;
  margin: auto;
  text-shadow: none; 
  text-align:center;
}

#form1 {
  border-radius: 5px;
  max-width:700px;
  width:100%;
  margin: 5% auto;
  background-color: #FFFFFF;
  overflow: hidden;
}

p span {
  color: #F00;
}

p {
  margin: 0px;
  font-weight: 500;
  line-height: 2;
  color:#333;
}

h1 {
  text-align:center; 
  color: #666;
  text-shadow: 1px 1px 0px #FFF;
  margin:50px 0px 0px 0px
}


a {
  text-decoration:inherit
}

.bouton-contact{
  background-color: #81BDA4;
  color: #FFF;
  text-align: center;
  width: 100%;
  border:0;
  padding: 17px 25px;
  border-radius: 0px 0px 5px 5px;
  cursor: pointer;
  margin-top: 40px;
  font-size: 18px;
}

#col3{
border-style : groove;
border-radius : 10px;
}
</style>
</head>
<body>
<script type="text/javascript">
function convert(id,val){
	alert(val);
	 var m = moment(val).format("DD-MM-YYYY");
	 document.getElementById(id).value = m;
}

</script>
<div class = "wrapper">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Report Generation</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="ho" href="Home.jsp">Home</a></li>
    </ul>
  </div>
</nav>
  <center>
</center>
<form id="form1" action="pdf" method="get">  
  
<h1><font size="5">Report Generation</font></h1>
<br>
<div class="form-group row" >
	     <div class="col-xs-4"></div>
	      <div class="col-xs-5" id="col3">
  
	<div class="form-group">
            <p>From Date<span>*</span></p>
             <input type="date" name="fromdate1" id="fromdate1"  onchange="convert('fromdate',this.value)" class="form-control input-sm"  required>
               <input type="hidden" name="fromdate" id="fromdate"  form="form1" class="form-control input-sm"  required>
	       	</div>
	<div class="form-group">
            <p>To Date<span>*</span></p>
      <input type="date" name="endate1" id="endate1"  onchange="convert('endate',this.value)" class="form-control input-sm"  >
          <input type="hidden" name="endate" id="endate"  form="form1" class="form-control input-sm"  required>
	     
       <br>
       <input type="hidden" name="getdb" value="billgen">
       
    <!--    Export As Pdf : <input type ="checkbox" name="pdf" id="pdf"  onclick="disptab()" > 
      <span class="button2" >  Export As Excel: <input type ="checkbox" name="excel" id="excel" onclick="disptab1()"  > </span>
	 -->
	 </div>

    
	
	
	 <!--   <button type="button" class="btn btn-warning button1" onclick="display()">
	  <span class="glyphicon glyphicon-plus"></span>Add Row</button> 
	 -->
     
     
	 
	  
    <br> 
	  <br>

  </div>
  </div>



<input type="submit" class="bouton-contact" value="Generate Report">


</form>

</div>
</body>
</html>