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
선언문(declaration): <%! %>
jsp 페이지에서 사용되는 전역변수 또는 메소드를 선언할 때 사용한다
 --%>
 
 <%! 
 String name="홍길동";
 int age = 20;
 %>
 
 
 <%!
 //클래스의 영역이라고 보면 될 듯
 public int add(int x, int y) {return x+y;}
 %> 
 
 <%
 out.print("이름: "+name +"<br>");
 out.print("나이: " + age + "<br>");
 int result = add(10, 20);
 out.print("10+20 = " + result + "<br>");
 %>
</body>
</html>