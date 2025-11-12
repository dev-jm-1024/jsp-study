
<%@page import="com.jsp.member.MemberDAO"%>
<%@page import="com.jsp.member.MemberDTO"%>
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
	
	<%
		MemberDAO dao = MemberDAO.getInstacne();
	
		int result = dao.memberUpdate(dto);
		
		if(result == 1){
			
			MemberDTO dto2 = dao.getMember(dto.getId());
			session.setAttribute("member", dto2);
			
			%>
				<script>
					alert('회원정보가 수정되었습니다.');
					window.location = 'main.jsp';
				</script>
			
			<%
			
		}else{
			
			%>
				<script>
					alert('회원정보 수정 실패입니다.');
					history.back();
				</script>
			<%
			
		}
	
	%>
	
</body>
</html>