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
어플리케이션 객체를 사용하여
웹 브라우저에 방문 시 방문자 수 출력하기
 --%>
 
<h2>웹 브라우저에 방문 시 방문자 수 출력하기</h2>

<%
int cnt = 0;

if(application.getAttribute("count") != null )
{
	cnt = (int)application.getAttribute("count");
}
cnt++;

application.setAttribute("count", cnt);
%>

<%= cnt %>
</body>
</html>