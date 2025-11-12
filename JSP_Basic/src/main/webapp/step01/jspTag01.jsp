<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- Html 주석 -->
<!-- Html 주석은 웹 브라우저에 노출이 된다 -->

<%-- JSP 주석 --%>
<%-- JSP 주석은 웹 브라우저에 노출이 안된다. (보안성이 뛰어남) --%>

<%--
스크립트릿(scriptlet): <% %>
이 안에는 자바에서 사용하는 모든 것을 사용할 수 있는 자바의 영역이다
자바의 기능을 가지고 여러가지 작업을 할 수 있다
 --%>
 
 <%
for(int i = 1; i <= 10; i++)
{
	if(i%2==1)
	{
		out.print(i+"&nbsp;");
		//out:jsp 페이지에서 결과를 출력할 때 사용되는 출력스트림 내장 객체
	}
}
 %>
 
 <hr>
 <%
 for(int i = 0; i<5; i++)
 {
 %>
 <h3>Hello JSP!</h3>
 <%} %>
</body>
</html>