package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Servlet08")
public class Servlet08 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//웹 어플리케이션마다 하나의 ServletContext 객체가 생성이된다
		//서블릿끼리 자원(데이터)을 공유하는데 사용된다
		ServletContext application = super.getServletContext();
		
		String name = application.getInitParameter("name");
		String age = application.getInitParameter("age");
		
		System.out.println("name: " + name + ", age: " + age);
	
	}
 
}
