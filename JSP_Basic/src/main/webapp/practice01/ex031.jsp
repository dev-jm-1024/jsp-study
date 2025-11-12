<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
public List<Integer> getLotto()
{
	List<Integer>numbers = new ArrayList<Integer>();
	
	
	
	for(int i = 0; i < 6; i++)
	{
		int ns = (int)(Math.random()*45) + 1;
		
		if(!numbers.contains(ns))
			numbers.add(ns);
	}
	
	Collections.sort(numbers);
	
	return numbers;
}
%>


<%
List<Integer> lotto = getLotto();
for(int print : lotto)
	out.print(print + "  ");
%>
</body>
</html>