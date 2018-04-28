package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.mirukamo_question;
import com.mirukamo.ai.vo.mirukamo_reviews;


public interface ServiceCenterMapper {
	
	//공지 사항 출력 
	public ArrayList<mirukamo_question> getboardinfo();

	//공지 사항 게시물 출력 
	public ArrayList<mirukamo_question> adminNotice(int num);
	
	//리뷰 출력
	public ArrayList<mirukamo_reviews> reviews();
	
	//리뷰 게시물 가져오기
	public ArrayList<mirukamo_reviews> getreviews(int num);
	
	//수강후기 db저장
	public void writereviews(mirukamo_reviews reviews);
	
	//수강후기 조회수 증가
	public void reviewshits(int num);

	public int insertQustion(mirukamo_question qs);
}