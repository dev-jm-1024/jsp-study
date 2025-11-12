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
request 객체로 쿠키배열을 얻은 후 쿠키값이 "hong" 과 같으면 웹 브라우저에 홍길동님 안녕하세요 출력하기
 --%>
 
<%
Cookie [] cookies = request.getCookies();

for(int i = 0; i < cookies.length; i++)
{
	String id = cookies[i].getValue();
	if(id.equals("hong"))
		out.print("<h2>홍길동님 안녕하세요</h2>");
}

%>
<hr>
<a href="logout.jsp">로그아웃</a>
</form>
</body>
</html>