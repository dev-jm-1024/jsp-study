<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.myBoard.MyBoardData"%>
<%@page import="java.util.List"%>
<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
        color: #333;
        line-height: 1.6;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        padding: 40px;
    }

    .post-header {
        border-bottom: 2px solid #eaeaea;
        padding-bottom: 20px;
        margin-bottom: 30px;
    }

    .post-title {
        font-size: 32px;
        font-weight: 700;
        margin: 0 0 10px 0;
        color: #2c3e50;
    }

    .post-meta {
        font-size: 14px;
        color: #7f8c8d;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .post-content {
        font-size: 16px;
        line-height: 1.8;
    }

    .post-actions {
        margin-top: 40px;
        display: flex;
        justify-content: space-between;
    }

    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.1s;
    }

    .btn:hover {
        transform: translateY(-2px);
    }

    .btn-primary {
        background-color: #3498db;
        color: white;
    }

    .btn-primary:hover {
        background-color: #2980b9;
    }

    .btn-secondary {
        background-color: #e74c3c;
        color: white;
    }

    .btn-secondary:hover {
        background-color: #c0392b;
    }

    @media (max-width: 600px) {
        .container {
            padding: 20px;
            margin: 20px;
        }

        .post-title {
            font-size: 24px;
        }

        .post-actions {
            flex-direction: column;
            gap: 10px;
        }

        .btn {
            width: 100%;
        }
    }
</style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("userId");
    int boardID = Integer.parseInt(request.getParameter("boardID"));
    
    BoardMethod bm = new BoardMethod();
    List<MyBoardData> boardData = bm.searchBoard(boardID);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    
    boolean action = "upHit".equals(request.getParameter("action"));
    if (!boardData.isEmpty() && action) {
        MyBoardData mda = boardData.get(0);
        bm.upHit(Integer.parseInt(request.getParameter("boardID")));
        Timestamp date = mda.getBoardDate();
%>
    <div class="container">
        <article class="post">
            <header class="post-header">
                <h1 class="post-title"><%= mda.getTitle() %></h1>
                <div class="post-meta">
                    <span>작성자: <%= mda.getWriter() %></span>
                    <span>작성일: <%= sdf.format(date) %></span>
                    <span>조회수: <%= mda.getHit() %></span>
                </div>
            </header>
            <div class="post-content">
                <p><%= mda.getContent().replace("\n", "<br>") %></p>
            </div>
        </article>
        <%
        String name = bm.getName(id);
        String writer = bm.getWriter(boardID);
        
        boolean result = name.equals(writer);
        
        if(result)
        {
        	%>
        	
        	<%@ include file="viewContentFooter.jsp" %>
        	
        	<%
        }
        
        %>
        
        
        
        
        
    </div>
<%
    } else {
%>
    <div class="container">
        <p>해당 게시글을 찾을 수 없습니다.</p>
    </div>
<%
    }
%>
</body>
</html>