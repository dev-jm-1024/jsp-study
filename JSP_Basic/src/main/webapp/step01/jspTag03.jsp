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
	표현식(expression): <%= %>
	jsp 페이지에서 사용되는 변수의 값 또는
	메소드 호출의 결과값을 출력하기 위해 사용
--%>


<%!
String id = "hong";
String pw = "1234";

public int multiply(int x, int y){return x*y;}
%>

아이디: <%= id %><br>
비밀번호: <%= pw %><br>
10 * 20 = <%= multiply(10, 20) %><br>
</body>
</html>