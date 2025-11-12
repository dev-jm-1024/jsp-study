<%@page import="com.myBoard.BoardMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 업데이트</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("userId");
String updatePW = request.getParameter("updatePW");
String updateName = request.getParameter("updateName");
String updateNumber = request.getParameter("updateNumber");

BoardMethod bm = new BoardMethod();

int result = bm.updateMemberInfo(updatePW, updateName, updateNumber, id);

if(result == 1)
{
    %>
    <script>
        alert("회원 정보가 변경되었습니다!");
        window.location.href = "loginForm.jsp";
    </script>
    <%
}
else
{
    %>
    <script>
        alert("회원 정보 변경에 실패하였습니다!");
        history.back();
    </script>
    <%
}
%>
</body>
</html>