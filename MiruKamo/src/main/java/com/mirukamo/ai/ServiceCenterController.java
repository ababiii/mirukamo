package com.mirukamo.ai;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import mirukamoDao.ServiceCenterDao;
import mirukamoVo.mirukamo_question;

@Controller
public class ServiceCenterController {

/*	@Autowired
	ServiceCenterDao servicecenterdao;*/

	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);

	// 고객센터
	@RequestMapping(value = "/servicecenter", method = RequestMethod.GET)
	public String servicecenter(Locale locale, Model model) {

		logger.debug("고객 센터 컨트롤러 시작");
		ServiceCenterDao servicecenterdao = new ServiceCenterDao();
		ArrayList<mirukamo_question> question = servicecenterdao.boardinfo();

		logger.debug("DB거쳐서 다시 컨트롤러 옴" + question);

		return "board/servicecenter";

	}

}