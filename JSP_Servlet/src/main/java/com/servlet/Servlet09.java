package com.servlet;

import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/quiz")
public class Servlet09 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//넘어온 데이터를 받은 후 정답이 홍길동이라면 정답 출력
		//아니면 아니라고 출력
		request.setCharacterEncoding("UTF-8");
		String answer = request.getParameter("answer");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(answer.equals("홍길동"))
		{
			System.out.println("정답입니다.");
		}
		else
		{
			System.out.println("정답이 아닙니다.");
		}
	}

}
