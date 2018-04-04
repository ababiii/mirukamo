package com.mirukamo.ai.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
	
@Controller
public class ServiceCenterController {

	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);
	
	//고객센터
	@RequestMapping(value = "/servicecenter", method = RequestMethod.GET)
	public String servicecenter(Locale locale, Model model) {
		
			logger.debug("dd");
		
		return "servicecenter";
	}
}