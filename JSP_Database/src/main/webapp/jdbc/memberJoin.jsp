<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		회원 가입 폼
		id, pw, name, email, address 을 입력받는 폼 만들기
	 --%>
	
	<h2>회원 가입 폼</h2>
	
	<form action="memberJoinCheck.jsp" method="post">
	
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name"><br>
		이메일 : <input type="text" name="email"><br>
		주소 : <input type="text" name="address"><br>
		
		<input type="submit" value="회원가입">
		
	
	</form>
	
</body>
</html>






