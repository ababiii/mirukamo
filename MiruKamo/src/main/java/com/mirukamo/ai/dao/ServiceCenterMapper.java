/*<<<<<<< HEAD
package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.mirukamo.ai.vo.Mirukamo_answer;
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

	public int insertQuestion(mirukamo_question qs);

	
	//공지사항 가져오기
	public int howboardadmin();

	//qna 게시물 수 가져오기
	public int howboardqna();
	
	//수강후기 게시물 수 가져오기
	public int howboardreview();
	
	//수강후기 게시물 페이징 가져오기
	public ArrayList<mirukamo_reviews> listreviewBoard(String searchText, RowBounds rb);
	
	//공지사항 게시물 페이징 가져오기
	public ArrayList<mirukamo_question> adminlistreviewsBoard(String searchText, RowBounds rb);
	//qna 페이징
	public ArrayList<mirukamo_question> qnalistreviewsBoard(String searchText, RowBounds rb);

	public ArrayList<mirukamo_question> selectQustion(RowBounds rb);

	public int totalQuestion();

	public int insertAnswer(Mirukamo_answer ans);

	
=======*/
package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.mirukamo.ai.vo.Mirukamo_answer;
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
	
	//qna , 공지사항 , 1대1 넣기 
	public void insertQuestion(mirukamo_question qs);

	//공지사항 가져오기
	public int howboardadmin();

	//qna 게시물 수 가져오기
	public int howboardqna();
	
	//수강후기 게시물 수 가져오기
	public int howboardreview();
	
	//수강후기 게시물 페이징 가져오기
	public ArrayList<mirukamo_reviews> listreviewBoard(String searchText, RowBounds rb);
	
	//공지사항 게시물 페이징 가져오기
	public ArrayList<mirukamo_question> adminlistreviewsBoard(String searchText, RowBounds rb);
	//qna 페이징
	public ArrayList<mirukamo_question> qnalistreviewsBoard(String searchText, RowBounds rb);

	public ArrayList<mirukamo_question> selectQuestion(RowBounds rb);

	public int totalQuestion();

	public int insertAnswer(Mirukamo_answer ans);

	public int updateReply(int q_num);

	public int totalMyQuestion(mirukamo_question qs);

	public ArrayList<mirukamo_question> selectMyQuestion(mirukamo_question qs, RowBounds rb);

	public ArrayList<Mirukamo_answer> selectReply(int num);

	

}