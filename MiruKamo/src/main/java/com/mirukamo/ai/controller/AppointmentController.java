package com.mirukamo.ai.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mirukamo.ai.dao.AppointmentDAO;
import com.mirukamo.ai.vo.MyCourse;
import com.mirukamo.ai.vo.Users;

@Controller
public class AppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppointmentController.class);
	
	@Autowired
	AppointmentDAO appointmentDAO;
	
	@RequestMapping(value="appointment",method=RequestMethod.GET)
	public String appointment(Model model,boolean error){
		logger.debug(error+"");
		if(error==true){
			model.addAttribute("error", true);
		}
		
		return "users/joinAppointment";
	}
	
	@RequestMapping(value="findMyID",method=RequestMethod.GET)
	public String findMyID(){
		return "users/findMyID";
	}
	
	@ResponseBody
	@RequestMapping(value="findMyID",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String findMyID(Users users){
		ArrayList<Users> list=appointmentDAO.findMyID(users);
		if(list.isEmpty()){
			return "회원정보가 일치하는 ID가 존재하지 않습니다.";
		}
		logger.debug(list.get(0).getId());
		System.out.println(list.get(0).getId());
		return list.get(0).getId();
		
	}
	
	@RequestMapping(value="myPage",method=RequestMethod.GET)
	public String myPage(HttpSession session,Model model){
		String id=(String)session.getAttribute("userId");
		ArrayList<MyCourse> list=appointmentDAO.getMyCourse(id);
		
		model.addAttribute("list", list);
		
		return "users/myPage";
	}
	
	/*@ResponseBody
	@RequestMapping(value="getTumori",method=RequestMethod.POST)
	public void getTumori(String userId){
		logger.debug(userId);
	}
*/
}
