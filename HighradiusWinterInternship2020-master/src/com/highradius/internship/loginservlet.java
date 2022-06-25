package com.highradius.internship;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Authenticator authenticate=new Authenticator();
		
		if(authenticate.check(username,password))
		{
			if(username.equals("David_Lee")&& password.equals("Project@123"))
			{
			  HttpSession session=request.getSession();
			  session.setAttribute("username",username);
			  response.sendRedirect("level1.jsp?page=1");
			}
			else if(username.equals("Laura_Smith")&& password.equals("Project@1234"))
			{
			  HttpSession session=request.getSession();
			  session.setAttribute("username",username);
			  response.sendRedirect("level2.jsp?page=1");
			}
			else if(username.equals("Matthew_Vance")&& password.equals("Project@12345"))
			{
				HttpSession session=request.getSession();
				  session.setAttribute("username",username);
				  response.sendRedirect("level3.jsp?page=1");
			}
		}
		
		else
		{
			response.sendRedirect("index.html"); 
		}
		
	}

}
