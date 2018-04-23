package com.mirukamo.ai.vo;

public class Mirukamo_course {
	private int num;
	private String title;
	private String teacher;
	private String languages;
	private String file_name;
	private String thumnail;
	
	public Mirukamo_course() {
		super();
	}

	public Mirukamo_course(int num, String title, String teacher, String languages, String file_name, String thumnail) {
		super();
		this.num = num;
		this.title = title;
		this.teacher = teacher;
		this.languages = languages;
		this.file_name = file_name;
		this.thumnail = thumnail;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	@Override
	public String toString() {
		return "Mirukamo_course [num=" + num + ", title=" + title + ", teacher=" + teacher + ", languages=" + languages
				+ ", file_name=" + file_name + ", thumnail=" + thumnail + "]";
	}
	
	

}
