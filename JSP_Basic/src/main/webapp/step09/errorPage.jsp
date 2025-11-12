<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page isErrorPage="true" %>
    <%-- 현재 페이지는 에러 페이지라는 것을 알림 --%>
    
    
    <%
    	response.setStatus(200);
    	//상태는 정상이다
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>예외가 발생</h2>
<hr>

<%= exception.getMessage() %>
</body>
</html>