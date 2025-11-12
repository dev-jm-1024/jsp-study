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

쿠키값이 "hong"인 쿠키 삭제하기
삭제 후 리다이렉트로 loginForm.jsp로 이동하기

--%>

<%
Cookie[] cookie = request.getCookies();


for(int i = 0; i<cookie.length; i++)
{
	String id = cookie[i].getValue();
	
	if(id.equals("hong"))
	{
		cookie[i].setMaxAge(0);
		response.addCookie(cookie[i]);
		response.sendRedirect("loginForm.jsp");
		
	}
}




%>
</body>
</html>