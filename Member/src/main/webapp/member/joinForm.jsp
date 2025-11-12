<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	*{
		text-align: center;
		margin: 0 auto;
	}

</style>

</head>
<body>
	
	<script>
	
		function joinFormCheck(){
			
			var id = document.joinForm.id.value;
			var pw = document.joinForm.pw.value;
			var pwCheck = document.joinForm.pwCheck.value;
			
			if(id == null || id == ""){
				alert('아이디는 필수사항 입니다.');
				document.joinForm.id.focus();
				return;
			}
			
			if(pw == null || pw == ""){
				alert('비밀번호는 필수사항 입니다.');
				document.joinForm.pw.focus();
				return;
			}
			
			if(pw != pwCheck){
				alert('비밀번호가 일치하지 않습니다.');
				document.joinForm.pw.focus();
				return;
			}
			
			document.joinForm.submit();
			
		}
	
	</script>
	
	
	<br><hr>
	<h2>회원가입</h2>
	<hr><br>
	
	<form name="joinForm" action="joinCheck.jsp" method="post">
	
		<table border="1">
			
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pw"></td>
			</tr>
			 
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" name="pwCheck"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" onclick="joinFormCheck()" value="회원가입">
				</td>
			</tr>
			
		</table>
	
	</form>
	
</body>
</html>





