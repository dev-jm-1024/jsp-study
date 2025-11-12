<%@page import="com.myBoard.BoardMethod"%>
<%@ page import="com.myBoard.MyBoardData" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    header {
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    h2 {
        color: #333;
        margin: 0;
        font-size: 1.5em;
    }
    #headerMenu {
        display: flex;
        gap: 10px;
    }
    .headerBtn {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 0.9em;
        font-weight: 500;
    }
    .headerBtn:hover {
        background-color: #45a049;
    }
    .headerBtn:nth-child(1) {
        background-color: #f44336;
    }
    .headerBtn:nth-child(1):hover {
        background-color: #d32f2f;
    }
    .headerBtn:nth-child(2) {
        background-color: #2196F3;
    }
    .headerBtn:nth-child(2):hover {
        background-color: #1976D2;
    }
    article {
        max-width: 1000px;
        margin: 20px auto;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        overflow: hidden;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f8f8f8;
        font-weight: bold;
        color: #333;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    .number {
        width: 10%;
        text-align: center;
    }
    .title {
        width: 40%;
    }
    .author {
        width: 15%;
    }
    .date {
        width: 20%;
    }
    .views {
        width: 15%;
        text-align: center;
    }
    a {
        color: #333;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
BoardMethod bm = new BoardMethod();
String id = (String)session.getAttribute("userId");
%>
<header>
    <h2><span id="userId"><%= id %></span>님 안녕하세요!</h2>
    <div id="headerMenu">
        <button class="headerBtn" onclick="location.href='logout.jsp'">로그아웃</button>
        <button class="headerBtn" onclick="location.href='editMember.jsp'">회원정보 변경</button>
        <button class="headerBtn" onclick="location.href='write.jsp'">글쓰기</button>
    </div>
</header>
<article>
    <table>
        <thead>
            <tr>
                <th class="number">번호</th>
                <th class="title">제목</th>
                <th class="author">작성자</th>
                <th class="date">작성날짜</th>
                <th class="views">조회수</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<MyBoardData> contentList = bm.getContentList();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

            for(MyBoardData board : contentList) {
        %>
            <tr>
                <td class="number"><%= board.getBoardID() %></td>
                <td class="title">
                    <a href="viewContent.jsp?boardID=<%=board.getBoardID()%>&action=upHit">
                        <%= board.getTitle() %>
                    </a>
                </td>
                <td class="author"><%= board.getWriter() %></td>
                <td class="date"><%= sdf.format(board.getBoardDate()) %></td>
                <td class="views"><%= board.getHit() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</article>
</body>
</html>