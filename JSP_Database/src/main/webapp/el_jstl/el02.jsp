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
		EL은 자바빈의 프로퍼티를 jsp 표현식이나 
		액션태그를 사용하는 것보다 쉽고 간결하게 사용할 수 있다.
	 --%>
	
	<jsp:useBean id="member" class="com.el.ELMember" />
	
	<jsp:setProperty name="member" property="id" value="hong" />
	<jsp:setProperty name="member" property="pw" value="1234" />
	<jsp:setProperty name="member" property="name" value="홍길동" />
	<jsp:setProperty name="member" property="age" value="20" />
	
	아이디 : <jsp:getProperty name="member" property="id" /><br>
	비밀번호 : <jsp:getProperty name="member" property="pw" /><br>
	이름 : <jsp:getProperty name="member" property="name" /><br>
	나이 : <jsp:getProperty name="member" property="age" /><br>
	
	<hr>
	
	아이디 : ${member.id }<br>
	비밀번호 : ${member.pw }<br>
	이름 : ${member.name }<br>
	나이 : ${member.age }<br>
	
	
</body>
</html>




