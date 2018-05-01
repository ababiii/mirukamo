package com.mirukamo.ai.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mirukamo.ai.dao.ServiceCenterDao;
import com.mirukamo.ai.vo.Mirukamo_answer;
import com.mirukamo.ai.vo.PageNavigator;
import com.mirukamo.ai.vo.mirukamo_question;
import com.mirukamo.ai.vo.mirukamo_reviews;

//고객센터
@Controller
public class ServiceCenterController {

	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);

	// 게시판 관련 상수값들
	final int countPerPage = 8; // 페이지 당 글 수
	final int pagePerGroup = 8; // 페이지 이동 그룹 당 표시할 페이지 수

	@Autowired
	ServiceCenterDao servicecenterdao;

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

		// 공지사항 페이징---------------------------------------------------
		int howboardadmin = 0;
		howboardadmin = servicecenterdao.howboardadmin();
		model.addAttribute("attributeValues", howboardadmin);
		int totaladmin = howboardadmin; // 전체 글 개수
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, adminpage, totaladmin);
		ArrayList<mirukamo_question> adminboardlist = servicecenterdao.adminlistreviewsBoard(searchText,
				navi1.getStartRecord(), navi1.getCountPerPage());
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("navi1", navi1);
		model.addAttribute("adminboardlist", adminboardlist);
		// ------------------------------------------------------------------
		int howboardqna = 0;
		howboardqna = servicecenterdao.howboardqna();
		System.out.println("큐엔에이" + howboardqna);
		int totalqna = howboardqna;
		// qna 게시물 수 가져오기
		model.addAttribute("howboardqna", howboardqna);

		// 페이지 계산을 위한 객체 생성
		PageNavigator navi2 = new PageNavigator(countPerPage, pagePerGroup, qnapage, totalqna);
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("navi2", navi2);
		ArrayList<mirukamo_question> mirukamo_qna = servicecenterdao.qnalistreviewsBoard(searchText,
				navi2.getStartRecord(), navi2.getCountPerPage());
		model.addAttribute("qnaboardlist", mirukamo_qna);

		for (int i = 0; i < mirukamo_qna.size(); i++) {
			System.out.println("시스아웃 겟 타이토르" + mirukamo_qna.get(i).getTitle());
		}

		return "board/servicecenter";
	}

	// 공지 사항
	@RequestMapping(value = "/reviewsservicecenter", method = RequestMethod.GET)
	public String servicecenter(Locale locale, Model model, @RequestParam(value = "page", defaultValue = "1") int page, // 리뷰
			@RequestParam(value = "searchText", defaultValue = "") String searchText) {

		// 게시판 관련 상수값들
		final int countPerPage = 10; // 페이지 당 글 수
		final int pagePerGroup = 10; // 페이지 이동 그룹 당 표시할 페이지 수

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

		// 리뷰
		// 페이징------------------------------------------------------------------
		int total = howboardreview; // 전체 글 개수
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi0 = new PageNavigator(countPerPage, pagePerGroup, page, total);
		// 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<mirukamo_reviews> reviewsboardlist = servicecenterdao.listreviewsBoard(searchText,
				navi0.getStartRecord(), navi0.getCountPerPage());
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("reviewpaging", reviewsboardlist);
		model.addAttribute("navi0", navi0);

		return "board/customerReviews";
	}

	// 수강 후기 게시판
	@RequestMapping(value = "/customerReviews", method = RequestMethod.GET)
	public String customerReviews(Locale locale, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page, // 리뷰
			@RequestParam(value = "searchText", defaultValue = "") String searchText) {
		System.out.println("----독립 수강후기 jsp----");
		// 수강후기 테이블
		ArrayList<mirukamo_reviews> reviews = servicecenterdao.mirukamo_reviews();
		model.addAttribute("reviews", reviews);

		// 수강후기 게시물 수 가져오기
		int howboardreview = 0;
		howboardreview = servicecenterdao.howboardreview();
		System.out.println("수강 후기" + howboardreview);
		model.addAttribute("howboardreview", howboardreview);

		// 리뷰
		int total = howboardreview; // 전체 글 개수
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi0 = new PageNavigator(countPerPage, pagePerGroup, page, total);
		// 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<mirukamo_reviews> reviewsboardlist = servicecenterdao.listreviewsBoard(searchText,
				navi0.getStartRecord(), navi0.getCountPerPage());
		// 페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("reviewpaging", reviewsboardlist);
		model.addAttribute("navi0", navi0);

		return "board/customerReviews";
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

	// ------------------------------------------------------
	// 운영자admin 공지사항 글 작성
	@RequestMapping(value = "/writenotice", method = RequestMethod.GET)
	public String writenotice(Locale locale, Model model, int category) {
		logger.debug("공지 사항 글 저장 시작 // 글 넘버 : " + category);

		model.addAttribute("category", category);

		return "board/writenotice";
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

	// 공지사항 및 qna 글 작성
	@RequestMapping(value = "/writequestion", method = RequestMethod.POST)
	public String writequestion(Locale locale, Model model, mirukamo_question ques) {
		logger.debug("@@공지사항 및 qna 글 작성" + ques.toString());
		servicecenterdao.insertQuestion(ques);
		return "redirect:servicecenter";
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
/*<<<<<<< HEAD
	//1:1문의 등록
	@RequestMapping(value = "/writeadvice", method = RequestMethod.GET)
	public String writeadvice() {
			
		return "writeboard/advicejsp";
	}
	@RequestMapping(value = "/writeadvice", method = RequestMethod.POST)
	public String writeadvice(mirukamo_question qs) {
		qs.setCategory(1);
		int i=servicecenterdao.insertQuestion(qs);
		
		return "writeboard/advicejsp";
	}
	////////////////////
	//1:1문의 리스트 관리자 시점
		@RequestMapping(value = "/advicelist", method = RequestMethod.GET)
		public String advicelist(Model m,@RequestParam(value = "page", defaultValue = "1") int page) {
			int total = 0;
			total = servicecenterdao.totalQuestion();
			PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, page, total);
			m.addAttribute("navi1", navi1);
			ArrayList<mirukamo_question> list=servicecenterdao.selectQuestion(
					navi1.getStartRecord(), navi1.getCountPerPage());
			m.addAttribute("list",list);
			return "writeboard/advicelist";
=======*/

	// 1:1문의 등록
	@RequestMapping(value = "writeadvice", method = RequestMethod.GET)
	public String writeadvice(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userId");
		if (id == null || id.isEmpty() || id.equals("")) {
			System.out.println("아이디없다!");
			return "redirect:servicecenter";
		}
		return "writeboard/advicejsp";
	}

	// 1대1문의 테이블 작성
	@RequestMapping(value = "/writeadvice", method = RequestMethod.POST)
	public String writeadvice(String category, mirukamo_question qs, HttpSession session, Model model) {
		System.out.println("글 저장 입성11" + category);

		qs.setCategory(1);
		System.out.println("글 저장 입성" + qs.toString());

		servicecenterdao.insertQuestion(qs);

		return "redirect:myadvicelist";
	}

	////////////////////
	// 1:1문의 리스트 관리자 시점
	@RequestMapping(value = "/advicelist", method = RequestMethod.GET)
	public String advicelist(Model m, @RequestParam(value = "page", defaultValue = "1") int page) {
		int total = 0;
		System.out.println("1:1문의 리스트 관리자 시점 시작");
		total = servicecenterdao.totalQuestion();
		PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, page, total);
		m.addAttribute("navi1", navi1);
		ArrayList<mirukamo_question> list = servicecenterdao.selectQuestion(navi1.getStartRecord(),
				navi1.getCountPerPage());
		m.addAttribute("list", list);
		return "writeboard/advicelist";
	}

	// 1:1문의 답변 작성 관리자 시점
	@RequestMapping(value = "/replyadvice", method = RequestMethod.GET)
	public String replyadvice(int num, Model m) {
		ArrayList<mirukamo_question> a = servicecenterdao.adminNotice(num);
		m.addAttribute("copy", a.get(0));
		return "writeboard/advicereply";
	}

	// 1:1문의 답변 전송 관리자 시점
	@RequestMapping(value = "/replyadvice", method = RequestMethod.POST)
	public String replyadvice(Mirukamo_answer ans) {
		int a = servicecenterdao.insertAnswer(ans);
		int b = servicecenterdao.updateReply(ans.getQ_num());

		System.out.println(" a 는  : " + a + " // b 는 : " + b);

		return "redirect:advicelist";
	}

	// 1:1문의 리스트 유저 시점
	@RequestMapping(value = "/myadvicelist", method = RequestMethod.GET)
	public String myadvicelist(Model m, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		String id = (String) session.getAttribute("userId");
		if (id == null || id.isEmpty() || id.equals("")) {
			System.out.println("아이디없다!");
			return "redirect:servicecenter";
		}
		// 나의 문의 내역확인
		int total = 0;
		mirukamo_question qs = new mirukamo_question();
		qs.setMember_id((String) session.getAttribute("userId"));
		total = servicecenterdao.totalMyQuestion(qs);
		PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, page, total);
		m.addAttribute("navi1", navi1);
		ArrayList<mirukamo_question> list = servicecenterdao.selectMyQuestion(qs, navi1.getStartRecord(),
				navi1.getCountPerPage());
		m.addAttribute("list", list);

		return "writeboard/myadvicelist";
	}

	// 1:1문의 답변 보기 유저시점
	@RequestMapping(value = "/myadvicereply", method = RequestMethod.GET)
	public String myadvicereply(int num, Model m) {
		ArrayList<mirukamo_question> a = servicecenterdao.adminNotice(num);
		m.addAttribute("copy", a.get(0));

		ArrayList<Mirukamo_answer> b = servicecenterdao.selectReply(num);
		m.addAttribute("reply", b);

		return "writeboard/myadvicereply";
	}

}