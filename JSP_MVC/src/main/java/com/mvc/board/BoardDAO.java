package com.mvc.board;

import java.sql.*;
import javax.sql.*;
import java.util.*;
import javax.naming.*;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private BoardDAO() {
		try {
			
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 게시판 목록 > 글 작성 > 글 등록 > 제목을 클릭시 내용페이지 (조회수 증가)
	// 글 수정 > 글 삭제 
	
	// 게시판 목록페이지 기능
	public List<BoardDTO> boardList(){ 
		
		List<BoardDTO> list = new ArrayList<>();
		
		String query = "SELECT * FROM BOARD ORDER BY BOARD_ID DESC";
		// BOARD_ID 를 기준으로 내림차순으로 정렬
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
//				BOARD_ID	NUMBER(4,0)
//				WRITER	NVARCHAR2(50 CHAR)
//				TITLE	NVARCHAR2(50 CHAR)
//				CONTENT	NVARCHAR2(500 CHAR)
//				BOARD_DATE	TIMESTAMP(6)
//				HIT	NUMBER(4,0)
				int boardID = rs.getInt("BOARD_ID");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				Timestamp boardDate = rs.getTimestamp("BOARD_DATE");
				int hit = rs.getInt("HIT");
				
				list.add(new BoardDTO(boardID, writer, title, content, boardDate, hit));
				
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
		
		return list;
	}
	
	// 글 작성 후 글 등록하는 기능
	public int boardInsert(BoardDTO dto) {
		int result = 0;
//		BOARD_ID	NUMBER(4,0)
//		WRITER	NVARCHAR2(50 CHAR)
//		TITLE	NVARCHAR2(50 CHAR)
//		CONTENT	NVARCHAR2(500 CHAR)
//		BOARD_DATE	TIMESTAMP(6)
//		HIT	NUMBER(4,0)
		String query = "INSERT INTO BOARD(BOARD_ID, WRITER, TITLE, CONTENT) "
						+ "VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?)";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
			try {
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
		}
		
		return result;
	}
	
	// 게시판 목록에서 제목클릭시 해당하는 내용을 보여주시 위해
	// 데이터를 얻는 기능의 메소드
	
	public BoardDTO getContent(int boardID) {
		
		upHit(boardID); // 조회수를 증가
		
		BoardDTO dto = null;
		String query = "SELECT * FROM BOARD WHERE BOARD_ID = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardID = rs.getInt("BOARD_ID");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				Timestamp boardDate = rs.getTimestamp("BOARD_DATE");
				int hit = rs.getInt("HIT");
				
				dto = new BoardDTO(boardID, writer, title, content, boardDate, hit);
				
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
	
	// 조회수 증가시켜주는 기능
	private void upHit(int boardID) {
		
		String query = "UPDATE BOARD SET HIT = HIT + 1 WHERE BOARD_ID = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardID);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				
			}catch(Exception e2) {}
			
			
		}
		
	}
	
	// 글 수정해주는 기능
	// 제목 / 내용
	public int boardUpdate(BoardDTO dto) {
		int result = 0;
		
		String query = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE BOARD_ID = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getBoardID());
			
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
	
	// 글을 삭제해주는 기능
	public int boardDelete(int boardID) {
		
		int result = 0;
		
		String query = "DELETE FROM BOARD WHERE BOARD_ID = ?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardID);
			
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





