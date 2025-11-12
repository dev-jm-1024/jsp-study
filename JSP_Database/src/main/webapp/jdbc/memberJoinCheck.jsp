<%@page import="java.sql.*"%>
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
		String id, pw, name, email, address;
		Connection conn;
		PreparedStatement pstmt;
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "C##JSPUSER";
		String dbPw = "jsp123";
	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		email = request.getParameter("email");
		address = request.getParameter("address");
		
		try{
			
			String query = "INSERT INTO KGMEMBER(ID, PW, NAME, EMAIL, ADDRESS) " + 
							"VALUES(?, ?, ?, ?, ?)";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			// PreparedStatement 의 setter 메소드로 
			// 첫번째 인자로는 ?에 대한 인덱스를 두번째 인자로는 값을 넣어준다.
			// ?에 대한 인덱스는 1부터 시작된다.
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			
			int result = pstmt.executeUpdate();
			// 변경된 레코드의 수를 반환
			
			if(result == 1){
				
				System.out.println("회원가입이 되었습니다.");
				response.sendRedirect("memberList.jsp");
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
			try{
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2){}
			
		}
		
	%>
	
</body>
</html>



