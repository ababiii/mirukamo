package com.mirukamo.ai.vo;

public class mirukamo_drill {

	int num;
	String member_id;
	String original_word; // 인간 선생님이 말한 문장
	String word;// 사용자가 발음한 문장

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

	public String getOriginal_word() {
		return original_word;
	}

	public void setOriginal_word(String original_word) {
		this.original_word = original_word;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "mirukamo_drill [num=" + num + ", member_id=" + member_id + ", original_word=" + original_word
				+ ", word=" + word + "]";
	}

	public mirukamo_drill() {
		super();
		// TODO Auto-generated constructor stub
	}

	public mirukamo_drill(int num, String member_id, String original_word, String word) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.original_word = original_word;
		this.word = word;
	}

}
