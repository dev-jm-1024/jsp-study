package com.jsp.member;

import java.sql.Timestamp;

public class MemberDTO {
	
	// DTO : Data Transfer Object
	// 계층간 데이터 교환을 위한 자바빈즈
	
//	ID	VARCHAR2(50 BYTE)
//	PW	VARCHAR2(50 BYTE)
//	NAME	NVARCHAR2(50 CHAR)
//	EMAIL	VARCHAR2(100 BYTE)
//	ADDRESS	NVARCHAR2(100 CHAR)
//	REGDATE	TIMESTAMP(6)
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private Timestamp regDate;
	
	// 기본생성자
	public MemberDTO() {
		
	}
	
	// getter / setter 메소드
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}






