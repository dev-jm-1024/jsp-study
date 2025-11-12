package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/student")
public class Servlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		//1. request 객체를 사용하여 넘어온 학생 데이터를 받아 해당 변수에 저장하기
		//2. reponse 객체를 사용하여 학생정보를 웹 브라우저에 출력하기
		
		//1
		String studentID = request.getParameter("studentID");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String major = request.getParameter("major");
		String []circle = request.getParameterValues("circle");
		
		System.out.println("id: "+ studentID);
		System.out.println("naeme: "+ name);
		System.out.println("age: " + age);
		System.out.println("major: " + major);
		System.out.println("circle: " + Arrays.toString(circle));
		
		//2.
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Member</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>아이디:"+studentID+" </h1>");
		out.println("<h1>이름:"+name+" </h1>");
		out.println("<h1>나이:"+age+" </h1>");
		out.println("<h1>전공:"+major+" </h1>");
		out.println("<h1>동아리:"+Arrays.toString(circle)+" </h1>");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
