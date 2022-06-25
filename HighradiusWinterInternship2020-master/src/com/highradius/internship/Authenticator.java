package com.highradius.internship;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Authenticator {
	String sql="SELECT * FROM user_details WHERE username=? and password=?";
	String url="jdbc:mysql:// localhost:3306/winter_internship";
	 String dbUsername = "root"; 
     String dbPassword = "qwerty";
	
	public boolean check(String username,String password)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection(url, dbUsername,dbPassword); 
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

}
