package com.highradius.internship;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
public class orderDao3 {
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship","root","qwerty");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
	 public static List<order> getRecords(int start,int total){  
	        List<order> list=new ArrayList<order>();  
	        try{  
	            Connection con=getConnection();  
	            PreparedStatement ps=con.prepareStatement(  
	"select * from order_details where Order_Amount > 50000 limit "+(start-1)+","+total);  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                order e=new order();
	                e.setOrder_Date(rs.getString(8));
	                e.setApproved_By(rs.getString(6));
	                e.setOrder_Id(rs.getInt(1));
	                e.setCustomer_Name(rs.getString(2));
	                e.setCustomer_ID(rs.getInt(3));
	                e.setOrder_Amount(rs.getInt(4));
	                e.setApproval_Status(rs.getString(5));
	                e.setNotes(rs.getString(7));
	                list.add(e);  
	            }  
	            con.close();  
	        }catch(Exception e){System.out.println(e);}  
	        return list;  
	    }  

}
