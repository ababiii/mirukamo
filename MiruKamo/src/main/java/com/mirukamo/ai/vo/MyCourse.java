package com.mirukamo.ai.vo;

public class MyCourse {

	int	num;
	String packagename;
	String member_id;
	String teacher;
	String languages;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPackagename() {
		return packagename;
	}
	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	@Override
	public String toString() {
		return "MyCourse [num=" + num + ", packagename=" + packagename + ", member_id=" + member_id + ", teacher="
				+ teacher + ", languages=" + languages + "]";
	}
	public MyCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyCourse(int num, String packagename, String member_id, String teacher, String languages) {
		super();
		this.num = num;
		this.packagename = packagename;
		this.member_id = member_id;
		this.teacher = teacher;
		this.languages = languages;
	}
	
}
