package com.mirukamo.ai.controller;

import org.slf4j.Logger;



import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.util.UsersValidator;
import com.mirukamo.ai.vo.Users;


@RequestMapping("join")
@Controller
public class UserJoinController {
	
	@Autowired
	UsersDAO usersDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserJoinController.class);
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String join(boolean ok1,boolean ok2,boolean fromAppointment) {
		logger.debug(ok1+","+ok2+","+fromAppointment);
		if(ok1==false||ok2==false){
			return "user/joinAppointment";
		}
		return "users/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Users users, Model model) {
		
		
		UsersValidator uv = new UsersValidator(); 
		String msg = uv.validate(users);
		if(msg!=null){
			model.addAttribute("errorMsg",msg);
			logger.debug(msg);
			return "users/join";
		}
		usersDAO.insertUser(users);
		return "users/joinSuccessPage";
	}
	
	/*아이디 중복확인*/
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck(){
		return "users/idCheck";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(Users users,String searchId,Model model){
		users=null;
		if(searchId!=null){
			users = usersDAO.selectUser(searchId);
			model.addAttribute("searchId",searchId);
			model.addAttribute("Customer",users);
		}
		return "users/idCheck";
		
	}
	
}
