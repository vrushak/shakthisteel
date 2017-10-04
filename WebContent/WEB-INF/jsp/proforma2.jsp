<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SHAKTHI STEEL INDUSTRIES</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='<c:url value="/resources/css/billgen.css" />' type='text/css' media='all' />
<link rel='stylesheet' href='<c:url value="/resources/css/print.css" />' type='text/css' media='print' />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

<script type="text/javascript">
	function checkhome(user){
		
		
		if(user.includes("dbfdesk")){
			 var url = "http://localhost:8085/HMS/frontdesk" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
		}
		else{
			 var url = "http://localhost:8085/HMS/home" ;
				
			 var element = document.getElementById('ho');
			 element.setAttribute("href",url)
		}
	}
	
function deleteRow(r) {
	 
   var i = r.parentNode.parentNode.rowIndex;
  
   document.getElementById("myTable").deleteRow(i);
  //   totalIt();
  disable();
    
}

function disp(){
	document.getElementById("disp").style.visibility = "hidden";
	document.getElementById("hiderow").style.display = "hidden";
	document.getElementById("refresh").style.display = "none";
	document.getElementById("gtot").style.display = "none";
	document.getElementById("gbill").style.display = "none";
	document.getElementById("inv").style.display = "block";
	document.getElementById("col-xs-5").style.display = "block";
	
	
	
	//document.getElementById("deleter").style.display = "none";
	window.print();
	document.getElementById("disp").style.visibility = "visible";
	document.getElementById("hiderow").style.display = "visible";
	document.getElementById("refresh").style.display = "block";
	document.getElementById("gtot").style.display = "block";
	document.getElementById("gbill").style.display = "block";
	document.getElementById("inv").style.display = "none";
	

}


	function check(str){
		var n = moment().format("DD-MM-YYYY");
		
	if (str == "" || str == null){
	    	
			
			
		var id = 1; 
		/*
				var str1 = "In-";
				var str2 = "SIND-"
			    var m = moment().format("DDMMYYYY-");
			   
		
				var res = str1.concat(str2);
		
				var res1 = res.concat(m);
				var res2 = res1.concat(id);

			*/
				document.getElementById("invoice").value = id;
				document.getElementById("invoicedate").value = n;

		
		
		
	    	
		}
		else {
	
			
			str = Number(str) + 1;
			/*
				var str1 = "In-";
				var str2 = "SIND-"
			    var m = moment().format("DDMMYYYY-");
			   
		
				var res = str1.concat(str2);
		
				var res1 = res.concat(m);
				var res2 = res1.concat(str);
	*/
			
				document.getElementById("invoice").value = str;
				document.getElementById("invoicedate").value = n;
				
			
		//	alert(res1);
		}
	}

	function addcname(){
		
		var cid = document.getElementById("pname1").value; 
		var str = cid.split(',');
		
		document.getElementById("pname").value=str[0];
		document.getElementById("pid").value=str[1];
		
		document.getElementById("pnameH").value=str[0];
		document.getElementById("pidH").value=str[1];
		
		document.getElementById("address").value=str[2];   
		document.getElementById("wardno").value=str[3];
		document.getElementById("doctor").value=str[5];
		 document.getElementById("formab").disabled = false;
	//	days_between(str[4],document.getElementById("disdate").value);
		GetFormattedDate(str[4]);
		
		calc(charge1,qty);
		totalIt();
	}
	
	var count;
	

	


	
		// from http://www.mediacollege.com/internet/javascript/number/round.html
	

		 
		 function call(val,qtya,ratea,amta){
			
			  alert(document.getElementById("products").options.namedItem(val).getAttribute('data-value'));
			 
		//	 var str = option.split(',');
			
			 alert(str[1]);
			 document.getElementById(qtya).value = str[1];
			 alert(str[2]);
			 document.getElementById(ratea).value = str[2]; 
			 document.getElementById(amta).value = str[3]; 
		 
		 }
	
	
		
		
		function addc() {
			
			 var qtya;
			 var ratea;
			 var amta;
			 
			count=0;
		//	var options = document.getElementById("select1").options;
		//	alert(option);
		//	for (var i=0; i < options.length; i++) {
			   
			//	if (options[i].selected) {
				//	count++;
			    
			//	}
		
		//	}
		
	
			var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
			var rowsAdd = tableRef.insertRow(tableRef.rows.length);
			
			
			
			
           // strSplit = option.split(',');
         
            
             qtya = Math.floor(Date.now() /1000);
			 ratea = Math.floor(Date.now() /100);
			 amta = Math.floor(Date.now() /10);
			
			
		 	//  alert(idx);
		     //qty = Math.random();
			
		 	   var newCell = rowsAdd.insertCell();
			 
			  newCell.innerHTML="<tr><td class='slno'><span class='killer' onclick='deleteRow(this)'>X</span><input style='width:50px;' form ='' class= 'form-control input-sm slno'  type='text' id = 'feetype' name= 'feetype' value='"+tableRef.rows.length+"' required></td></tr>";
			  newCell.style.width ='90px';
			
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td class='goods'><input  form ='billsave'   class= 'form-control input-sm goods'  id= 'goods' name='goods' list= 'products'  ><datalist id='products'><c:forEach var='p'  items='${model.list3}'><option  value='${p.discount}'>${p.discount}</option></c:forEach></datalist></td></tr>";
			   newCell.style.width ='300px';
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td class='quantity'><input form ='billsave'onkeypress='return event.charCode >= 48 && event.charCode <= 57 '  required class= 'form-control input-sm'  type='text'  id = '"+qtya+"' name= 'quantity' value='0' onblur = calc("+ratea+","+qtya+","+amta+") required  ></td></tr>";
			  newCell.style.width ='120px';
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input form ='billsave'  required  class= 'form-control input-sm'  type='text'  id = '"+ratea+"' name= 'rate' value='0' onblur = calc("+ratea+","+qtya+","+amta+")  required  ></td></tr>";
			  newCell.style.width ='120px';
			  
			  newCell = rowsAdd.insertCell();
			  newCell.innerHTML="<tr><td><input form ='billsave'  readonly='readonly' class= 'form-control input-sm'  type='text'  id = '"+amta+"' name= 'amount'  required  ></td></tr>";
			  newCell.style.width ='150px';
			  
			 
			  
			  
			 disable();
			  
			  
			  
		}

		function billhist(goods,quantity,rate,amount){
			
			document.getElementById("gbill").disabled = true;
			document.getElementById("subt").disabled = true;
			document.getElementById("cgst").disabled = true;
			document.getElementById("sgst").disabled = true;
			document.getElementById("gst").disabled = true;
			document.getElementById("gtotal").disabled = true;
		//	document.getElementById("addc").disabled = true;
			var strSplit = goods.split(',');
			 
			 var feetype = quantity.split(',');
			 var charges = rate.split(',');
			 var price = amount.split(',')
				
					for(var x=0; x<strSplit.length; x++) {
						

						var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
						var rowsAdd = tableRef.insertRow(tableRef.rows.length);
						
				 	  
				 
					  var newCell = rowsAdd.insertCell();
					  newCell.innerHTML="<tr><td class = ''><input  form ='' class= 'form-control input-sm' readonly type='text' id = 'feetype' name= 'feetype' value='"+tableRef.rows.length+"' required> </td></tr>";
					  newCell.style.width ='90px';
					
					  newCell = rowsAdd.insertCell();
					  newCell.innerHTML="<tr><td class = ''><input  form ='billsave'   class= 'form-control input-sm goods' readonly id= 'goods' name='goods' list= 'products'  value='"+strSplit[x]+"'><datalist id='products'><c:forEach var='p'  items='${model.list3}'><option  value='${p.discount}'>${p.discount}</option></c:forEach></datalist></td></tr>";
					  newCell.style.width ='300px';
					  
					  newCell = rowsAdd.insertCell();
					  newCell.innerHTML="<tr><td><input form ='billsave'  class= 'form-control input-sm'  type='text' readonly id = 'quantity' name= 'quantity' value='"+feetype[x]+"' required  ></td></tr>";
					  newCell.style.width ='120px';
					  
					  newCell = rowsAdd.insertCell();
					  newCell.innerHTML="<tr><td><input form ='billsave'  class= 'form-control input-sm'  type='text'  readonly id = 'rate' name= 'rate' value='"+charges[x]+"' required  ></td></tr>";
					  newCell.style.width ='120px';
					  
					  newCell = rowsAdd.insertCell();
					  newCell.innerHTML="<tr><td><input form ='billsave'  class= 'form-control input-sm'  type='text' readonly id = 'amount' name= 'amount' value='"+price[x]+"'  required  ></td></tr>";
					  newCell.style.width ='150px';
					  
					  
					}
				}
		

function clos(){
	window.location.reload();
}
		
		var diffDays;
		function days_between(datea, dateb) { 
			
			var toda;
				toda = new Date(datea.split('-')[2],datea.split('-')[1]-1,datea.split('-')[0]);
				var date2;
				date2 = new Date(dateb.split('-')[2],dateb.split('-')[1]-1,dateb.split('-')[0]);
				var timeDiff = Math.abs(toda.getTime() - date2.getTime());
				
				diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
				
				 
		
		}
var total;
		function totalIt() {
		    
			
			 
			   total=0;
			
			    var price = document.getElementsByName("amount");
			  
			    
				  for (var i=0;i<price.length;i++) {
				     
				   var sum =  price[i].value ;
				    
				    total += Number(sum) ;isNaN(sum)?0:sum;
				  }
				
				  document.getElementById("subt").value= total.toFixed(2);  //isNaN(total)?"0.00":total.toFixed(2);    
				
				
				  var cgst = 0.14 * (total);
				  var sgst = 0.14 * (total);
				  var csgst = Number(cgst) + Number(sgst);

				  document.getElementById("cgst").value = cgst.toFixed(2);

				  document.getElementById("sgst").value =  sgst.toFixed(2);
			 
				  document.getElementById("gst").value = csgst.toFixed(2);
				
				  var to = parseFloat(total.toFixed(2)) + parseFloat(csgst.toFixed(2));
				  document.getElementById("gtotal").value = to.toFixed(2);
				  
				  //  document.getElementById("total").value = total.toFixed(2);
				   
			  		
		}

		function calctax(){
			var tax = document.getElementById("tax").value;
			var discount = document.getElementById("discount").value;
			var taxp = tax/100;
		
			var disp = discount/100;
		
		var grand= Number(total) + taxp - discount;
		
		document.getElementById("total").value= grand.toFixed(2);
		}
		
function GetFormattedDate(date1) {
	var today = new Date(date1); 
	var dd = today.getDate(); 
	var mm = today.getMonth()+1; //January is 0! 
	var yyyy = today.getFullYear();
	if(dd<10){dd='0'+dd} 
	if(mm<10){mm='0'+mm} 
	var today = dd+'-'+mm+'-'+yyyy; 
	document.getElementById("admdate").value = today
	var yester = document.getElementById("disdate").value;
	days_between(yester,today);
	
			}
			
function copy(pid){
     
	if(pid == "new"){
		document.getElementById("disp").disabled = true;
		clos();
		
	}
	else{
		
		$("#myTable .tbody tr").remove();
		
		document.getElementById("disp").disabled = false;
   
	//var pid = document.getElementById("invoice1").value;
	var strSplit = pid.split(',');
 
	
   document.getElementById("invoice").value = strSplit[0];
   
   document.getElementById("invoicedate").value= strSplit[1];
   
   document.getElementById("pname").value = strSplit[2];
   
   
  
   document.getElementById("mobile").value =strSplit[3];
  
  
   document.getElementById("subt").value = strSplit[4];
   
   document.getElementById("gtotal").value=strSplit[5];
   
   document.getElementById("cgst").value=strSplit[6];
   document.getElementById("sgst").value=strSplit[7];
   document.getElementById("gst").value=strSplit[8];
   
   var string = pid.split('|');
 
 document.getElementById("address").value = string[1];
 
 
 // document.getElementById("address").value = strSplit[6];
 billhist(string[2],string[3],string[4],string[5]);
	
	
	}
}


var pricea;
function calc(rate,qty,amt) {
	

        
	  pricea =  parseFloat(document.getElementById(rate).value) * parseFloat(document.getElementById(qty).value);
	
	  
	  document.getElementById(amt).value= pricea.toFixed(2);//isNaN(price)?"0.00":price.toFixed(2);
	 
	  
	}
	
	function dispspan(){
	
		document.getElementById("inv").style.display = "none";
		document.getElementById("col-xs-5").style.display = "none";
		
	}
	
	
	function disable(){
		var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
		
	  if(tableRef.rows.length == 0){
			document.getElementById("gtot").disabled = true;
		  document.getElementById("gbill").disabled = true;
	  }
	  else{
		  document.getElementById("gtot").disabled = false;
		  document.getElementById("gbill").disabled = false;
	  }
		
	}
	</script>
	
	<script type="text/javascript">
	
	$(document).on('keydown', function(e) {
	    if(e.ctrlKey && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80) ){
	       // alert("Please use the Print PDF button above for a better rendering on the document");
	        disp();
	        e.cancelBubble = true;
	        e.preventDefault();

	        e.stopImmediatePropagation();
	    }  
	    if(e.ctrlKey && (e.key == "a" || e.charCode == 65 || e.charCode == 112 || e.keyCode == 80) ){
		        addc();
	        e.cancelBubble = true;
	        e.preventDefault();

	        e.stopImmediatePropagation();
	    }  
	    if(e.ctrlKey && (e.key == "r" || e.charCode == 82 || e.charCode == 112 || e.keyCode == 80) ){
	       clos();
	        e.cancelBubble = true;
	        e.preventDefault();

	        e.stopImmediatePropagation();
	    }  
	});
	
	
	
	
	</script>
	
 


</head>
<body onload="dispspan(),disable()">
  <div class="wrapper">
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Quotation</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="http://localhost:8085/shakthisteel/home">Home</a></li>
    </ul>
  </div>
</nav>
  <center>
</center>
	<div id="page-wrap">
        <h1>
	     <button type="button" class="btn btn-warning button1" id='refresh' onclick='location.href="http://localhost:8085/shakthisteel/proforma2"'>
	  <span class="fa fa-refresh fa-spin"></span> Refresh</button>
<font size="5">Quotation</font><span class="button2">
		<input type="button" id="disp" class="btn btn-warning button2" value="Print" onclick="disp()" style="width:150px"/></span>
		
		 </h1>
		
		<br>
		<form id="billsave" action ="proformasave2.html" method="post"></form>
		
 <div class ="container" >
		<div class="">
 
   <div class="col-xs-6">
           <figure>
       <img src="<c:url value='/Images/SHKTHILOG.jpg'/>"/>
       </figure>
       </div>
       
       <div class="col-xs-1"></div>
        <div class="col-xs-1" id="original"><font color="red"><strong class="strong"><select><option> Original</option><option>Duplicate</option><option>Triplicate</option></select></strong></font></div>
       
       </div>
       </div>
       <div id="logotext">
<span class="underline"><b>Mfrs & Dealers in </b>Quality Steel,Wooden & Aluminum Furnitures.</u></span>

<p>No 48/2,HMT Main Road, Malleshwaram, Bangalore-560003. M:9972573575, Tel :080-23471454</p>	</div>

     <span class="underline"></span>   
		
		
		<div id="">
   <p id="billed"> Billed To:</p>
           <table id="meta1">
           
     <tr>
     
                    <td style="" class="meta-head">Customer Name</td>
                    <td style=""><textarea id="pname" name="pname" form="billsave"  required></textarea></td>
                </tr>
                <tr>
                    <td style="" class="meta-head">Address</td>
                    <td style=""><textarea id="address" name="address"  form="billsave"></textarea></td>
                </tr>
                <tr>
                    <td style=""class="meta-head">Mobile No</td>
                    <td style=""><input type="text"  id="mobile" value="+91-" name="mobile"  maxlength="14" form="billsave" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                    </td>
                    
                </tr>
                
                
                

                

            </table>
		





            <table id="meta">
                <tr>
                    <td class="meta-head">Quotation #</td>
                    <td><select class="selectpicker form-control" id="invoice1" name="invoice1" data-size="4" data-live-search="true" onchange="copy(this.value); this.selectedindex = -1" >
                        <option value="new" selected>New</option>
                       
                         <c:forEach var="p"  items="${model.list4}">
                        
                    <option value='${p.invoice},${p.invoicedate},${p.pname},${p.mobile},${p.subtotal},${p.total},${p.cgst},${p.sgst},${p.gst},|${p.address}|${p.goods}|${p.quantity}|${p.rate}|${p.amount}'>${p.invoice}</option>
                    </c:forEach>
                           </select>
                    </td>
                </tr>
               
                <tr>

                    <td class="meta-head">Quotation Date</td>
                    <td><textarea id="invoicedate"  name="invoicedate" form="billsave" readonly></textarea></td>
                </tr>
                

            </table>
		
		
		 <input type="hidden" id="invoice" name="invoice" form="billsave">
		<table class="table table-striped table-bordered table-fixed table-hover table-condensed" style="width: 780px; " id="myTable">
    	<thead class="thead">
		
		  <tr>
		      <th style="width:100px;">Slno</th>
		      <th style="width:300px;">Description of Goods</th>
		      <th style="width:120px;">Quantity</th>
		      <th style="width:120px;">Rate</th>
		      <th style="width:150px;">Amount</th>
		      
		 
		</tr>
		</thead>
		<tbody class="tbody">
		  
		  <div id="background">
        <p id="bg-text"><span id='inv'>Proforma</span></p>
	    </div>
		      
		
		</tbody>
		  
		  
		  <tr id="hiderow">
		    <td><a id="addrow"  onclick="addc()" title="Add a row">Add Item</a></td>
		  </tr>
		  
		  
		
		</table>
		
		<br>
		  <button type="button" class="btn btn-warning button1" id='gtot' onclick='totalIt()'>
	  <span class="fa fa-refresh fa-spin"></span> Generate Total</button>
	  
		<table id="meta2">
                <tr>
                    
                    <td  colspan="" class="total-line meta-head">Subtotal</td>
		      <td style="width:10px" class="total-value"><div id="subtotal"><input readonly="readonly" type="text" style="width:100px" class="form-control input-sm" id="subt" value="0.00"  name="subtotal" form="billsave"></div></td>
                </tr>
                <tr>
                               
                     <td colspan="" class="total-line meta-head">CGST @ 14%</td>
		      <td class="total-value"><div id=""><input type="text" min =0 max="100" readonly="readonly" class="form-control input-sm" style="width:100px" onkeyup='calctax()' value="0.00" name="cgst" id="cgst" form="billsave"></div></td>
                </tr>
                <tr>
                    <td colspan="" class="total-line meta-head">SGST @ 14%</td>
		      <td class="total-value"><div id=""><input type="text" min =0 max="100" readonly="readonly" class="form-control input-sm" style="width:100px" onkeyup='calctax()' value="0.00" name="sgst" id="sgst" form="billsave"></div></td>
                </tr>
                <tr>
                    <td colspan="" class="total-line meta-head">Total GST</td>
		      <td class="total-value"><div id=""><input type="text" id="gst" readonly="readonly" name="gst" class="form-control input-sm" style="width:100px" onkeyup='calctax()' value="0.00" form="billsave"></div></td>
                </tr>
                <tr>
                    <td colspan="" class="total-line meta-head">Grand Total</td>

		      <td class="total-value balance"><input type="text"  readonly="readonly" id="gtotal" style="width:100px" name="total" value="0.00" class="form-control input-sm due" form="billsave"></td>
                </tr>
                
                  </table>
                  
                  <br>
                  <br>
		
	
	<div class="form-group row" >
       
       <div class="col-xs-1"></div>
       <div class="col-xs-5" id="col-xs-5">	
	
		
		  <h5>Terms</h5>
		  
		  <p>Pack Must be Properly checked before delivery.</p> 
		  <p>Goods once sold cannot be taken or exchanged all dispute subject to Bangalore.</p>
		 
		 <p>Jurisdiction Bill paid after 7days will bear intrest at 15percent Annum.</p>
		<p>No receipt valid except on our Official Form.</p>
		  
		    <h5>KSTNO. 94112071 CST No.94162074} Dt. 10-6-99</h5>
		<h6>GSTN : 29ABUPV1686J1ZJ</h6>
				</div>
		
		  <div class="col-xs-1"></div>
		 
		</div>
		
		<div class="form-group row" >
       
       <div class="col-xs-9"></div>
       <div class="col-xs-2">	
       Signature
       </div>
       </div>
	 <center><font color="orange"><b>FURNITURE AND INTERIORS UNDER ONE ROOF!!!</b></font></center>
	
	</div>
	
	
<button type="submit" id="gbill" class="bouton-contact" form ="billsave">Save Quotation</button>
</div>
   
     
</div>


<c:forEach var="p"  items="${model.list2}">
<script>

check('<c:out value="${p.invoice}" />');
</script>
</c:forEach>

<script>
document.querySelector('input[list]').addEventListener('input', function(e) {
    var input = e.target,
        list = input.getAttribute('list'),
        options = document.querySelectorAll('#' + list + ' option'),
       
        label = input.value;

   

    for(var i = 0; i < options.length; i++) {
        var option = options[i];

        if(option.innerText === label) {
           var hiddenInput= option.getAttribute('data-value');
            alert(hiddenInput);
            break;
        }
    }
});
</script>



 
</body>
<script>
document.querySelector('input[list]').addEventListener('input', function(e) {
    var input = e.target,
        list = input.getAttribute('list'),
        options = document.querySelectorAll('#' + list + ' option'),
       
        label = input.value;

   

    for(var i = 0; i < options.length; i++) {
        var option = options[i];

        if(option.innerText === label) {
           var hiddenInput= option.getAttribute('data-value');
            alert(hiddenInput);
            break;
        }
    }
});
</script>

	


</html>