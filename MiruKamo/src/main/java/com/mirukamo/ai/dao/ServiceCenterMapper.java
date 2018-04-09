package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.mirukamo_question;

public interface ServiceCenterMapper {
	
	//공지 사항 출력 
	public ArrayList<mirukamo_question> getboardinfo();

	//공지 사항 게시물 출력 
	public ArrayList<mirukamo_question> adminNotice(int num);

	
}