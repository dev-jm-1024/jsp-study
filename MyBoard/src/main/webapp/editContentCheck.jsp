<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
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

int boardID = Integer.parseInt(request.getParameter("boardID"));
String title = request.getParameter("editTitle");
String content = request.getParameter("editContent");
BoardMethod bm = new BoardMethod();

int result = bm.updateContent(title, content, boardID);

if(result == 1)
{
	%>
	<script>
		alert("수정이 완료되었습니다.")
		location.href="main.jsp";
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