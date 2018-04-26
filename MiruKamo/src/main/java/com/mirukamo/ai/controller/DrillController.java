package com.mirukamo.ai.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.ibm.icu.text.Transliterator;
import com.mirukamo.ai.dao.DrillDao;
import com.mirukamo.ai.vo.mirukamo_drill;

@Controller
public class DrillController {

	private static final Logger logger = LoggerFactory.getLogger(DrillController.class);

	@Autowired
	DrillDao drilldao;

	// 틀린단어들만 넣을 배열
	String noun[] = new String[5];
	int nounnum = 0;
	String qqq[][] = new String[5][5];

	// 공지사항 글 읽기
	@RequestMapping(value = "/drill", method = RequestMethod.GET)
	public String drilljsp(Locale locale, Model model, HttpSession session, HttpServletResponse response) {
		logger.debug("드릴 jsp 이동");
		// 디비다녀와서 중복되는 값 없이 num,orijinal word 가져오기 -> getDrill

		String userId = (String) session.getAttribute("userId");
		ArrayList<mirukamo_drill> getDrill = drilldao.getword(userId);

		// 섞기
		// Collections.shuffle(getDrill);

		// 5개만 뽑고 shuffle 이용
		for (int i = 0; i <= 4; i++) {
			noun[i] = getDrill.get(i).getOriginal_word();
			System.out.println("문제" + i + "번쨰  :  " + noun[i]);
		}

		ArrayList<mirukamo_drill> word = new ArrayList<mirukamo_drill>();
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
		return "drill/Testdrill";
	}

	@ResponseBody
	@RequestMapping(value = "lastcheck", method = RequestMethod.POST)
	public String lastcheck(Locale locale, Model model,String[] array,HttpSession session) {
		System.out.println("퍽킹에이젝스 성공~");
		for (int i = 0; i < 5; i++) {
			System.out.println("사용자 아타리" + array[i]);
		}
		
		String atariarray[] = new String[5];
		int atari = 0;
		
		for (int i = 0; i < 5; i++) {
			atariarray[i] = ((String[][]) session.getAttribute("qqq"))[i][0];
			System.out.println("아타리 코타에 마토메"+atariarray[i]);
		}
		
		for (int i = 0; i < 5; i++) {
			if (atariarray[i].equals( array[i])) {
				atari = atari+1;
			}
		}
		
		String asd[] = new String[5];
		
		for (int i = 0; i < 5; i++) {			
			if (array[i].equals(atariarray[i])) {
				asd[i] = atariarray[i];
				System.out.println("##"+asd[i]);
			}
		}
		System.out.println("##"+asd);
		
		return new Gson().toJson(asd)	;
	}
}
