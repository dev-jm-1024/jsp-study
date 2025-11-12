package com.myBoard;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardMethod 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	public BoardMethod() {
		try {
			
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//로그인 체크
	public boolean loginCheck(String id, String pw)
	{
		boolean result = false;
		
		String sql="SELECT ID, PW FROM MYMEMBER WHERE ID=? AND PW=?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,  pw);
			rs = pstmt.executeQuery();
			
			System.out.println("DB연결 성공");
			
			
			if(rs.next()) {
			    result = true;
			    System.out.println("로그인 성공: 사용자 " + rs.getString("ID") + " 찾음");
			} else {
			    result = false;
			    System.out.println("로그인 실패: 사용자를 찾을 수 없음");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
		
		return result;
	}
	
	//회원가입
	public int join(String id, String pw, String name, String phone)
	{
		int result = 0;
		
		String sql = "INSERT INTO MYMEMBER (ID, PW, NAME, PHONE) VALUES (?, ?, ?, ?)";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,  pw);
			pstmt.setString(3,  name);
			pstmt.setString(4,  phone);
			
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2) {
				
			}
		}
		
		return result;
	}
	
	//회원정보 변경
	public int updateMemberInfo(String pw, String name, String phone, String id)
	{
		int result = 0;
		
		String sql ="UPDATE MYMEMBER SET PW = ?, NAME = ?, PHONE =? WHERE ID=?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3,  phone);
			pstmt.setString(4, id);
			
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		
		return result;
		
	}
	
	//회원 탈퇴
	public int deleteMember(String id)
	{	
		int result = 0;
		String sql = "DELETE FROM MYMEMBER WHERE ID = ?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2) {
				
			}
		}
		
		return result;
	}
	
	//회원의 정보 불러오기
	public String getPw(String id)
	{
		String pw ="";
		String sql = "SELECT PW FROM MYMEMBER WHERE ID=?";
		

		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			System.out.println("DB연결 성공");
			
			
			if(rs.next()) 
			{
			    pw = rs.getString("PW");
			} 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
		
		return pw;
	}
	
	//회원의 전화번호 불러오기
	public String getPhone(String id)
	{
		String phone ="";
		String sql = "SELECT PHONE FROM MYMEMBER WHERE ID=?";
		

		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			System.out.println("DB연결 성공");
			
			
			if(rs.next()) 
			{
			    phone = rs.getString("PHONE");
			} 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
		
		return phone;
	}
	
	//회원의 이름 가져오기
	public String getName(String id)
	{
		String name ="";
		String sql = "SELECT NAME FROM MYMEMBER WHERE ID=?";
		

		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			System.out.println("DB연결 성공");
			
			
			if(rs.next()) 
			{
			    name = rs.getString("NAME");
			} 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
		
		return name;
	}
	
	//글 목록 보여주기
	public List<MyBoardData> getContentList() {
	    List<MyBoardData> contentList = new ArrayList<>();
	    String sql = "SELECT * FROM MYBOARD ORDER BY BOARD_ID DESC";
	    
	    try 
	    {
	        conn = ds.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) 
	        {
	        	int boardID = rs.getInt("BOARD_ID");
	        	String writer = rs.getString("WRITER");
	        	String title = rs.getString("TITLE");
	        	String content = rs.getString("CONTENT");
	        	Timestamp boardDate = rs.getTimestamp("BOARD_DATE");
	        	int hit = rs.getInt("HIT");
	        	
	        	contentList.add(new MyBoardData(boardID, writer, title, content, boardDate, hit));
	        }
	    } 
	    catch(Exception e) 
	    {
	        e.printStackTrace();
	    } 
	    finally 
	    {
	        try 
	        {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	        } 
	        catch(Exception e2) 
	        {
	            e2.printStackTrace();
	        }
	    }
	    
	    return contentList;
	}
	
	// 조회수 증가시켜주는 기능
	public void upHit(int boardID) 
	{
		String query="UPDATE MYBOARD SET HIT = HIT + 1 WHERE BOARD_ID = ?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardID);
			pstmt.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	//내가 쓴 글 확인하기
	public List<MyBoardData> checkMyContent(int boardID, String name, int hit)
	{
		List<MyBoardData> myContent = new ArrayList<MyBoardData>();
		
		String sql = "SELECT * FROM MYBOARD WHERE WRITER = ?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  name);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				Timestamp date = rs.getTimestamp("BOARD_DATE");
				
				myContent.add(new MyBoardData(boardID, writer, title, content, date, hit));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null)rs.close();
				if(pstmt != null)rs.close();
				if(conn != null) conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		
		
		return myContent;
	}
	
	
	
	//MYBOARD 사이즈
	public int boardCnt()
	{
		int result = 0;
		String sql = "SELECT COUNT(BOARD_ID) as cnt FROM MYBOARD";
		

		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getInt("cnt");
			}
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2) {
				
			}
		}
		
		
		return result;
		
		
		
	}
	
	
	//글 작성하기
	public int writeContent(String writer, String title, String content, int hit)//로그인한 이름 받기
	{
		//글 작성: BOARD_ID, WRITER, TITLE, CONTENT 
		int result = 0;
		
		String sql = "INSERT INTO MYBOARD (BOARD_ID, WRITER, TITLE, CONTENT, HIT)"
				+ "VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, 0)";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  writer);
			pstmt.setString(2,  title);
			pstmt.setString(3, content);
			
			result = pstmt.executeUpdate();
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2) {
				
			}
		}
		
		
		return result;
	}
	
	//글 수정하기
	public int updateContent(String title, String content, int boardID)
	{
		int result = 0;
		String sql="UPDATE MYBOARD SET TITLE = ?, CONTENT = ? WHERE BOARD_ID = ?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  title);
			pstmt.setString(2,  content);
			pstmt.setInt(3, boardID);
			
			result = pstmt.executeUpdate();
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2) {
				
			}
		}
		
		
		return result;
	}
	
	//로그인한 이름을 얻는 메소드
	public String getLoginName(String id)
	{
		String result = "";
		
		String sql = "SELECT NAME FROM MYMEMBER WHERE ID=?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getString("NAME");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		return result;
	}
	
	
	//작성자 알려주는 메소드
	public String getWriter(int boardID)
	{
		String result = "";
		
		String sql = "SELECT WRITER FROM MYBOARD WHERE BOARD_ID=?";
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  boardID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getString("WRITER");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		return result;
	}
	
	
	//boardID로 게시물 조회
	public List<MyBoardData> searchBoard(int boardID)
	{
		
		int result = 0;
		String sql = "SELECT * FROM MYBOARD WHERE BOARD_ID = ?";
		List<MyBoardData> boardData = new ArrayList<>();
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  boardID);
			rs = pstmt.executeQuery();
			
			
			while(rs.next())
			{
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				Timestamp date = rs.getTimestamp("BOARD_DATE");
				int hit = rs.getInt("HIT");
				
				boardData.add(new MyBoardData(boardID, writer, title, content, date, hit));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		
		return boardData;
	}
	
	//글 삭제하기
	public int deleteContent(int boardID)
	{
		int result = 0;
		
		String sql="DELETE FROM MYBOARD WHERE BOARD_ID=?";
		
		
		try
		{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardID);
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}catch(Exception e2)
			{
				
			}
		}
		
		System.out.println("삭제완료");
		
		return result;
	}

}
