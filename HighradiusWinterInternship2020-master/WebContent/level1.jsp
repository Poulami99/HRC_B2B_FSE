<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.highradius.internship.*" %>
<%@page import="com.highradius.internship.orderDao" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util. *" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $('#edit').click(function() {
      $('.popup-edit').toggle("slide");
    });
});
</script>
<script>
$(document).ready(function(){
    $('#add').click(function() {
      $('.popup-add').toggle("slide");
    });
});
</script>
<style>
* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}
/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

.outline
{
 width: 100%;
height : 85%;
  padding: 10px;
  border: 5px solid #D8D8D8;
  margin: 0;
}
</style>
<style>

.popup-edit {
  
  width: 50%;
  border: 5px solid #666666;
  padding: 30px;
  position:absolute;
  top:100px;
  left:150px;
  background-color: #ffffff;
 position: absolute;
}
.popup-edit input[type=text] {
  width: 50%;
  padding: 12px;
  border: 0;
  border-bottom: 1px solid #D8D8D8;
  outline:none;
  border-radius: 4px;
  resize: vertical;
}
.popup-edit .cedit{
position:absolute;
left:500px;
}
.popup-edit input[type=submit]{
  background-color: #FC7500;
  border: none;
  border-radius:10px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  font-family:Roboto;
  font-size:16px;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
<style>
.popup-add {
  
  width: 50%;
  border: 5px solid #666666;
  padding: 30px;
  position:absolute;
  top:100px;
  left:150px;
  background-color: #ffffff;
 position: absolute;
}
.popup-add input[type=text] {
  width: 50%;
  padding: 12px;
  border: 0;
  border-bottom: 1px solid #D8D8D8;
  outline:none;
  border-radius: 4px;
  resize: vertical;
}
.popup-add .cedit{
position:absolute;
left:500px;
}
.popup-add input[type=submit]{
  background-color: #FC7500;
  border: none;
  border-radius:10px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  font-family:Roboto;
  font-size:16px;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
<style>
.button {
  background-color: #FC7500;
  border: none;
  border-radius:10px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  font-family:Roboto;
  font-size:16px;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>
<section>
	<div class = "row">
	<div class="column"> 
		<img src="images/hrc-logo.svg" alt="highradius-logo" class="hrc-logo">
	</div>

	<div class="column"> 
		<img src="images/abc-logo.png" alt="ABCProducts" class="ABC-logo">
	</div>	
	</div>
	</section>
	<div class = "outline">
	<div class = "row">
<div class="topnav">

<input type="submit" class="button" id="add" value="ADD">

<input type="submit" class="button" id="edit" value="EDIT" disabled >
  <div class="search-container">
    <form action="" method="get">
      <input type="text" class="form-control" id="myInput" onkeyup="myFunction1()"  placeholder="Search.." />
    </form>
  </div>
</div>
<table class="content_table" id="myTable">
<thead>
<tr>
<th> </th>
<th>Order Date</th>
<th>Approved By</th>
<th>Order ID</th>
<th>Company Name</th>
<th>Company Id</th>
<th>Order Amount</th>
<th>Approval Status</th>
<th>Notes</th>
</tr>
</thead>
<%  
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=10;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}
List<order> list=orderDao.getRecords(pageid,total);
int i=1;
for(order e:list){
%>
<tr class='rowclass'>
<td><input type='checkbox' class='check' onclick='markRow(<%=i++%>)'/></td>
<td><%=e.getOrder_Date()%></td>
<td><%=e.getApproved_By() %></td>
<td><%=e.getOrder_ID() %></td>
<td><%=e.getCustomer_Name() %></td>
<td><%=e.getCustomer_ID() %></td>
<td><%=e.getOrder_Amount() %></td>
<td><%=e.getApproval_Status() %></td>
<td><%=e.getNotes() %></td>
</tr>
<%
}
%>
</table>
<br>
   <a href="level1.jsp?page=1"><button  style="background-color:#EFF9FD;">1</button></a>  
	<a href="level1.jsp?page=2"><button style="background-color:#EFF9FD;">2</button></a>  
	<a href="level1.jsp?page=3"><button style="background-color:#EFF9FD;">3</button></a> 
	<a href="level1.jsp?page=4"><button style="background-color:#EFF9FD;">4</button></a>
	<a href="level1.jsp?page=5"><button style="background-color:#EFF9FD;">5</button></a> 
	<p>Page No:<%=spageid%> of 5</p>
	</div>
</div>
<div class="popup-edit" style="display:none">
<div class="popup-content-edit">
<a href="level1.jsp?page=1">
<button class="cedit">X</button>
</a>
<h3 style="color:grey">EDIT ORDER</h3><br><br>
<form method="post" action="edit.jsp" style="font-size:15px ; color:grey; text-align:left;padding-left:100px">
<label>ORDER ID</label><input type="text" name="oid-edit" id='oid-edit' readonly><br><br>
<label>ORDER AMOUNT</label><input type="text" name="oamt-edit" id="oamt-edit" value="0" onchange=myFunction(this.value)><br><br>
<label>NOTES</label><input type="text" name="notes" id="notes" required><br><br>
<label>APPROVAL BY</label><input type="text" name="aby" id="aby" readonly><br><br>
<input type="hidden" name="aps" id="aps">
 <input type="submit"  value="SUBMIT" >
</form>
</div>
</div>
<div class="popup-add" style="display:none">
<div class="popup-content-add">
<a href="level1.jsp?page=1">
<button class="cedit">X</button>
</a>
<h3 style="color:grey">ADD ORDER</h3><br><br>
<form method="post" action="add.jsp" style="font-size:15px ; color:grey; text-align:left;padding-left:100px">
<label>ORDER ID</label><input type="text" name="oid" id='oid'><br><br>
<label>ORDER DATE</label><input type="text" name="odate" id='odate'><br><br>
<label>CUSTOMER NAME</label><input type="text" name="cname" id='cname'><br><br>
<label>CUSTOMER ID</label><input type="text" name="cid" id='cid'><br><br>
<label>ORDER AMOUNT</label><input type="text" name="oamt" id="oamt" value="0"><br><br>
<label>NOTES</label><input type="text" name="notes" id="notes" required><br><br>
 <input type="submit"  value="ADD" >
</form>
</div>
</div>
<script>
function myFunction1(){
var input, filter, found, table, tr, td, i, j;
input = document.getElementById("myInput");
filter = input.value.toUpperCase();
table = document.getElementById("myTable");
tr = table.getElementsByTagName("tr");
for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td");
    for (j = 0; j < td.length; j++) {
        if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
            found = true;
        }
    }
    if (found) {
        tr[i].style.display = "";
        found = false;
    } else {
        tr[i].style.display = "none";
    }
}
}
</script>
<script>
function markRow(rowNumber) {
var row = document.getElementsByClassName('rowclass');
var checkboxes = document.getElementsByClassName('check');

if(checkboxes[rowNumber-1].checked==false)
	  {
	  if((rowNumber-1)%2 != 0)
		  row[rowNumber-1].style= "background-color: transparent";
	  else
		  row[rowNumber-1].style= "background-color: #EFF9FD";
	  
	  document.getElementById("edit").disabled=true;
	  return;
	  }


//else clear eveything
for (var i = 0; i < row.length; i++) {
	  if(i%2!=0)
 row[i].style = "background-color: transparent";
	  else
	row[i].style = "background-color: #EFF9FD";  
   }

for(var i = 0; i < checkboxes.length; i++) {
	  checkboxes[i].checked=false;
	  }
 //check the checkbox and color the row
checkboxes[rowNumber-1].checked = true;
row[rowNumber-1].style = "background-color:#ffd17a";
document.getElementById("edit").disabled=false;
//script for autofilling orderid
document.getElementById('oid-edit').value = (row[rowNumber-1].getElementsByTagName('td')[3]).textContent;	

}
//to auto-populate approved by  getting the amount
function myFunction(val)
{
	   if(val<=10000)
		   {
		   document.getElementById('aby').value="David_Lee";
	       document.getElementById('aps').value="Approved";
		   }
	   else if(val<=50000)
		   {
		   document.getElementById('aby').value="Laura_Smith";
	       document.getElementById('aps').value="Awaiting Approval";
		   }
		  
	   else
		   {
		   document.getElementById('aby').value="Mathew_Vance";
	       document.getElementById('aps').value="Awaiting Approval";
		   }
}
</script>
</body>
</html>
    