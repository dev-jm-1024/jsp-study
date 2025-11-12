package com.servlet;

import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/hello")
public class Servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 클래스01 입니다.");
		
		response.setCharacterEncoding("UTF-8");
		//UTF-8로 인코딩하여 웹 브라우저에게 전송한다.
		
		response.setContentType("text/html; charset=UTF-8");
		//웹 브라우저에게 명령한다고 보면된다
		//웹 브라우저에게 html 문서를 UTF-8로 해석하라는 뜻이다
		
		PrintWriter out = response.getWriter();
		//웹 브라우저에게 출력하기 위한 출력 스트림 얻기
		
//		out.print("");
//		out.println();
		//두 개의 차이점이 없다
		//웹 브라우저에서 줄 바꿈은 br태그라서 두 개의 차이점이 없다
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet start</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello Servlet</h1>");
		out.println("<h2>서블릿 시작합니다</h2>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
