<%@page import="com.jsp.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="dto" class="com.jsp.member.MemberDTO" />
	
	<jsp:setProperty property="*" name="dto"/>
	
	<%--
		넘어오는 파라미터가 많을경우 property 속성값을 *로 해주면
		넘어오는 파라미터의 값들이 객체의 프로퍼티 값으로 자동 바인딩 된다.
		주의할점은 폼으로부터 넘어오는 파라미터의 이름과 프로퍼티의 이름이 일치해야 한다.
	 --%>
	
	<%
		MemberDAO dao = MemberDAO.getInstacne();
	
		boolean idCheck = dao.idCheck(dto.getId());
		
		if(idCheck){ // 같은 아이디가 있는경우
			
	%>
			<script>
				alert('아이디가 이미 존재합니다.');
				history.back();
			</script>
	
	<%
			
		}else{ // 같은 아이디가 없는경우
			
			int result = dao.memberInsert(dto);
		
			if(result == 1){
				
		%>
			<script>
				alert('회원가입 되었습니다.');
				window.location = 'loginForm.jsp';
			</script>
		<%
		
				
			}else{
				
		%>
			<script>
				alert('회원가입 실패입니다.');
				history.back();
			</script>
		
		<%
				
			}
			
		}
	
	
	%>
	
	
	
</body>
</html>










