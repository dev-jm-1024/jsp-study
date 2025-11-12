<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .form-container {
        background-color: white;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 1.5rem;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    label {
        display: block;
        margin-bottom: 0.5rem;
        color: #666;
    }
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 1rem;
    }
    .id-display {
        background-color: #f8f8f8;
        padding: 0.5rem;
        border-radius: 4px;
        font-weight: bold;
        color: #333;
    }
    .submit-btn,
    .delete-btn {
        width: 100%;
        padding: 0.75rem;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .submit-btn {
        background-color: #4CAF50; /* 변경하기 버튼 색상 */
        color: white;
        border: none;
    }
    .submit-btn:hover {
        background-color: #45a049; /* 변경하기 버튼 hover 색상 */
    }
    .delete-btn {
        background-color: #f44336; /* 탈퇴 버튼 색상 */
        color: white;
        border: none;
        margin-top: 10px; /* 버튼 간격 */
    }
    .delete-btn:hover {
        background-color: #d32f2f; /* 탈퇴 버튼 hover 색상 */
    }
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

BoardMethod bm = new BoardMethod();

String id = (String)session.getAttribute("userId");

String pw = bm.getPw(id);
String name = bm.getName(id);
String phone = bm.getPhone(id);
%>
<div class="form-container">
    <h2>회원정보 수정</h2>
    <form action="editMemberCheck.jsp" method="post" id="editMemberForm">
        <input type="hidden" value="<%= id %>" name="id">
        
        <div class="form-group">
            <label for="id">아이디:</label>
            <div class="id-display" id="id"><%= id %></div>
        </div>

        <div class="form-group">
            <label for="updateName">이름:</label>
            <input type="text" name="updateName" id="updateName" value="<%= name %>" required>
        </div>

        <div class="form-group">
            <label for="updatePW">비밀번호:</label>
            <input type="password" name="updatePW" id="updatePW" value="<%= pw %>" required>
        </div>

        <div class="form-group">
            <label for="updateNumber">전화번호:</label>
            <input type="text" name="updateNumber" id="updateNumber" value="<%= phone %>" required>
        </div>

        <input type="submit" value="변경하기" class="submit-btn">
    </form>
    
    <!-- 회원탈퇴 버튼을 별도의 form으로 분리 -->
    <form action="deleteMember.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <button type="submit" class="delete-btn">회원탈퇴</button>
    </form>
</div>
</body>
</html>