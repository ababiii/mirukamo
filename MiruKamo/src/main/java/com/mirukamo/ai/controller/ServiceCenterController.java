package com.mirukamo.ai.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mirukamo.ai.dao.ServiceCenterDao;
import com.mirukamo.ai.vo.mirukamo_question;
import com.mirukamo.ai.vo.mirukamo_reviews;


//고객센터
@Controller
public class ServiceCenterController {

	@Autowired
	ServiceCenterDao servicecenterdao;

	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);

	// 공지 사항
	@RequestMapping(value = "/servicecenter", method = RequestMethod.GET)
	public String servicecenter(Locale locale, Model model) {
		logger.debug("공지 사항 시작");
		// 퀘스천 테이블
		ArrayList<mirukamo_question> question = servicecenterdao.boardinfo();
		logger.debug("DB거쳐서 다시 컨트롤러 옴" + question);

		model.addAttribute("question", question);

		// 퀘스천 테이블
		ArrayList<mirukamo_reviews> reviews = servicecenterdao.mirukamo_reviews();
		logger.debug("DB거쳐서 다시 컨트롤러 옴" + reviews);

		model.addAttribute("reviews", reviews);

		return "board/servicecenter";
	}

	// 공지사항 글 읽기
	@RequestMapping(value = "/adminNotice", method = RequestMethod.GET)
	public String adminNotice(Locale locale, Model model, int num) {
		logger.debug("공지 사항 글 읽기 시작 // 글 넘버 : " + num);

		ArrayList<mirukamo_question> adminNotice = servicecenterdao.adminNotice(num);

		logger.debug("DB거쳐서 다시 컨트롤러 옴" + adminNotice);

		model.addAttribute("adminNotice", adminNotice);

		return "board/adminNotice";
	}

	// 자주 묻는 질문 QnA
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String QNA(Locale locale, Model model, int num) {
		logger.debug("큐앤에이 글 읽기 시작 // 글 넘버 : " + num);

		ArrayList<mirukamo_question> qna = servicecenterdao.adminNotice(num);

		logger.debug("QNA" + qna);

		model.addAttribute("qna", qna);

		return "board/qna";
	}

	// 수강후기 글  전체 출력
	@RequestMapping(value = "/reviews", method = RequestMethod.GET)
	public String reviews(Locale locale, Model model, int num) {
		logger.debug("수강후기 글 읽기 시작 // 글 넘버 : " + num);
		//조회수 증가
		servicecenterdao.hits(num);
		
		//글 읽기
		ArrayList<mirukamo_reviews> reviews = servicecenterdao.reviews(num);
		
		model.addAttribute("reviews", reviews);
		return "board/reviews";
	}

	// 수강후기 글 읽기
	@RequestMapping(value = "/writereviews", method = RequestMethod.GET)
	public String writereviewsGET(Locale locale, Model model) {
		logger.debug("수강후기 글 작성 시작 GET ");
		
		
		return "writeboard/writereviews";
	}

	// 수강후기 글 작성
	@RequestMapping(value = "/writereviews", method = RequestMethod.POST)
	public String writereviewsPSOT(Locale locale, Model model,mirukamo_reviews reviews) {
		logger.debug("수강후기 글 DB저장 시작 POST" + reviews);
		
		servicecenterdao.writereviews(reviews);
		
		return "redirect:servicecenter";
	}
}