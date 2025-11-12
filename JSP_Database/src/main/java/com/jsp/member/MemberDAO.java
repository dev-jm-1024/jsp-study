package com.jsp.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.*;
import javax.sql.DataSource;

public class MemberDAO {
	
	// DAO : Data Access Object
	// 데이터베이스에 접근하여 CRUD를 처리하는 객체
	
	private DataSource ds;
	// DataSource 는 Connection Pool을 관리하는 객체
	// 이 객체는 JNDI(Java Naming & Directory Interface) api 를 통해서 이용된다.
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbId = "C##JSPUSER";
	private String dbPw = "jsp123";
	
	// 싱글톤 : 단 하나의 객체만 생성하는 것.
	// 싱글톤을 만들려면 클래스 외부에서 new연산자로 생성자를 호출할 수 없도록 해야된다. 
	// 외부에서 생성자 호출을 막기위해 private을 붙여준다.
	// 외부에서 객체를 얻는 방법은 getInstance()메소드를 호출하는 방법이다.
	// getInstance()메소드는 단 하나의 객체만 리턴한다.
	
	// 싱글톤을 쓰는 이유
	// 고정된 메모리 영역을 얻으면서 한번의 new로 인스턴스를 사용하기 때문에 
	// 메모리 낭비를 방지할 수 있다.
	// 싱글톤으로 만들어진 클래스의 인스턴스는 전역 인스턴스이기 때문에 
	// 다른 클래스의 인스턴스들이 데이터를 공유하기 쉽다.
	// DBCP(DataBase Connection Pool)처럼 공통된 객체를 
	// 여러개 생성해서 사용해야하는 상황에서 많이 사용한다.
	
	private MemberDAO() {
		
		try {
			
			Context context = new InitialContext();
			// JNDI 서비스를 제공하는 객체
			
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstacne() {
		return instance;
	}
	
	public int memberInsert(MemberDTO dto) {
		int result = 0;
//		ID	VARCHAR2(50 BYTE)
//		PW	VARCHAR2(50 BYTE)
//		NAME	NVARCHAR2(50 CHAR)
//		EMAIL	VARCHAR2(100 BYTE)
//		ADDRESS	NVARCHAR2(100 CHAR)
//		REGDATE	TIMESTAMP(6)
		String query = "INSERT INTO KGMEMBER(ID, PW, NAME, EMAIL, ADDRESS) "
				+ "VALUES(?, ?, ?, ?, ?)";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			 
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return result;
	}
	
	
	// 같은 아이디가 있는지 없는지 확인해주는 메소드
	public boolean idCheck(String id) {
		boolean idCheck = false;
		
		String query = "SELECT ID FROM KGMEMBER WHERE ID = ?";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idCheck = true;
			}else {
				idCheck = false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return idCheck;
	}
	
	// 로그인시 아이디와 비밀번호가 맞는지 확인
	// 아이디가 존재하지 않는경우 : -1
	// 아이디가 존재하는 경우 > 비밀번호가 틀린경우 : 0
	// 아이디가 존재하는 경우 > 비밀번호가 맞는경우 : 1
	public int loginCheck(String id, String pw) {
		
		int loginCheck = 0;
		
		String query = "SELECT PW FROM KGMEMBER WHERE ID = ?";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디가 있는경우
				
				String dbPw = rs.getString("PW");
				
				if(pw.equals(dbPw)) { // 비밀번호가 맞는경우 
					loginCheck = 1;
				}else {// 비밀번호가 틀린경우
					loginCheck = 0;
				}
				
			}else { // 아이디가 없는경우
				loginCheck = -1;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return loginCheck;
		
	}
	
	// id 에 해당하는 회원의 정보를 얻을 수 있는 기능
	
	public MemberDTO getMember(String id) {
		
		MemberDTO dto = null;
		
		String query = "SELECT * FROM KGMEMBER WHERE ID = ?";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new MemberDTO();
//				ID	VARCHAR2(50 BYTE)
//				PW	VARCHAR2(50 BYTE)
//				NAME	NVARCHAR2(50 CHAR)
//				EMAIL	VARCHAR2(100 BYTE)
//				ADDRESS	NVARCHAR2(100 CHAR)
//				REGDATE	TIMESTAMP(6)
				dto.setId(rs.getString("ID"));
				dto.setPw(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setAddress(rs.getString("ADDRESS"));
				dto.setRegDate(rs.getTimestamp("REGDATE"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return dto;
	}
	
	// 회원정보 수정하는 기능
	// pw, email, address 수정
	public int memberUpdate(MemberDTO dto) {
		int result = 0;
		
		String query = "UPDATE KGMEMBER SET PW = ?, EMAIL = ?, ADDRESS = ? "
						+ "WHERE ID = ?";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return result;
	}
	
	// 회원삭제
	public int memberDelete(String id) {
		int result = 0;
		
		String query = "DELETE FROM KGMEMBER WHERE ID = ?";
		
		try {
			
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return result;
	}

}






