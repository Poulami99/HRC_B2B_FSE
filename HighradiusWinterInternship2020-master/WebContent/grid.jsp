<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.highradius.internship.*" %>
<%@page import="com.highradius.internship.order" %>
<%
String id = request.getParameter("Order_ID");
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/winter_internship";
String database = "winter_internship";
String dbUsername = "root";
String dbPassword = "qwerty";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>

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

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index2.css">
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
      <input type="text" class="form-control"  name="q" placeholder="Search.." />
    </form>
  </div>
</div>
<table class="content_table">
<thead>
<tr>
<th></th>
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
try{
connection = DriverManager.getConnection(url,dbUsername,dbPassword);
statement=connection.createStatement();
String query=request.getParameter("q");
String data;
if(query!=null)
{
	data="select * from order_details where Order_ID like '%"+query+"%'";
}
else
{
	data="select * from order_details ";
}
resultSet = statement.executeQuery(data);
int i=1;
while(resultSet.next())
{
%>
<tr class='rowclass'>
<td><input type='checkbox' class='check' onclick='markRow(<%=i++%>)'/></td>
<td><%=resultSet.getString("Order_Date") %></td>
<td><%=resultSet.getString("Approved_By") %></td>
<td><%=resultSet.getInt("Order_ID") %></td>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getInt("Customer_ID") %></td>
<td><%=resultSet.getInt("Order_Amount") %></td>
<td><%=resultSet.getString("Approval_Status") %></td>
<td><%=resultSet.getString("Notes") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</div>
<div class="popup-edit" style="display:none">
<div class="popup-content-edit">
<a href="grid.jsp">
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
<a href="grid.jsp">
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
	  
	  

	  for (var i = 0; i < row.length; i++) {
		  if(i%2!=0)
	    row[i].style = "background-color: transparent";
		  else
		row[i].style = "background-color: #EFF9FD";  
	      }
	  
	  for(var i = 0; i < checkboxes.length; i++) {
		  checkboxes[i].checked=false;
		  }
	  
	  checkboxes[rowNumber-1].checked = true;
	  row[rowNumber-1].style = "background-color:#ffd17a";
	  document.getElementById("edit").disabled=false;
	  document.getElementById('oid-edit').value = (row[rowNumber-1].getElementsByTagName('td')[3]).textContent;	
	  
}
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
