<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }
    #joinForm {
        background: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 15px 25px rgba(0,0,0,0.1);
        width: 300px;
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    .input-group {
        margin-bottom: 20px;
    }
    .input-group label {
        display: block;
        margin-bottom: 5px;
        color: #666;
    }
    .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }
    .submit-btn {
        width: 100%;
        padding: 10px;
        background-color: #667eea;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .submit-btn:hover {
        background-color: #5a67d8;
    }
</style>
<script>
    function formCheck(event) {
        event.preventDefault(); // 폼 제출을 막습니다.
        var id = document.getElementById('id').value;
        var pw = document.getElementById('pw').value;
        var pw2 = document.getElementById('pw2').value;
        var name = document.getElementById('name').value;
        var number = document.getElementById('number').value;

        var errors = [];

        if(id === "") {
            errors.push("아이디가 공백입니다.");
        }
        if(pw !== pw2) {
            errors.push("비밀번호가 일치하지 않습니다.");
        }
        if(name === "") {
            errors.push("이름이 공백입니다.");
        }
        if(number === "") {
            errors.push("전화번호가 공백입니다.");
        }

        if(errors.length > 0) {
            alert(errors.join("\n"));
        } else {
            document.getElementById('joinForm').submit(); // 폼을 제출합니다.
        }
    }
</script>
</head>
<body>
<form action="joinFormCheck.jsp" method="post" id="joinForm" onsubmit="formCheck(event)">
    <h2>회원가입</h2>
    <div class="input-group">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id">
    </div>
    <div class="input-group">
        <label for="pw">비밀번호</label>
        <input type="password" name="pw" id="pw">
    </div>
    <div class="input-group">
        <label for="pw2">비밀번호 확인</label>
        <input type="password" name="pw2" id="pw2">
    </div>
    <div class="input-group">
        <label for="name">이름</label>
        <input type="text" name="name" id="name">
    </div>
    <div class="input-group">
        <label for="number">전화번호</label>
        <input type="text" name="number" id="number">
    </div>
    <button type="submit" class="submit-btn">회원가입 하기</button>
</form>
</body>
</html>