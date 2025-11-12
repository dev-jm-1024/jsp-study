<%@page import="com.jsp.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2{color: #3A3A3A}

#list, tr, th
{
	margin: 0 auto;
	border: 2px solid #FFFFFF;
	color: #FFFFFF;
	text-align: center;
	width: 800px;
	border-spacing: 0px;
	background-color: rgb(16, 43, 70);
}


a
{	
	text-decoration: none;
	color: #FFFFFF;
	font-weight: 500;
}
#writeBtn
{
	height: 50px;
	border: 2px solid #FFFFFF;

}

#writeBtn:hover
{
	background-color: yellow;
	color: #3a3a3a;
}
#text
{
	background-color: #F8FBF8;
	color: #3a3a3a;
	text-align: center;
	font-size: 20px;
	border-top: 3px solid #3A3A3A;
	border-bottom: 3px solid #3A3A3A;
}

#view, .view1
{
	background-color: burlywood;
	
	border: 2px solid #FFFFFF;
	height: 50px;
	color: #3a3a3a;
}
</style>

</head>
<body>
	
	<%--
		el 과 jstl을 사용하여 게시판 목록 페이지 만들기
	 --%>
	
	<%
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> list = dao.boardList();
		request.setAttribute("list", list);
	%>
	
<div id="text">
	<br>
	<h2>나의 게시판</h2>
	<br>
</div>
<br>
<table id="list">
	<tr>
		<th><h3>글 번호</h3></th>
		<th><h3>작성자</h3></th>
		<th><h3>제목</h3></th>
		<th><h3>등록일</h3></th>
		<th><h3>조회수</h3></th>
	</tr>

	<c:forEach var="dto" items="${list}">
		
	<tr>
		<td class="view1">${dto.boardID }</td>
		<td class="view1">${dto.writer }</td>
		<td class="view1"><a href="contentView.jsp?boardID=${dto.boardID}" style="color: #3A3A3A">${dto.title }</a></td>
		<td class="view1">
			<fmt:formatDate value="${dto.boardDate}" pattern="yyyy년 MM월 dd일"/> 
		</td>
		<td class="view1">${dto.hit }</td>
	</tr>

	</c:forEach>

	<tr>
		<td colspan="5" id="writeBtn">
			<a href="writeForm.jsp" >글 작 성</a>
		</td>
	</tr>


</table>
	
	
</body>
</html>