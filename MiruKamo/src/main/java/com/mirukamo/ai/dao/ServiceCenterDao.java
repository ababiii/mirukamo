package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.vo.mirukamo_question;
import com.mirukamo.ai.vo.mirukamo_reviews;

@Repository
public class ServiceCenterDao {

	@Autowired
	SqlSession sqlSession;

	// 공지 사항
	public ArrayList<mirukamo_question> boardinfo() {

		System.out.println("공지사항 출력 다오 접속");

		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		ArrayList<mirukamo_question> boardinfo = mapper.getboardinfo();
		return boardinfo;

	}

	// 공지 사항 게시물 읽기
	public ArrayList<mirukamo_question> adminNotice(int num) {

		System.out.println("공지사항 게시물 내용 출력 다오 접속");

		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		ArrayList<mirukamo_question> adminNotice = mapper.adminNotice(num);

		return adminNotice;
	}

	public ArrayList<mirukamo_reviews> mirukamo_reviews() {
		System.out.println("리뷰 게시물 가져오기");

		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		ArrayList<mirukamo_reviews> reviews = mapper.reviews();

		return reviews;
	}

	public ArrayList<mirukamo_reviews> reviews(int num) {
		System.out.println("수강후기 게시물 가져오기");

		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		ArrayList<mirukamo_reviews> reviews = mapper.getreviews(num);
		return reviews;
	}

	// 수강 후기 작성
	public void writereviews(mirukamo_reviews reviews) {

		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);

		mapper.writereviews(reviews);

	}

	// 조회수 증가
	public void hits(int num) {
		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		mapper.reviewshits(num);

	}

};
