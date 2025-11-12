<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
}
#loginForm {
    background: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 15px 25px rgba(0,0,0,0.1);
    width: 300px;
}
#title {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}
#title h4 {
    margin: 0;
    font-size: 24px;
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
.btn {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.login {
    background-color: #667eea;
    color: white;
    margin-bottom: 10px;
}
.login:hover {
    background-color: #5a67d8;
}
.register {
    background-color: #f0f0f0;
    color: #333;
}
.register:hover {
    background-color: #e0e0e0;
}
</style>
</head>
<body>

<form action="loginFormCheck.jsp" method="post" name="loginForm" id="loginForm">
    <div id="title"><h4>Login</h4></div>
    <div class="input-group">
        <label for="id">ID</label>
        <input type="text" name="id" id="id" required>
    </div>
    <div class="input-group">
        <label for="pw">Password</label>
        <input type="password" name="pw" id="pw" required>
    </div>
    <button type="submit" class="btn login">로그인</button>
    <button type="button" class="btn register" onclick="location.href='joinForm.jsp'">회원가입</button>
</form>

</body>
</html>