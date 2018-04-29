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
	public String join(Model model,String ck_agree,String ck_agree_charge,String ck_poliy) {
		logger.debug(ck_agree+","+ck_agree_charge+","+ck_poliy);
		if(!ck_agree.equals("Y")||!ck_agree_charge.equals("Y")||!ck_poliy.equals("Y")){
			model.addAttribute("error", true);
			return "redirect:../appointment";
		}
		return "test/join2";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(String third,String usrid,String usrpw,String uname, String phone1,String phone2,String phone3
			,String email_id,String email_back, Model model) {
		if(!third.equals("Y")){
			return "redirect:/";
		}
		Users users=new Users(usrid,usrpw,uname,email_id,email_back,phone1+"-"+phone2+"-"+phone3);
		/*UsersValidator uv = new UsersValidator(); 
		String msg = uv.validate(users);
		if(msg!=null){
			model.addAttribute("errorMsg",msg);
			logger.debug(msg);
			return "users/join";
		}*/
		usersDAO.insertUser(users);
		model.addAttribute("joinComplete", true);
		return "redirect:/";
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
		if(userId.length()<6){
			return 2;
		}
		if(userId.length()>12){
			return 3;
		}
		user = usersDAO.selectUser(userId);
		if(user!=null){
			//사용할 수 없는 아이디일 경우 0을 return 하고 
			return 0;
		}
		//사용할 수 있는 아이디일 경우 1을 return
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userRegisterEmailCheck", method = RequestMethod.POST)
	public int userRegisterEmailCheck(Users user) {
		
		Users result=usersDAO.selectEmail(user);
		
		if(result!=null){
			
			return 0;
		}
		//사용할 수 있는 이메일일 경우1을 return
		return 1;
	}
	
	@RequestMapping(value="test",method=RequestMethod.GET)
	public String test(){
		return "users/joinSuccessPage";
	}
	
	
}
