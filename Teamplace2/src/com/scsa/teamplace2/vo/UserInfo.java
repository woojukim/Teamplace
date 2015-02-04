package com.scsa.teamplace2.vo;

public class UserInfo {

	private String useremail;
	private String usernickname;
	private String userpassword;
	
	public UserInfo(){

	}

	public UserInfo(String useremail, String usernickname, String userpassword) {
		super();
		this.useremail = useremail;
		this.usernickname = usernickname;
		this.userpassword = userpassword;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsernickname() {
		return usernickname;
	}

	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	@Override
	public String toString() {
		return "UserInfo [useremail=" + useremail + ", usernickname="
				+ usernickname + ", userpassword=" + userpassword + "]";
	}

}