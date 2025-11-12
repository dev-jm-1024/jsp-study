<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
메소드 만들기: (로또번호를 추첨하여 List에 저장 후, 반환해주는 메소드)
ArrayList, Math.random(), 반복문(while or for문) ,로또번호 6개(중복 수 없이) 1~45
List에 저장 후 List를 반환해주는 메소드
 --%>
 
 <%!
 
public List<Integer> getLotto()
{
	List<Integer> num = new ArrayList<Integer>();
	
	while(num.size() < 6)
	{
		int n = (int)(Math.random()*45)+1;
		
		if(!num.contains(n))
			num.add(n);
	}

	Collections.sort(num);
	
	return num;
}
 %>
 로또번호: 
 <%
 List<Integer> lotto = getLotto();
 for(int print : lotto)
	 out.print(print + "&nbsp;");
 
 %>
</body>
</html>