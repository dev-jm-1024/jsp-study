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
Cookie[] cookies = request.getCookies();
//쿠키 객체들을 배열로 얻는다

for(int i = 0; i< cookies.length; i++)
{
	//getName(): 쿠키 이름을 얻는다
	//getValue(): 쿠키 값을 얻는다
	
	String str = cookies[i].getName();
	if(str.equals("cookieName"))
	{
		out.print("쿠키이름: " + cookies[i].getName() +"<br>");
		out.print("쿠키 값: " + cookies[i].getValue() +"<br>");
	}
}
%>

<hr>
<a href="cookieDelete.jsp">쿠키 삭제</a>
</body>
</html>