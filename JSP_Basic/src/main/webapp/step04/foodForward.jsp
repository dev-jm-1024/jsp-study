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
request.setCharacterEncoding("UTF-8");
%>

<%--
jsp페이지에서 다른 jsp페이지로 요청처리를 전달할 때 사용한다
웹 브라우저의 주소는 처음 요청받은 jsp주소로 유지된다
요청 흐름이 이동할 때 request, response 객체가 전달된다
--%>

<!-- 데이터 넣어서 보낼 때  -->
<jsp:forward page="foodInfo.jsp">

	<jsp:param value="홍길동" name="name"/>
</jsp:forward>
</body>
</html>