package com.mirukamo.ai.vo;

public class Mirukamo_answer {
	int num;
	int q_num;
	String content;
	String answer_date;
	
	
	
	public Mirukamo_answer() {
		super();
	}
	public Mirukamo_answer(int num, int q_num, String content, String answer_date) {
		super();
		this.num = num;
		this.q_num = q_num;
		this.content = content;
		this.answer_date = answer_date;
	}
	@Override
	public String toString() {
		return "Mirukamo_answer [num=" + num + ", q_num=" + q_num + ", content=" + content + ", answer_date="
				+ answer_date + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	
	
	
}
