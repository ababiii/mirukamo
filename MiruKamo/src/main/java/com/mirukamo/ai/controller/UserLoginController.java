package com.mirukamo.ai.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.util.MultipartFileSender;
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
	
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String find_pw() {
		
		return "users/find_pw";
	}
	
	
	
	@RequestMapping(value = "/reset_pw_form", method = RequestMethod.POST)
	public String find_pw2(Model model, Users user,HttpSession session) {
		String email[] = user.getEmail().split("@");
		user.setEmail(email[0]);
		if(email.length > 1)
		user.setEmail2(email[1]);
		
		Users result = usersDAO.find_pw(user);
		if(result == null){
			return  "redirect:/";
		}else{
			session.setAttribute("based", result);
			return  "users/reset_pw_form";
		}
	}
	
	@RequestMapping(value = "/reset_pw", method = RequestMethod.POST)
	public String reset_pw(Users users,String userId, String userPassword, HttpSession session, Model model) {
		Users result = (Users)session.getAttribute("based");
		result.setPassword(users.getPassword());
		usersDAO.reset_pw(result);
		session.invalidate();
		return "users/complete_pw" ;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/userRegisterCheck", method = RequestMethod.POST)
	public int userRegisterCheck(String userID, Users user,HttpSession session) {
		user = usersDAO.selectUser(userID);
		session.setAttribute("toID", user.getId());
		return 0;
	}
	
	@RequestMapping(value = "/face", method = RequestMethod.GET)
	public String face() {
		
		return "face";
	}
	
	@RequestMapping(value = "/face2", method = RequestMethod.GET)
	public String face2() {
		
		return "face2";
	}
	
	@RequestMapping(value = "/face3", method = RequestMethod.GET)
	public String face3() {
		
		return "face3";
	}
	
	@RequestMapping(value = "/face4", method = RequestMethod.GET)
	public String face4() {
		
		return "face4";
	}
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video() {
		
		return "video";
	}
	
	 @RequestMapping(value = "preview", method = RequestMethod.GET)
	    public void getPreview3(@RequestParam(value="name") String name, HttpServletResponse response,HttpServletRequest request,HttpSession session) {
	    // String s = (String)session.getAttribute("title");   
		// name = name + ".mp4";
		 logger.debug(name);
		 
		 //response.reset();
		 
	   // name="1.mp4";
		 	String path = "D:\\video\\"+name;
	        try {
	            MultipartFileSender.fromFile(new File(path))
	            .with(request)
	            .with(response)
	            .serveResource();
	            
	            
	            //return "video" ;	           
	            		
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            //e.printStackTrace();
	        }
	        //return "video" ;
	    }

	 @RequestMapping(value = "/videolist", method = RequestMethod.GET)
		public String videolist1() {
			
			return "videolist";
		}
	 
	 @RequestMapping(value = "/videolist", method = RequestMethod.POST)
		public String videolist(String name, HttpSession session, Model model) {
			//session.setAttribute("title", title1);
			model.addAttribute("filename",name);
		
			
			return "video";
		}
	 
}
