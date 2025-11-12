package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/dan")
public class Servlet06 extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		//넘어온 데이터를 받아 해당하는 구구단을 웹 브라우저에 출력
		
		try
		{
			String str = request.getParameter("dan");
			if(str.equals("") || str.isEmpty() || str == null)
				throw new Exception();
			else
			{
				int dan = Integer.parseInt(str);
				
			      //웹 브라우저에 출력
			      response.setCharacterEncoding("UTF-8");
			      response.setContentType("text/html; charset=UTF-8");
			      
			      PrintWriter out = response.getWriter();
			      
			      out.println("<!DOCTYPE html>");
			      out.println("<html>");
			      out.println("<head>");
			      out.println("<title>Member</title>");
			      out.println("</head>");
			      out.println("<body>");

			      for(int i = 1; i <= 9; i++)
			         out.println("<h2>" + dan +"*"+ i + " = " + dan*i +"</h2>");

			      out.println("</body>");
			      out.println("</html>");
			      
			      out.close();
			}
		}catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println("넘어온 데이터가 올바르지 않습니다.");
			out.println("2단으로 출력하겠습니다.");
		}
		
		


	}




}
