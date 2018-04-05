package com.mirukamo.ai.vo;

public class Users {
	
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userEmail2;
	private String userBirthday;
	private String userPhone;
	private String userAdmin;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String userId, String userPassword, String userName, String userEmail, String userEmail2,
			String userBirthday, String userPhone, String userAdmin) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userEmail2 = userEmail2;
		this.userBirthday = userBirthday;
		this.userPhone = userPhone;
		this.userAdmin = userAdmin;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(String userAdmin) {
		this.userAdmin = userAdmin;
	}
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userEmail2=" + userEmail2 + ", userBirthday=" + userBirthday + ", userPhone="
				+ userPhone + ", userAdmin=" + userAdmin + "]";
	}
	
	

}
