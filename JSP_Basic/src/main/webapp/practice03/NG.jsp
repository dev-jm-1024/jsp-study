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

String answer =  request.getParameter("answer");
%>
<h2> 정답이 아닙니다.</h2>
<h2>입력한 정답: <%= answer %></h2>
<a href="quizForm.jsp">메인으로 이동</a>
</body>
</html>