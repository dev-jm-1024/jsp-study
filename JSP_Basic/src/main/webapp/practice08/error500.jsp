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

<script>
alert("요청 페이지가 없습니다")
</script>
</head>
<body>
<h2>error500 페이지 입니다</h2>
</body>
</html>