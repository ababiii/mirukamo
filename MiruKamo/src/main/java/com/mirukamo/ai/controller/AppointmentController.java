package com.mirukamo.ai.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppointmentController.class);
	//
	@RequestMapping(value="appointment",method=RequestMethod.GET)
	public String appointment(){	
		return "users/joinAppointment";
	}

}