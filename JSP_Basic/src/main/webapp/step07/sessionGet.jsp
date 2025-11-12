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
<%
String sessionNameValue = (String)session.getAttribute("sessionName");
//getAttribute 메소드의 반환타입은 Object타입니다

out.print("sessionName값: " + sessionNameValue+"<br>");

int sessionNumberValue = (int)session.getAttribute("sessionNumber");
out.print("sessionNumber 값: " + sessionNumberValue+"<br>");

out.print("<hr>");

String sName, sValue;


Enumeration<String> e = session.getAttributeNames();

while(e.hasMoreElements())
{
	sName = e.nextElement();
	sValue = session.getAttribute(sName).toString();
	out.print("세션이름: " + sName+"<br>");
	out.print("세션 값: " + sValue+"<br>");
}

out.print("<hr>");

String sessionID = session.getId();
//한 브라우저당 고유한 아이디가 생성이 된다
//브라우저별로 생성되어진 세션 구분할 수 있다
out.print("세션 아이디: " + sessionID +"<br>");

int sessionInter = session.getMaxInactiveInterval();
//세션의 유효시간 (기본 30분)
out.print ("세션의 유효시간: " + sessionInter + "<br>");
out.print("<hr>");


session.removeAttribute("sessionName");
//세션 삭제: removeAttribute("세션이름");

e = session.getAttributeNames();

while(e.hasMoreElements())
{
	sName = e.nextElement();
	sValue = session.getAttribute(sName).toString();
	out.print("세션이름: " + sName+"<br>");
	out.print("세션 값: " + sValue+"<br>");
}

out.print("<hr>");
session.invalidate();
//세션 무효화
//세션의 모든 데이터를 삭제한다

if(request.isRequestedSessionIdValid())
{
	//유효한 세션이 있으면 true, 없으면 false
	out.print("유효한 세션이 없음");
}
else
{
	out.print("유효한 세션이 없음");
}
%>
</body>
</html>