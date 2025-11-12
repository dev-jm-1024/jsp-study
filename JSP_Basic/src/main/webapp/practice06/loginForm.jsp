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
로그인 폼 만들기
action="loginCheck.jsp"
--%>


<h2>로그인</h2>

<form action="loginCheck.jsp"method="post">

아이디: 
<input type="text" name="id">

비밀번호:
<input type="text" name="pw">

<input type="submit" value="로그인하기">


</form>

</body>
</html>