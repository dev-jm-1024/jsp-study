<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    // 요청 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // form에서 전송된 데이터 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    System.out.println(id+", " + pw);

    // null 값 체크 및 로그인 확인 로직
    if (id != null && pw != null && id.equals("hong") && pw.equals("1234")) {
        // 쿠키 객체 생성 후 응답에 추가
        Cookie cID = new Cookie("id", id);
        cID.setMaxAge(60 * 60); // 쿠키 유효기간 설정
        response.addCookie(cID); // 응답에 쿠키 추가

        // 메인 페이지로 리다이렉트
        response.sendRedirect("main.jsp");
    } else {
        // 로그인 실패 시 로그인 폼으로 리다이렉트
        response.sendRedirect("loginForm.jsp");
    }
%>

</body>
</html>
