package com.servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/student2")
public class Servlet05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		
		Enumeration<String> e = request.getParameterNames();
		//넘어온 데이터의 이름의 목록을
		//Enumeration 타입으로 반환
		
		while(e.hasMoreElements())//hasMoreElements: 읽어올 요소가 있는 지 확인후, true / false 반환
		{
			String name = e.nextElement();//다음 요소를 읽어온다
			
			String [] values = request.getParameterValues(name);
			for(String value : values)
			{
				System.out.println("name: " + name + ", value: " + value);
			}
		}
	}

}
