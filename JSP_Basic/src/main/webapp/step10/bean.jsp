<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="student" class="com.jsp.bean.Student" scope="page" />

<%--
id: jsp페이지에서 자바빈 객체에 접근할 때 사용하는 이름
Student student = new Student(); 에서 student에 해당한다고 보면된다


class: 패키지 이름을 포함한 자바빈 클래스의 완전한 이름을 입력
scope: 자바빈 객체가 저장될 영역을 지정 
		(page, request, session, application)
		
name: 자바빈 객체의 이름을 명시
property: 속성 이름을 명시
value: 해당 속성값을 설정

 --%>
 
<jsp:setProperty name="student" property="studentID" value="202401"/>
<jsp:setProperty name="student" property="name" value="홍길동"/>
<jsp:setProperty name="student" property="age" value="20"/>
<jsp:setProperty name="student" property="major" value="컴퓨터공학"/>

학번: <jsp:getProperty name="student" property="studentID"/><br>
이름: <jsp:getProperty name="student" property="name"/><br>
나이: <jsp:getProperty name="student" property="age"/><br>
전공: <jsp:getProperty name="student" property="major"/><br>
</body>
</html>