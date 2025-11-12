<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
폼에서 넘어온 데이터를 받아 정답이 홍길동이라면
OK.jsp로 리다이렉트 하기
아니라면 NG.jsp로 리다이렉트 하기
 --%>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 String answer = request.getParameter("answer");
 
 if(answer.equals("홍길동"))
 {
	 //문자열 보내려면 따로 인코딩 해야함
	 answer = URLEncoder.encode(answer, "UTF-8");
	 response.sendRedirect("OK.jsp?answer="+answer);
 }
 else
 {
	 answer = URLEncoder.encode(answer, "UTF-8");
	 response.sendRedirect("NG.jsp?answer="+answer);
 }
 
 %>
</body>
</html>