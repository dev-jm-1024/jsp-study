<%@page import="com.myBoard.MyBoardData"%>
<%@page import="java.util.List"%>
<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        input[type="text"], textarea {
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<%
request.setCharacterEncoding("UTF-8");

BoardMethod bm = new BoardMethod();
String id = (String)session.getAttribute("userId");

int boardID = Integer.parseInt(request.getParameter("boardID"));
List<MyBoardData> boardList = bm.searchBoard(boardID);
MyBoardData mbd = boardList.get(0); // 첫 번째 항목 사용
%>

<body>
    <div class="container">
        <h2>게시글 수정</h2>
        <form action="editContentCheck.jsp" method="post">
        <input type="hidden" name="boardID" value="<%= boardID%>">
            <label for="editTitle">제목</label>
            <input type="text" id="editTitle" name="editTitle" value="<%= mbd.getTitle() %>" required>
            
            <label for="editWriter">작성자</label>
            <input type="text" id="editWriter" name="editWriter" value="<%= mbd.getWriter() %>" readonly required>
            
            <label for="editContent">내용</label>
            <textarea id="editContent" name="editContent" required><%= mbd.getContent() %></textarea>
            
            <button type="submit">수정하기</button>
        </form>
    </div>
</body>
</html>