<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String number = request.getParameter("number");

BoardMethod bm =  new BoardMethod();

int result = bm.join(id, pw, name, number);

if(result == 1)
{
	%>
	<script>
		alert("회원가입에 성공하였습니다!");
	</script>
	<% 
	response.sendRedirect("loginForm.jsp");
}
else
{
	%>
	<script>
		alert("회원가입에 실패하였습니다.");
		history.back();
	</script>
	<%
	
}
%>
</body>
</html>