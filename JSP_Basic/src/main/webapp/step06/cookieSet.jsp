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
Cookie cookie = new Cookie("cookieName", "cooieValue");
//쿠키생성 new Cookie("쿠키이름", "쿠키 값")

cookie.setMaxAge(60*60); //1시간동안 쿠키유지
//쿠키는 보통 유효시간을 정해주지 않으면 웹 브라우저를 닫음과 동시에 쿠키가 삭제
//그러나 유효시간을 설정해놓으며 유효시간 동안 쿠키가 존재
//웹 브라우저를 닫아도 유효시간이 남아있으면 쿠키는 삭제되지 않고 남아있게된다

//cookie.setValue("newCookieValue"); 쿠키값을 변경한다

response.addCookie(cookie);
//addCookie 메소드로 cookie객체를 웹 브라우저에 저장한다

%>

<h2>쿠키가 탑재되었습니다.</h2>
<a href="cookieGet.jsp">쿠키 얻기</a>

</body>
</html>