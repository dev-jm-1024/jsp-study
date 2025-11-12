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
request.setCharacterEncoding("UTF-8");

BoardMethod bm = new BoardMethod();
String id = (String)session.getAttribute("userId");

String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
int hit = 0;
int result = bm.writeContent(writer, title, content, 0);



if(result == 1)
{
	%>
	<script>
		alert("글 작성이 완료되었습니다.");
		location.href="main.jsp";
	
	</script>
	<%
}
else
{
	%>
	<script>
		alert("오류가 발생하였습니다.");
		history.back()
	</script>
	<%
}
%>
</body>
</html>