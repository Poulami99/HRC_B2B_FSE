<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship","root","qwerty");
	 Statement st=con.createStatement();
	 int oid=Integer.parseInt(request.getParameter("oid"));
	 String odate=request.getParameter("odate");
	 String cname=request.getParameter("cname");
	 int cid=Integer.parseInt(request.getParameter("cid"));
	 int oamt=Integer.parseInt(request.getParameter("oamt"));
	 String notes=request.getParameter("notes");
	 String query="";
	 if(oamt < 10000)
	 {
	 query="insert into order_details values('"+oid+"','"+cname+"','"+cid+"','"+oamt+"','Approved','David Lee','"+notes+"','"+odate+"')";
	 }
	 else if(oamt > 10000 && oamt < 50000 )
	 {
	query="insert into order_details values('"+oid+"','"+cname+"','"+cid+"','"+oamt+"','Awaiting Approval',null,'"+notes+"','"+odate+"')"; 
	 }
	 else
	 {
  query="insert into order_details values('"+oid+"','"+cname+"','"+cid+"','"+oamt+"','Awaiting Approval', null ,'"+notes+"','"+odate+"')"; 
	 }
	 st.executeUpdate(query);
	 out.println("Data inserted Succesfully");
	 
 }
 catch(Exception e){
	 e.printStackTrace(); 
 }
 %>
</body>
</html>