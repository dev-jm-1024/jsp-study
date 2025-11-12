package com.myBoard;

import java.sql.Timestamp;

public class MyBoardData 
{
	private int boardID;
	private String writer;
	private String title;
	private String content;
	private Timestamp boardDate;
	private int hit;
	
	public MyBoardData() {
		
	}
	
	public MyBoardData(int boardID, String writer, String title, String content, Timestamp boardDate, int hit)
	{
		super();
		this.boardID = boardID;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.boardDate = boardDate;
		this.hit = hit;
	}

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	

}
