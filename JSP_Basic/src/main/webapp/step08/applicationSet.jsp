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
//웹 브라우저를 닫아도 유지가 된다.
//서버를 종료하기전까지 유지가 된다


//application객체는 jsp내장 객체로 jsp 페이지에서 따로 생성하지 않아도 사용할 수 있다.
//자신이 속한 웹 어플리케이션 범위 안의 모든 jsp범위에서 공유된다

application.setAttribute("name", "홍길동");
application.setAttribute("age", 20);


%>

<h2>어플리케이션이 생성되었습니다</h2>
<hr>
<a href="applicationGet.jsp">어플리케이션 얻기</a>
</body>
</html>