package com.mirukamo.ai.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mirukamo.ai.dao.DrillDao;
import com.mirukamo.ai.vo.mirukamo_drill;

@Controller
public class DrillController {

	private static final Logger logger = LoggerFactory.getLogger(DrillController.class);

	@Autowired
	DrillDao drilldao;

	// 공지사항 글 읽기
	@RequestMapping(value = "/drill", method = RequestMethod.GET)
	public String drilljsp(Locale locale, Model model) {
		logger.debug("드릴 jsp 이동");

		// 디비한번 다녀와서 에서 틀린거 가져오는것

		ArrayList<mirukamo_drill> getDrill = drilldao.getword();
		System.out.println("단어 가지고 온나" + getDrill);

		String[] todayQ = new String[getDrill.size()];
		
		
		
		
		//arrylist에서 num들 다 한곳에 모아둠
		for (int k = 0; k < getDrill.size() ; k++) {
			
			todayQ[k] = "" + getDrill.get(k).getNum();
			System.out.println("배열에 넣어둔 숫자"+k+todayQ[k]);
		
		}
		
		//배열안에있는 num들 중에서 랜덤 숫자 5개 생성
			for(int q = 0; q < 4; q ++){
				
				int num = (int) (Math.random() * todayQ.length);
				
				System.out.println("래덤 숫자 5개"+todayQ[num]); 
			}

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		Tokenizer tokenizer = Tokenizer.builder().build();

		List<Token> tokens = tokenizer.tokenize("私はあなたがすきです。");

		for (Token token : tokens) {
			System.out.println("====================");
			// allFeatures tokenの全ての要素を出力
			System.out.println("allFeatures: " + token.getAllFeatures());

			// partOfSpeech 品詞など形態素上で意味のある言葉を出力
			// 각종 품사 보여줌
			System.out.println("partOfSpeech: " + token.getPartOfSpeech());

			// position 単語の位置を出力
			// 배열 (0 , 1, 2..)에서 순서 뽑아주는

			System.out.println("partOfSpeech: " + token.getPosition());

			// reading カナ読みを出力
			// 카타카나로 변환 ,, 카타카나인 단어가 출력될떄 reding이랑 surfaceform이랑 비교하면될듯
			System.out.println("reading: " + token.getReading());

			// surfaceForm 元の単語を出力
			// 단어 그대로 출력 ( 한자면 한자로)
			System.out.println("surfaceFrom: " + token.getSurfaceForm());

			// allFeaturesArray allFeaturesをArray型で返す
			// 객체로 반환??머지
			System.out.println("allFeaturesArray" + token.getAllFeaturesArray());

			// isKnown 辞書にある言葉かどうか
			// 사전에 있는 단어인가
			System.out.println("isKnown: " + token.isKnown());

			// isUnknown 辞書にない言葉かどうか、isKnownと反対の結果が出力される
			// 사전에 없는단어인가? , isKnown과 같아야함
			System.out.println("isUnKnown: " + token.isUnknown());

			// isUser ユーザーで定義した言葉かどうか
			// 유저가 정의한 단어인가 아닌가
			System.out.println("User: " + token.isUser());

		}

		/*
		 * model.addAttribute("serverTime", formattedDate );
		 * 
		 */

		return "drill/Testdrill";
	}
}
