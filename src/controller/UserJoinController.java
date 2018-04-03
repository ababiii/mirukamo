package controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.UsersDAO;
import vo.Users;


@RequestMapping("join")
@Controller
public class UserJoinController {
	
	@Autowired
	UsersDAO usersDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserJoinController.class);
	//wsfsdfsdfsdfsdfs
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		
		return "users/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Users users) {
		try{
		usersDAO.insertUser(users);
		
		return "users/joinSuccessPage";
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return "users/joinSuccessPage";
	}
	
}
