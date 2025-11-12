<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
아이디와 비밀번호 데이터 받기
아이디가 sung 이고 비밀번호: 1111
session객체에 아이디값을 세션 값으로 저장하기 setAttribute("id", id)
아이디 비밀번호가 맞으면 main.jsp로 리다이렉트
틀리면 loginForm.jsp로 리다이렉트 하기
--%>



<%
request.setCharacterEncoding("UTF-8");


String id = request.getParameter("id");
String pw = request.getParameter("pw");

if(id.equals("sung") && pw.equals("1111"))
{
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}
else
{
	response.sendRedirect("loginForm.jsp");
}

%>
</body>
</html>