package com.Hugh.entity;

public class StdEntity {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String userNum;
	private String userName;
	private String sex;
	private String born;
	private String grade;
	private String prof;
	private String face;
	private int phone;
	private String email;
	private String addr;

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBorn() {
		return born;
	}

	public void setBorn(String born) {
		this.born = born;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getProf() {
		return prof;
	}

	public void setProf(String prof) {
		this.prof = prof;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public StdEntity(String userNum, String userName, String sex, String born, String grade, String prof, String face,
			int phone, String email, String addr) {
		super();
		this.userNum = userNum;
		this.userName = userName;
		this.sex = sex;
		this.born = born;
		this.grade = grade;
		this.prof = prof;
		this.face = face;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
	}

	public StdEntity() {
	}
}
