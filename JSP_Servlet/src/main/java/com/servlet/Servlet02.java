package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getPost")
public class Servlet02 extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("doGet메소드입니다");
		String id = request.getParameter("id"); //넘어오는 데이터의 이름을 지정
		String pw = request.getParameter("pw");
		
		System.out.println("id: "+id);
		System.out.println("pw: "+pw);
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("doPost메소드 입니다");
		
		String id = request.getParameter("id"); //넘어오는 데이터의 이름을 지정
		String pw = request.getParameter("pw");
		
		System.out.println("id: "+id);
		System.out.println("pw: "+pw);
	}

}
