<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div class="post-actions">
            <button class="btn btn-primary" onclick="location.href='editContent.jsp?boardID=<%= boardID %>'">수정하기</button>
            <button class="btn btn-secondary" onclick="if(confirm('정말로 삭제하시겠습니까?')) location.href='deleteContent.jsp?boardID=<%= boardID %>'">삭제하기</button>
        </div>
        
</body>
</html>