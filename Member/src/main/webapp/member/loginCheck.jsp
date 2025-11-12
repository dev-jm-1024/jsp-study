

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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = MemberDAO.getInstacne();
		
		int check = dao.loginCheck(id, pw);
		
		if(check == -1){ // 아이디가 없는경우
			
		%>
			<script>
				alert('아이디가 존재하지 않습니다.');
				history.back();
			</script>
		<%
			
		}else if(check == 0){ // 비밀번호가 틀린경우
			
		%>
			<script>
				alert('비밀번호가 틀립니다.');
				history.back();
			</script>
		
		<%
			
		}else if(check == 1){ // 로그인 OK
			
			MemberDTO dto = dao.getMember(id);
			session.setAttribute("member", dto);
			response.sendRedirect("main.jsp");
			
		}
	
	
	%>
	
</body>
</html>