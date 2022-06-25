<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.highradius.internship.*" %>
<%@page import="com.highradius.internship.orderDao3" %>
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
<link rel="stylesheet" href="css/grid1.css">
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
.button1 {
  background-color: #FC7500;
  border: none;
  border-radius:10px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  font-family:Roboto;
  font-size:16px;
  display: inline-block;
  margin: 17px 2px;
  margin-left:20px;
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
<form  class="app" method="post" action="approve.jsp">
<input type="submit" class="button" id="app_btn" value="APPROVED" disabled>
<input type="hidden" id="oid" name="oid">
<input type="hidden" id="aps" name="aps">
<input type="hidden" id="aby" name="aby">
</form>
<form class="rej" method="post" action="reject.jsp">
<input type="submit" class="button1" id="rej_btn" value="REJECTED" disabled>
<input type="hidden" id="oid1" name="oid1">
<input type="hidden" id="aps1" name="aps1">
<input type="hidden" id="aby1" name="aby1">
</form>
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
List<order> list=orderDao3.getRecords(pageid,total);
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
   <a href="level3.jsp?page=1"><button style="background-color:#EFF9FD;">1</button></a>  
	<a href="level3.jsp?page=2"><button style="background-color:#EFF9FD;">2</button></a>  
	<a href="level3.jsp?page=3"><button style="background-color:#EFF9FD;">3</button></a> 
	<a href="level3.jsp?page=4"><button style="background-color:#EFF9FD;">4</button></a>
	<a href="level3.jsp?page=5"><button style="background-color:#EFF9FD;">5</button></a>
	<p>Page No:<%=spageid%> of 5</p>
	</div>
</div>
<script>
function myFunction1() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
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
		  
		  document.getElementById("app_btn").disabled=true;
		  document.getElementById("rej_btn").disabled=true;
		  return;
		  }
	  
	  
      //else clear everything
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
	  document.getElementById("app_btn").disabled=false;
	  document.getElementById("rej_btn").disabled=false;
	//script for getting orderid for approve and reject button
	  document.getElementById('oid').value = (row[rowNumber-1].getElementsByTagName('td')[3]).textContent;
	  document.getElementById('oid1').value = (row[rowNumber-1].getElementsByTagName('td')[3]).textContent;
	  //to make approval status to approve or reject
	  if((row[rowNumber-1].getElementsByTagName('td')[7]).textContent == "Awaiting Approval")
	  {
	  document.getElementById("aps").value = "Approved";
	  document.getElementById("aby").value = "Matthew Vance";
	  document.getElementById("aps1").value = "Rejected";
	  document.getElementById("aby1").value = "Mtthew Vance";
	  }
  else if((row[rowNumber-1].getElementsByTagName('td')[7]).textContent == "Approved")
	  {
	  document.getElementById("aps").value = "Approved";
	  document.getElementById("aby").value = "Mathew Vance";
	  document.getElementById("aps1").value = "Rejected";
	  document.getElementById("aby1").value = "Mathew Vance";
	  alert("Already Approved");
	  }
  else
	  {
	  document.getElementById("aps").value = "Approved";
	  document.getElementById("aby").value = "Mathew Vance";
	  document.getElementById("aps1").value = "Rejected";
	  document.getElementById("aby1").value = "Mathew Vance";
	  alert("Already Rejected");
	  }
  }
    
</script>
</body>
</html>