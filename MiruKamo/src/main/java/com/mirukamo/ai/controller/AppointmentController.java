package com.mirukamo.ai.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.text.Transliterator;
import com.mirukamo.ai.dao.AppointmentDAO;
import com.mirukamo.ai.dao.DrillDao;
import com.mirukamo.ai.vo.MyCourse;
import com.mirukamo.ai.vo.Users;
import com.mirukamo.ai.vo.Mirukamo_drill;

@Controller
public class AppointmentController {

	private static final Logger logger = LoggerFactory.getLogger(AppointmentController.class);

	@Autowired
	AppointmentDAO appointmentDAO;
	@Autowired
	DrillDao drilldao;
	
	// 틀린단어들만 넣을 배열
		String noun[] = new String[5];
		int nounnum = 0;
		String qqq[][] = new String[5][5];

	@RequestMapping(value = "appointment", method = RequestMethod.GET)
	public String appointment(Model model, boolean error) {
		logger.debug(error + "");
		if (error == true) {
			model.addAttribute("error", true);
		}

		return "test/joinTest";
	}

	@RequestMapping(value = "findMyID", method = RequestMethod.GET)
	public String findMyID() {
		return "users/findMyID";
	}

	@ResponseBody
	@RequestMapping(value = "findMyID", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String findMyID(Users users) {
		ArrayList<Users> list = appointmentDAO.findMyID(users);
		if (list.isEmpty()) {
			return "회원정보가 일치하는 ID가 존재하지 않습니다.";
		}
		logger.debug(list.get(0).getId());
		System.out.println(list.get(0).getId());
		return "회원님의 ID는 "+list.get(0).getId()+"입니다.";

	}

	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userId");
		ArrayList<MyCourse> list = appointmentDAO.getMyCourse(id);

		model.addAttribute("list", list);

		// ---------------------------------송수근----

		ArrayList<Mirukamo_drill> rank = new ArrayList<Mirukamo_drill>();

		rank = drilldao.getrank();

		model.addAttribute("rank", rank);

		return "users/myPage";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="getTumori",method=RequestMethod.POST) public void
	 * getTumori(String userId){ logger.debug(userId); }
	 */

	// 인강 시청 페이지로 이동
	@RequestMapping(value = "watching", method = RequestMethod.GET)
	public String watching() {
		return "board/watching";
	}

	// 개인정보 수정 페이지로 이동
	@RequestMapping(value = "myUpdate", method = RequestMethod.GET)
	public String myUpdate(HttpSession session, Model model) {
		Users result = appointmentDAO.getMyInfo((String) session.getAttribute("userId"));
		model.addAttribute("info", result);
		String [] phone=new String[3];
		phone=result.getPhone().split("-");
		model.addAttribute("phone", phone);
		return "myUpdate";
	}

	// 개인정보 수정
	@RequestMapping(value = "myUpdate", method = RequestMethod.POST)
	public String myUpdate(HttpSession session, Model model, Users user,String phone1,String phone2,String phone3) {
		Users moto = appointmentDAO.getMyInfo((String) session.getAttribute("userId"));
		String [] phone=new String[3];
		phone=moto.getPhone().split("-");
		/*if (user.getBirth().isEmpty()) {
			user.setBirth(moto.getBirth());
		}*/
		if (user.getPassword().isEmpty()) {
			user.setPassword(moto.getPassword());
		}
		if(phone2.isEmpty()){
			phone2=phone[1];
		}
		if(phone3.isEmpty()){
			phone3=phone[2];
		}
		String newPhone=phone1+"-"+phone2+"-"+phone3;
		user.setPhone(newPhone);
		user.setId((String)session.getAttribute("userId"));
		appointmentDAO.setMyInfo(user);
		Users result = appointmentDAO.getMyInfo((String) session.getAttribute("userId"));
		model.addAttribute("info", result);
		model.addAttribute("result", true);
		phone=result.getPhone().split("-");
		model.addAttribute("phone", phone);
		return "myUpdate";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String loginTest(String errorMsg,Model model){
		model.addAttribute("errorMsg",errorMsg);
		return "test/loginTest";
	}
	
	@RequestMapping(value="courseView",method=RequestMethod.GET)
	public String courseTest(String fail,Model model){
		if(fail!=null){
			if(fail.equals("already")){
			model.addAttribute("fail", "already");
			}else if(fail.equals("notCourse")){
				model.addAttribute("fail", "notCourse");
			}
			
		}
		return "test/courseTest";
	}
	
	@RequestMapping(value="test3",method=RequestMethod.GET)
	public String joinTest(){
		return "test/join2";
	}
	
	@RequestMapping(value="myCourseView",method=RequestMethod.GET)
	public String myCourseView(HttpSession session,Model model){
		
		String id = (String) session.getAttribute("userId");
		ArrayList<MyCourse> list = appointmentDAO.getMyCourse(id);

		model.addAttribute("list", list);
		
		return "myCourse";
	}
	
	@RequestMapping(value="mirukamoDrill",method=RequestMethod.GET)
	public String mirukamoDrill(Model model,HttpSession session,Locale locale){
		
		ArrayList<Mirukamo_drill> rank = new ArrayList<Mirukamo_drill>();

		rank = drilldao.getrank();

		model.addAttribute("rank", rank);
		
		//DrillController의 /drill에서 가져옴
		
		// 디비다녀와서 중복되는 값 없이 num,orijinal word 가져오기 -> getDrill

				String userId = (String) session.getAttribute("userId");
				ArrayList<Mirukamo_drill> getDrill = drilldao.getword(userId);
				
				if(getDrill.size()<5){
					return "test/drillTest";
				}
				
				// 섞기
				// Collections.shuffle(getDrill);

				// 5개만 뽑고 shuffle 이용
				for (int i = 0; i <= 4; i++) {
					noun[i] = getDrill.get(i).getOriginal_word();
					System.out.println("문제" + i + "번쨰  :  " + noun[i]);
				}
				ArrayList<Mirukamo_drill> word = new ArrayList<Mirukamo_drill>();
				word = drilldao.word();
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				String formattedDate = dateFormat.format(date);
				Tokenizer tokenizer = Tokenizer.builder().build();

				List<Token> tokens = null;
				// 단어 5개 토큰 삽입
				for (int i = 0; i <= 4; i++) {
					tokens = tokenizer.tokenize(getDrill.get(i).getOriginal_word());
					for (Token token : tokens) {
						if (token.getPartOfSpeech().startsWith("名詞") == true) {
							// 명사 넣기 qqq
							qqq[i][0] = token.getReading();
							// 첫 명사
							String omg = null;
							// 만약 한 문장에 명사가 두개일때??
							String OMG = null;
							// 명사가 2개일경우 앞에꺼 지우고 두번쨰꺼 넣기
							if (noun[i] != null) {
								noun[i] = getDrill.get(i).getOriginal_word();
								OMG = noun[i].replaceAll(token.getSurfaceForm(), "[ " + token.getSurfaceForm() + " ]");
								noun[i] = OMG;
							} else {
								omg = noun[i].replaceAll(token.getSurfaceForm(), "[ " + token.getSurfaceForm() + " ]");
								noun[i] = omg;
							}
						}
					}
					nounnum++;
				}
				// 카타카나 -> 히라가나로 바꾸끼
				for (int j = 0; j < qqq.length; j++) {
					Transliterator transliterator = Transliterator.getInstance("Katakana-Hiragana");
					String result = transliterator.transliterate(qqq[j][0]);
					qqq[j][0] = result;
					System.out.println("이중배열 정답" + qqq[j][0]);
				}
				// 히라가나 -> 로마자
				for (int j = 0; j < qqq.length; j++) {
					Transliterator transliterator = Transliterator.getInstance("Hiragana-Latin");
					String result = transliterator.transliterate(qqq[j][0]);
					qqq[j][0] = result;
					System.out.println(result);
				}
				// 문제 배열로 보내기
				session.setAttribute("noun", noun);
				{
					String kou[] = { "a", "i", "u", "e", "o" };
					int c = 0;
					for (int i = 0; i <= 4; i++) {
						if (((Math.random() * 2) + 1) > 0) {
							if (qqq[i][0].contains("a")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("a")) {
										qqq[i][c] = qqq[i][0].replaceFirst("a", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("i")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("i")) {
										qqq[i][c] = qqq[i][0].replaceFirst("i", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("u")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("u")) {
										qqq[i][c] = qqq[i][0].replaceFirst("u", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("e")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("e")) {
										qqq[i][c] = qqq[i][0].replaceFirst("e", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("o")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("o")) {
										qqq[i][c] = qqq[i][0].replaceFirst("o", s);
										c++;
									}
								}
							}
						} else {
							if (qqq[i][0].contains("a")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("a")) {
										qqq[i][c] = qqq[i][0].replaceFirst("a", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("i")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("i")) {
										qqq[i][c] = qqq[i][0].replaceFirst("i", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("u")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("u")) {
										qqq[i][c] = qqq[i][0].replaceFirst("u", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("e")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("e")) {
										qqq[i][c] = qqq[i][0].replaceFirst("e", s);
										c++;
									}
								}
							} else if (qqq[i][0].contains("o")) {
								c = 1;
								for (String s : kou) {
									if (!s.equals("o")) {
										qqq[i][c] = qqq[i][0].replaceFirst("o", s);
										c++;
									}
								}
							}
						}
					}
				}
				for (int j = 0; j < qqq.length; j++) {
					System.out.println("eeeeeeeeeee" + noun[j]);
					System.out.println("&&&&&&&&&&&&&&&&&" + qqq[j][0]);
				}
				for (int i = 0; i < 5; i++) {
					for (int j = 1; j < 5; j++) {
						System.out.println("주목 :" + qqq[i][j]);
					}
				}

				// 배열통째로 보내기
				session.setAttribute("qqq", qqq);
				String qqq2[][] = new String[5][5];

				for (int i = 0; i < qqq.length; i++) {

					for (int j = 0; j < qqq[i].length; j++) {
						qqq2[i][j] = qqq[i][j];
					}
				}

				for (int i = 0; i < qqq2.length; i++) {
					int seed;
					String temp;
					for (int j = 0; j < qqq2[i].length; j++) {
						seed = (int) (Math.random() * 4) + 1;
						temp = qqq2[i][j];
						qqq2[i][j] = qqq2[i][seed];
						qqq2[i][seed] = temp;
					}
				}

				model.addAttribute("questions", qqq2);
		return "test/drillTest";
	}
	
	
	@RequestMapping(value="mirukamoMyUpdate",method=RequestMethod.GET)
	public String mirukamoUpdate(){
		return "myUpdate";
	}
	
	@RequestMapping(value="mirukamo_find",method=RequestMethod.GET)
	public String mirukamo_find(){
		return "test/idFind";
	}
	
	@RequestMapping(value="mirukamo_pw_find",method=RequestMethod.GET)
	public String mirukamo_pw_find(){
		return "test/pwFind";
	}
	
	@RequestMapping(value="re_pw",method=RequestMethod.POST)
	public String re_pw(Model model,Users user){
		System.out.println(user);
		model.addAttribute("based", user);
		return "users/reset_pw_form";
	}
	
}
