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
//쿠키배열을 얻은 후 모든 쿠키의 이름과 값을 웹 브라우저에 출력하기

Cookie[] cookies = request.getCookies();

if(cookies != null)
{
	for(int i = 0; i < cookies.length; i++)
	{
		out.print("<h2>쿠키 이름: " + cookies[i].getName()+"</h2>");
		out.print("<h2>쿠키 값: " + cookies[i].getValue()+"</h2>");
		out.print("<hr>");
	}
}

%>
</body>
</html>