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
		
	</style>
	
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<br><hr>
	<h2>글수정 하기</h2>
	<hr><br>
	
	<form action="modifyCheck.jsp" method="post">
		<input type="hidden" name="boardID" value="${param.boardID}">
		<table border="1">
			
			<tr>
				<th>글번호</th>
				<td>${param.boardID}</td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td>${param.hit}</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td>${param.writer}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="${param.title}" >
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="23" name="content" >${param.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="글 수 정">
				</td>
			</tr>
			
		</table>
	
	</form>
	
</body>
</html>




