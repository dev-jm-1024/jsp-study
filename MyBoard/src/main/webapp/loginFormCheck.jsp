<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

System.out.println("id: " + id + ", pw: " + pw);

BoardMethod bm = new BoardMethod(); // BoardMethod 객체 생성
boolean result = bm.loginCheck(id, pw);
System.out.println("로그인 결과: " + result);

if(result) // 로그인 성공
{
    session.setAttribute("userId", id); // 세션에 사용자 ID 저장
%>
    <script>
    alert("환영합니다, <%= id %>님!");
    </script>
<%
	response.sendRedirect("main.jsp");
}
else // 로그인 실패
{
%>
    <script>
    alert("로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
    history.back(); // 이전 페이지(로그인 페이지)로 돌아가기
    </script>
<% 
}
%>
</body>
</html>