
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!

String id, pw, name, age;
String []hobby;

%>

<%
request.setCharacterEncoding("UTF-8");

id = request.getParameter("id");
pw = request.getParameter("pw");
name = request.getParameter("name");
age = request.getParameter("age");
hobby = request.getParameterValues("hobby");
%>

<h2>회원가입 정보</h2>
아이디: <%= id%>
비밀번호: <%= pw%>
이름: <%= name%>
나이: <%= age%>
취미: <%= Arrays.toString(hobby)%>
</body>
</html>