<%@page import="com.jsp.board.BoardDAO"%>
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
	
	<jsp:useBean id="dto" class="com.jsp.board.BoardDTO" />
	
	<jsp:setProperty name="dto" property="*" />
	
	<%
		BoardDAO dao = BoardDAO.getInstance();
		
		int result = dao.boardInsert(dto);
		
		if(result == 1){
			
	%>
		<script>
			alert('글이 등록되었습니다.');
			window.location = 'boardList.jsp';
		</script>
	
	<%
			
		}else{
			
	%>
		<script>
			alert('글이 등록되지 않았습니다.');
			history.back();
		</script>
	
	<%
			
		}
	
	%>
	
</body>
</html>







