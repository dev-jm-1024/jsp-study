package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member")
public class Servlet03 extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		//post방식의 요청 한글처리
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String []hobby = request.getParameterValues("hobby");
		String area = request.getParameter("area");
		
		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
		System.out.println("name: " + name);
		System.out.println("age: " + age);
		System.out.println("hobby: " + Arrays.toString(hobby));
		System.out.println("area: " + area);
		
		//response객체로 웹 브라우저에 넘어온 회원 정보 출력
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Member</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>아이디:"+id+" </h1>");
		out.println("<h1>비번:"+pw+" </h1>");
		out.println("<h1>이름:"+name+" </h1>");
		out.println("<h1>나이:"+age+" </h1>");
		out.println("<h1>취미:"+Arrays.toString(hobby)+" </h1>");
		out.println("<h1>지역:"+area+" </h1>");

		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

}
