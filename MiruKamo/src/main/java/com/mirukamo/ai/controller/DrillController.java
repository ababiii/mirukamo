package com.mirukamo.ai.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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
	String qqq[] = new String[5];

	
	// 공지사항 글 읽기
	@RequestMapping(value = "/drill", method = RequestMethod.GET)
	public String drilljsp(Locale locale, Model model, HttpSession session, HttpServletResponse response) {
		logger.debug("드릴 jsp 이동");
		// 디비다녀와서 중복되는 값 없이 num,orijinal word 가져오기 -> getDrill
		ArrayList<mirukamo_drill> getDrill = drilldao.getword();

		// 섞기
		Collections.shuffle(getDrill);

		// 5개만 뽑고 shuffle 이용
		for (int i = 0; i <= 4; i++) {
			noun[i] = getDrill.get(i).getOriginal_word();
			System.out.println("문제" + i + "번쨰  :  " + noun[i]);
		}

		ArrayList<mirukamo_drill> word = new ArrayList<mirukamo_drill>();
		word = drilldao.word();
		System.out.println(";;;;;;;;"+word.toString());
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
					System.out.println("토큰 시작" + nounnum + "쨰 입니다");
					// 명사 넣기 qqq
					qqq[i] = token.getReading();
					// 첫 명사
					String omg = null;
					// 만약 한 문장에 명사가 두개일때??
					String OMG = null;
					System.out.println("꿰엑");
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
				
				
				/*
				// allFeatures tokenの全ての要素を出力
				System.out.println("allFeatures: " + token.getAllFeatures());

				// partOfSpeech 品詞など形態素上で意味のある言葉を出力
				// 名詞일떄 그부분 추출후 공백으로 스트링 삽입
				System.out.println("partOfSpeech: " + token.getPartOfSpeech());

				// startWith: 문자열이 지정한 문자로 시작하는지 판단 같으면 true반환 아니면 false를
				// 반환한다.(대소문자구별)
				// 명사이면서 처음 시작할떄 nounnum이 0인 경우

				// allFeatures tokenの全ての要素を出力
				System.out.println("allFeatures: " + token.getAllFeatures());
				// partOfSpeech 品詞など形態素上で意味のある言葉を出力
				System.out.println("partOfSpeech: " + token.getPartOfSpeech());
				// position 単語の位置を出力
				System.out.println("partOfSpeech: " + token.getPosition());
				// reading カナ読みを出力
				System.out.println("reading: " + token.getReading());
				// surfaceForm 元の単語を出力
				System.out.println("surfaceFrom: " + token.getSurfaceForm());
				// allFeaturesArray allFeaturesをArray型で返す
				System.out.println("allFeaturesArray" + token.getAllFeaturesArray());
				// isKnown 辞書にある言葉かどうか
				System.out.println("isKnown: " + token.isKnown());
				// isUnknown 辞書にない言葉かどうか、isKnownと反対の結果が出力される
				System.out.println("isUnKnown: " + token.isUnknown());
				// isUser ユーザーで定義した言葉かどうか
				System.out.println("User: " + token.isUser());
*/			}
			nounnum++;
		}

		//카타카나 -> 히라가나로 바꾸끼
		for (int j = 0; j < qqq.length; j++) {
			Transliterator transliterator =  Transliterator.getInstance("Katakana-Hiragana");
			String result = transliterator.transliterate(qqq[j]);
			qqq[j]=result;
			System.out.println("%%%%%%%%%%%%%%%%" + qqq[j]);
		}
		
		//히라가나 -> 로마자
		for (int j = 0; j < qqq.length; j++) {
			Transliterator transliterator = Transliterator.getInstance("Hiragana-Latin");
			String result = transliterator.transliterate(qqq[j]);
			qqq[j]=result;
			System.out.println(result);
		}
		
		
		for (int i = 0; i < noun.length; i++) {
			session.setAttribute("noun" + i, noun[i]);
			System.out.println("eeeeeeeeeee" + noun[i]);
		}

		int seed;
		String temp;
		for (int i = 0; i <= 4; i++) {
			seed = (int) (Math.random() * 4) + 1;
			temp = qqq[i];
			qqq[i] = qqq[seed];
			qqq[seed] = temp;
		}
		

		for (int j = 0; j < qqq.length; j++) {
			System.out.println("eeeeeeeeeee" + noun[j]);
			System.out.println("&&&&&&&&&&&&&&&&&" + qqq[j]);
			session.setAttribute("qqq" + j, qqq[j]);
		}

		

		return "drill/Testdrill";
	}

	@RequestMapping(value = "checkq", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	System.out.println("물건 답안 체크");
	
		
		return "home";
	}
	
	
	
}
