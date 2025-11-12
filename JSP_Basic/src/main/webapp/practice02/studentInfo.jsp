<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
선언문으로 넘어온 데이터를 받을 변수 선언
스크립트릿으로 넘어온 데이터를 받아 해당 변수에 저장
표현식으로 학생정보를 웹 브라우저에 출력
 --%>
 
 
 <%!
 String studentID, name, age, major;
 String []circle;
 %>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 studentID = request.getParameter("studentID");
 name = request.getParameter("name");
 age = request.getParameter("age");
 major = request.getParameter("major");
 circle = request.getParameterValues("circle");
 %>
 <h2>Student Info</h2>
 studentID: <%= studentID%><br>
 
 name: <%= name%><br>
 
 age: <%= age%><br>
 
 major: <%= major%><br>
 
 circle: <%= Arrays.toString(circle)%>
</body>
</html>