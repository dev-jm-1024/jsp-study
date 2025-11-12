<%@page import="com.mvc.board.BoardDTO"%>
<%@page import="com.mvc.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		*{
			text-align: center;
			margin: 0 auto;
		}
		
		form {
			display: inline;
		}
		
	</style>

</head>
<body>
	
	<%
		String boardID = request.getParameter("boardID");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = dao.getContent(Integer.parseInt(boardID));
		
		request.setAttribute("dto", dto);
	%>
	
	<br><hr>
	<h2>${dto.title } 내용 보기</h2>
	<hr><br>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${dto.boardID }</td>
		</tr>
		
		<tr>
			<th>조회수</th>
			<td>${dto.hit }</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>${dto.content }</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<form action="modifyForm.jsp" method="post">
					
					<input type="hidden" name="boardID" value="${dto.boardID }" >
					<input type="hidden" name="hit" value="${dto.hit }" >
					<input type="hidden" name="writer" value="${dto.writer }" >
					<input type="hidden" name="title" value="${dto.title }" >
					<input type="hidden" name="content" value="${dto.content }" >
					
					<input type="submit" value="글 수 정">
					
				</form>
				
				&nbsp;&nbsp;
				
				<form action="delete.jsp" method="post">
					
					<input type="hidden" name="boardID" value="${dto.boardID }" >
					
					<input type="submit" value="글 삭 제">
					
				</form>
				
			</td>
		</tr>
		
	</table>
	
	
</body>
</html>














