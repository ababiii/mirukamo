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
import org.springframework.web.bind.annotation.RequestParam;

import com.mirukamo.ai.dao.ServiceCenterDao;
import com.mirukamo.ai.vo.PageNavigator;
import com.mirukamo.ai.vo.mirukamo_question;
import com.mirukamo.ai.vo.mirukamo_reviews;

//고객센터
@Controller
public class ServiceCenterController {

	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);

	@Autowired
	ServiceCenterDao servicecenterdao;

	// 게시판 관련 상수값들
	final int countPerPage = 8; // 페이지 당 글 수
	final int pagePerGroup = 8; // 페이지 이동 그룹 당 표시할 페이지 수

	// 공지 사항
	@RequestMapping(value = "/servicecenter", method = RequestMethod.GET)
	public String servicecenter(Locale locale, Model model, @RequestParam(value = "page", defaultValue = "1") int page, // 리뷰
			@RequestParam(value = "adminpage", defaultValue = "1") int adminpage, // 공지
			@RequestParam(value = "qnapage", defaultValue = "1") int qnapage, // qna
			@RequestParam(value = "searchText", defaultValue = "") String searchText) {

		logger.debug("공지 사항 시작");
		// 퀘스천 테이블
		ArrayList<mirukamo_question> question = servicecenterdao.boardinfo();
		logger.debug("DB거쳐서 다시 컨트롤러 옴" + question);

		model.addAttribute("question", question);

		// 수강후기 테이블
		ArrayList<mirukamo_reviews> reviews = servicecenterdao.mirukamo_reviews();
		logger.debug("DB거쳐서 다시 컨트롤러 옴" + reviews);

		model.addAttribute("reviews", reviews);

		// 수강후기 게시물 수 가져오기
		int howboardreview = 0;
		howboardreview = servicecenterdao.howboardreview();
		System.out.println("수강 후기" + howboardreview);
		model.addAttribute("howboardreview", howboardreview);

		// 리뷰  페이징------------------------------------------------------------------
		int total = howboardreview; // 전체 글 개수
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi0 = new PageNavigator(countPerPage, pagePerGroup,page, total);
		//페이지당 글 수를 전달하여 목록 읽기
		ArrayList<mirukamo_reviews> reviewsboardlist = servicecenterdao.listreviewsBoard(searchText, navi0.getStartRecord(), navi0.getCountPerPage());	
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("reviewpaging", reviewsboardlist);
		model.addAttribute("navi0", navi0);
		//------------------------------------------------------------------
		// 공지사항 페이징---------------------------------------------------
		int howboardadmin = 0;
		howboardadmin = servicecenterdao.howboardadmin();
		int totaladmin = howboardadmin; // 전체 글 개수

		
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, adminpage, totaladmin);
		ArrayList<mirukamo_question> adminboardlist = servicecenterdao.adminlistreviewsBoard(searchText, navi1.getStartRecord(), navi1.getCountPerPage());	
		
		for (int i = 0; i < adminboardlist.size(); i++) {
			System.out.println(i+"번쨰   //  "+adminboardlist.get(i).getCategory());
		}
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("navi1", navi1);
		model.addAttribute("adminboardlist", adminboardlist);
		//------------------------------------------------------------------
		
		// qna 게시물 수 가져오기
		int howboardqna = 0;
		howboardqna = servicecenterdao.howboardqna();
		System.out.println("큐엔에이" + howboardqna);
		int totalqna = howboardqna;
		model.addAttribute("howboardqna", howboardqna);
		
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi2 = new PageNavigator(countPerPage, pagePerGroup, qnapage, totalqna);
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("navi2", navi2);

		
		model.addAttribute("howboardadmin", howboardadmin);
		
		


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

	// 수강후기 글 전체 출력
	@RequestMapping(value = "/reviews", method = RequestMethod.GET)
	public String reviews(Locale locale, Model model, int num) {
		logger.debug("수강후기 글 읽기 시작 // 글 넘버 : " + num);
		// 조회수 증가
		servicecenterdao.hits(num);

		// 글 읽기
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
	public String writereviewsPSOT(Locale locale, Model model, mirukamo_reviews reviews) {
		logger.debug("수강후기 글 DB저장 시작 POST" + reviews);

		servicecenterdao.writereviews(reviews);

		return "redirect:servicecenter";
	}
}