package com.mirukamo.ai.vo;

public class MyCourse {
	int num;
	String member_id;
	int course_num;
	String start_day; 
	String end_day;
	String status;
	String title;
	String teacher;
	String languages;
	
	public MyCourse() {
		super();
	}
	
	public MyCourse(String member_id, int course_num) {
		super();
		this.member_id = member_id;
		this.course_num = course_num;
	}



	public MyCourse(int num, String member_id, int course_num, String start_day, String end_day, String status) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.course_num = course_num;
		this.start_day = start_day;
		this.end_day = end_day;
		this.status = status;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCourse_num() {
		return course_num;
	}
	public void setCourse_num(int course_num) {
		this.course_num = course_num;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "MyCourse [num=" + num + ", member_id=" + member_id + ", course_num=" + course_num + ", start_day="
				+ start_day + ", end_day=" + end_day + ", status=" + status + "]";
	}
	
	
}
