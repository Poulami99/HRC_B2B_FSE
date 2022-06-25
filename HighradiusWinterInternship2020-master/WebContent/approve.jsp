<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url="jdbc:mysql:// localhost:3306/winter_internship";%>
<%!String user = "root";%>
<%!String psw = "qwerty";%>
<%
int oid=Integer.parseInt(request.getParameter("oid"));
String aps=request.getParameter("aps");
String aby=request.getParameter("aby");
if(oid != 0)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql = "update order_details set  Approval_Status=?, Approved_By=? where Order_ID like '%"+oid+"%'";
ps = con.prepareStatement(sql);
ps.setString(1, aps);
ps.setString(2, aby);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Order Approved Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>