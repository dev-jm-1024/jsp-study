<%@page import="com.myBoard.BoardMethod"%>
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
String id = request.getParameter("id");

BoardMethod bm = new BoardMethod();


int result = bm.deleteMember(id);
if(result == 1)
{
	%>
	<script>
		alert("회원 탈퇴가 완료되었습니다.");
		location.href="loginForm.jsp";
	</script>
	<%
}
else
{
	%>
	<script>
		alert("오류가 발생하였습니다.");
		history.back();
	</script>
	<%
}
%>
</body>
</html>