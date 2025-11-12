<%@page import="java.util.Enumeration"%>
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
getAttributeNames() 메소드로 세션 이름들의 목록을 Enumeration으로 얻은 후
세션 이름과 세션 값을 얻고, 세션 값이 sung과 같다며 ㄴ웹 브라우저에 성춘향님 안녕하세요 출력

 --%>
 
 <%
 
String sName, sValue;
Enumeration<String> e = session.getAttributeNames();

while(e.hasMoreElements())
{
	sName = e.nextElement();
	sValue = session.getAttribute(sName).toString();
	
	if(sValue.equals("sung"))
	{
		out.print("<h2>성춘향님 안녕하세요</h2>");
	}
}
 
 %>
 
 <a href="logout.jsp">로그아웃하기</a>
</body>
</html>