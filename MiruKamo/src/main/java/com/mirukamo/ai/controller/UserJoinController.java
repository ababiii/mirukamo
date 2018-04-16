package com.mirukamo.ai.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;



import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String join(Model model,boolean ok1,boolean ok2,boolean fromAppointment) {
		logger.debug(ok1+","+ok2+","+fromAppointment);
		if(ok1==false||ok2==false||fromAppointment==false){
			model.addAttribute("error", true);
			return "redirect:../appointment";
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
/*	
	아이디 중복확인
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
		
	}*/
	
/*	이메일 중복확인
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String emailCheck(){
		return "users/emailCheck";
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public String emailCheck(Users users,String searchEmail,String searchEmail2,Model model){
		users=null;
		if(searchEmail!=null&&searchEmail2!=null){
			logger.debug(searchEmail+"@"+searchEmail2);
			users = usersDAO.selectEmail(searchEmail,searchEmail2);
			logger.debug("brought");
			logger.debug(users.toString()+"brought");
			logger.debug(users.getEmail());
			logger.debug(users.getEmail2());
			model.addAttribute("searchEmail",searchEmail);
			model.addAttribute("searchEmail2",searchEmail2);
			model.addAttribute("Email",users.getEmail());
			model.addAttribute("Email",users.getEmail2());
		}
		return "users/emailCheck";
		
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/userRegisterCheck", method = RequestMethod.POST)
	public int userRegisterCheck(String userId, Users user,HttpSession session) {
		System.out.println("회원가입 체크");
		user = usersDAO.selectUser(userId);
		if(user!=null){
			session.setAttribute("toID", user.getId());
			//사용할 수 없는 아이디일 경우 0을 return 하고 
			return 0;
		}
		//사용할 수 있는 아이디일 경우 1을 return
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userRegisterEmailCheck", method = RequestMethod.POST)
	public int userRegisterEmailCheck(String userEmail, String userEmail2, Users user, Users user2,HttpSession session) {
		System.out.println("회원가입 이메일 체크");
		logger.debug(userEmail+"@"+userEmail2);
		user=usersDAO.selectEmail(userEmail);
		
		if(user.getEmail().equals(userEmail)&&user.getEmail2().equals(userEmail2)){
			session.setAttribute("Email", user.getEmail());
			session.setAttribute("Email2", user.getEmail2());
			logger.debug(user.getEmail()+"@"+user.getEmail2()+"객체");
			//사용할 수 없는 이메일일 경우 0을 return 하고 
			return 0;
		}
		//사용할 수 있는 이메일일 경우 1을 return
		return 1;
	}
	
	
}
