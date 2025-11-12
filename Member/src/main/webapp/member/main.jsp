
<%@page import="com.jsp.member.MemberDAO"%>
<%@page import="com.jsp.member.MemberDTO"%>TO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(session.getAttribute("member") == null){
%>    
    <jsp:forward page="loginForm.jsp" />
<%
	}

	MemberDTO dto = (MemberDTO)session.getAttribute("member");

%>    
    
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
	<br><hr>
	<h2><%=dto.getName() %> 회원님의 정보</h2>
	<hr><br>
	
	<h3>아이디 : <%=dto.getId() %></h3>
	<br>
	<h3>비밀번호 : <%=dto.getPw() %></h3>
	<br>
	<h3>이름 : <%=dto.getName() %></h3>
	<br>
	<h3>이메일 : <%=dto.getEmail() %></h3>
	<br>
	<h3>주소 : <%=dto.getAddress() %></h3>
	<br>
	
	<a href="modifyForm.jsp">회원정보 수정</a>
	
	&nbsp;&nbsp;&nbsp;
	
	<a href="delete.jsp">회원삭제</a>
	
	&nbsp;&nbsp;&nbsp;
	
	<a href="logout.jsp">로그아웃</a>
	
</body>
</html>







