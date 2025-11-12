<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap');

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        padding: 40px;
        width: 90%;
        max-width: 600px;
    }

    h1 {
        color: #333;
        font-size: 28px;
        margin-bottom: 30px;
        text-align: center;
    }

    .form-group {
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #555;
        font-weight: 500;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    textarea:focus {
        border-color: #4a90e2;
        outline: none;
    }

    textarea {
        height: 200px;
        resize: vertical;
    }

    .submit-btn {
        background-color: #4a90e2;
        color: white;
        border: none;
        padding: 12px 24px;
        font-size: 18px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        display: block;
        width: 100%;
        font-weight: 700;
    }

    .submit-btn:hover {
        background-color: #357abd;
    }

    @media (max-width: 480px) {
        .container {
            padding: 20px;
        }

        h1 {
            font-size: 24px;
        }

        input[type="text"],
        textarea,
        .submit-btn {
            font-size: 14px;
        }
    }
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

BoardMethod bm = new BoardMethod();
String id = (String)session.getAttribute("userId");
String name = bm.getName(id);

%>
    <div class="container">
        <h1>새 글 작성</h1>
        <form action="writeCheck.jsp" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">작성자</label>
                <input type="text" id="author" name="writer" value="<%= name %>" readonly required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required></textarea>
            </div>
            <button type="submit" class="submit-btn">작성 완료</button>
        </form>
    </div>
</body>
</html>