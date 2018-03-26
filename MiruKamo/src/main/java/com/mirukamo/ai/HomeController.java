package com.mirukamo.ai;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		//ㅈ석
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		Tokenizer tokenizer = Tokenizer.builder().build();
        List<Token> tokens = tokenizer.tokenize("もう眠い");

        for (Token token : tokens) {
            System.out.println("====================");
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
        }
		model.addAttribute("serverTime", formattedDate );
//kk	
		//umumum
		return "home";
	}
	
}
