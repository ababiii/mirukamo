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
import com.mirukamo.ai.dao.DrillDao;
import com.mirukamo.ai.vo.MyCourse;
import com.mirukamo.ai.vo.Users;
import com.mirukamo.ai.vo.mirukamo_drill;

@Controller
public class AppointmentController {

	private static final Logger logger = LoggerFactory.getLogger(AppointmentController.class);

	@Autowired
	AppointmentDAO appointmentDAO;
	@Autowired
	DrillDao drilldao;

	@RequestMapping(value = "appointment", method = RequestMethod.GET)
	public String appointment(Model model, boolean error) {
		logger.debug(error + "");
		if (error == true) {
			model.addAttribute("error", true);
		}

		return "users/joinAppointment";
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
		return list.get(0).getId();

	}

	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userId");
		ArrayList<MyCourse> list = appointmentDAO.getMyCourse(id);

		model.addAttribute("list", list);

		// ---------------------------------송수근----

		ArrayList<mirukamo_drill> rank = new ArrayList<mirukamo_drill>();

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
		return "users/myUpdate";
	}

	// 개인정보 수정
	@RequestMapping(value = "myUpdate", method = RequestMethod.POST)
	public String myUpdate(HttpSession session, Model model, Users user) {
		Users moto = appointmentDAO.getMyInfo((String) session.getAttribute("userId"));
		if (user.getBirth().isEmpty()) {
			user.setBirth(moto.getBirth());
		}
		if (user.getPassword().isEmpty()) {
			user.setPassword(moto.getPassword());
		}
		if (user.getPhone().isEmpty()) {
			user.setPhone(moto.getPhone());
		}
		appointmentDAO.setMyInfo(user);
		Users result = appointmentDAO.getMyInfo((String) session.getAttribute("userId"));
		model.addAttribute("info", result);
		model.addAttribute("result", true);
		return "users/myUpdate";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	@RequestMapping(value="loginTest",method=RequestMethod.GET)
	public String loginTest(){
		return "test/loginTest";
	}
}
