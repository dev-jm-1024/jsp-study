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
		Connection conn;
		// Connection : DB와 연결성을 갖는객체
		PreparedStatement pstmt;
		// PreparedStatement : DB에 접근하여 SQL문을 실행하는 객체 
		ResultSet rs;
		// ResultSet : 조회(SELECT) 결과의 데이터를 갖는 객체
		
		String driver = "oracle.jdbc.OracleDriver";
		// OracleDriver : Oracle JDBC 드라이버 클래스이다.
		// 자바 프로그램에서 데이터베이스에 접속하려면
		// 드라이버를 프로그램에 등록하는 코드를 제공해야 한다.
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JSPUSER";
		String upw = "jsp123";
		String query = "SELECT * FROM KGMEMBER";
	%>
	
	<%
		try{
			
			Class.forName(driver);
			// Oracle 드라이버 클래스를 메모리로 로딩
			
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			// PreparedStatement 의 executeQuery 메소드로 SQL문을 전송
			// 데이터의 결과집합은 ResultSet 으로 반환
			
			while(rs.next()){
				// next : 다음 레코드가 있는지 확인 후
				// 다음 레코드가 없다면 false 반환
				// 다음 레코드가 있다면 true를 반환 후 
				// 커서를 다음 레코드로 이동시킨다.
				
				String id = rs.getString("ID");
				// ResultSet의 getter 메소드로 컬럼의 이름을 문자열로 지정하여 
				// 해당하는 컬럼의 값을 얻을 수 있다.
				
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				String address = rs.getString("ADDRESS");
				Timestamp regDate = rs.getTimestamp("REGDATE");
				
				out.print("아이디 : " + id + ", 비밀번호 : " + pw + 
						", 이름 : " + name + ", 이메일 : " + email
						+ ", 주소 : " + address + ", 가입일 : " + regDate + "<br>");
				
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// DB 관련 작업이 완료된 다음에는 사용했던 객체들은 메모리에서 해제해 주어야 한다.
			// 해제하는 순서는 최근에 사용했던 객체부터 거꾸로 올라가며 해제한다.
			
			try{
				
				if(rs != null)rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e2){}
			
			
		}
	
	%>
	
	
	
	
</body>
</html>











