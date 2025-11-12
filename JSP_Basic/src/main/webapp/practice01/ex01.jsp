<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--선언문으로 이름, 나이, 전화번호 변수 선언하기
스크립트릿으로 변수 초기화 하기
표현식으로 웹 브라우저에 변수 값 출력하기 --%>


<%-- 선언문으로 변수 선언 --%>
<%!
String name;
int age;
String number;
%>


<%-- 스크립트릿으로 변수 초기화 --%>
<%
name = "홍길동";
age = 20;
number = "010-1234-5678";
%>

<%-- 표현식으로 웹 브라우저에 변수 값 출력 --%>
이름: <%= name %><br>
나이: <%= age %><br>
전화번호: <%= number %><br>
</body>
</html>