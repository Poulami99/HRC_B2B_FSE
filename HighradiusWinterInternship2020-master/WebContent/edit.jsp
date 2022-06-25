<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url="jdbc:mysql:// localhost:3306/winter_internship";%>
<%!String user = "root";%>
<%!String psw = "qwerty";%>
<%
int oid=Integer.parseInt(request.getParameter("oid-edit"));
int oamt=Integer.parseInt(request.getParameter("oamt-edit"));
String notes=request.getParameter("notes");
String aby=request.getParameter("aby");
String aps=request.getParameter("aps");
if(oid != 0)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql = "update order_details set Order_Amount=? , Notes=?, Approved_By=?,Approval_Status=? where Order_ID like '%"+oid+"%'";
ps = con.prepareStatement(sql);
ps.setInt(1, oamt);
ps.setString(2, notes);
ps.setString(3, aby);
ps.setString(4, aps);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
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