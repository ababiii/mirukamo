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
import com.mirukamo.ai.vo.Users;


@RequestMapping("login")
@Controller
public class UserLoginController {
	
	@Autowired
	UsersDAO usersDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "users/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Users users,String userId, String userPassword, HttpSession session, Model model) {
		
		users = usersDAO.selectUser(userId);
		
		if(userId.equals("")){
			String msg = "아이디 입력";
			model.addAttribute("errorMsg",msg);
			return "users/login";
		}else if(!userId.equals(users.getId())){
			String msg="아이디 없음";
			model.addAttribute("errorMsg",msg);
			return "users/login";
		}else if(userPassword.equals("")){
			String msg="비밀번호 입력";
			model.addAttribute("errorMsg",msg);
			return "users/login";
		}else if(!userPassword.equals(users.getPassword())){
			String msg="비밀번호 다름";
			model.addAttribute("errorMsg",msg);
			return "users/login";
		}else if(userId.equals(users.getId())&&userPassword.equals(users.getPassword())){
		
		session.setAttribute("userId",users.getId());
		session.setAttribute("userName",users.getName());
		session.setAttribute("adminCheck",users.getAdmin());
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/userRegisterCheck", method = RequestMethod.POST)
	public int userRegisterCheck(String userID, Users user,HttpSession session) {
		user = usersDAO.selectUser(userID);
		session.setAttribute("toID", user.getId());
		return 0;
	}
	
	/*회원가입 이메일 중복확인*/
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String emailCheck(){
		return "users/emailCheck";
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public String emailCheck(Users users,String searchEmail,Model model){
		users=null;
		if(searchEmail!=null){
			users = usersDAO.selectUser(searchEmail);
			model.addAttribute("searchEmail",searchEmail);
			model.addAttribute("Email",users);
		}
		return "users/emailCheck";
		
	}
	
}
