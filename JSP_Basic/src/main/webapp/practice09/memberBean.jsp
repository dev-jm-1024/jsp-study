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
useBean 액션태그로 Member 클래스로 부터 Member 빈 객체 생성하기
setProperty 액션태그로 Memenr 빈 객체에 데이터 넣기
getProperty 액션태그로 Member 빈 객체의 데이터를 웹 브라우저에 출력하기

 --%>
 <jsp:useBean id="member" class="com.jsp.bean.Member" scope="page"/>
 
 <!-- setProperty 액션태그로 데이터 넣기  -->
 <jsp:setProperty property="id" name="member" value="hong"/>
  <jsp:setProperty property="pw" name="member" value="1234"/>
   <jsp:setProperty property="name" name="member" value="홍길동"/>
    <jsp:setProperty property="age" name="member" value="24"/>
    
<!--  getProperty로 출력하기 -->
아이디: <jsp:getProperty property="id" name="member"/>
비밀번호: <jsp:getProperty property="pw" name="member"/>
이름: <jsp:getProperty property="name" name="member"/>
나이: <jsp:getProperty property="age" name="member"/>
</body>
</html>