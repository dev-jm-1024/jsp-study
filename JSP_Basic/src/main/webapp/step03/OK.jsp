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
String age = request.getParameter("age");
%>

<h2>성인입니다.</h2>
<h2>입력한 나이: <%=age %></h2>
<hr>
<a href="responseForm.jsp">처음으로 이동</a>
</body>
</html>