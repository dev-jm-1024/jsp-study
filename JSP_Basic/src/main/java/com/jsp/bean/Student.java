package com.jsp.bean;

public class Student {

	
//	자바빈 규약
//	1. 빈이 패키지화 되어 있어야한다ㅏ
//	 (default package가 아닌 지정된 패키지에 저장되어 있어야한다)
//	 
//	 2. 기본 생성자를 반드시 가지고 있어야한다
//	 (getter / setter로 필드값을 할당할 목적으로 만들어졌으므로 기본 생성자를 가지고 있어야한다)
//	 3. 멤버 변수의 접근자는 private으로 선언한다
//	 4. 멤버 변수에 접근하기 위한 public 접근자인 getter / setter 메소드가 존재해야한다
	
	private int studentID;
	private String name;
	private int age;
	private String major;

	public Student() {
		
	}

	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	
	


}
