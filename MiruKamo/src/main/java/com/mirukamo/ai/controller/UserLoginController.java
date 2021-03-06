package com.mirukamo.ai.controller;

import java.io.File;
import java.util.ArrayList;

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

import com.mirukamo.ai.dao.CourseDAO;
import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.util.MultipartFileSender;
import com.mirukamo.ai.vo.Mirukamo_course;
import com.mirukamo.ai.vo.Users;

@RequestMapping("login")
@Controller
public class UserLoginController {

	@Autowired
	UsersDAO usersDAO;
	@Autowired
	CourseDAO courseDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, boolean fromDrill) {
		if (fromDrill == true) {
			model.addAttribute("fromDrill", true);
		}
		return "users/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Users users, Model model,HttpSession session) {
		logger.info(users+"");
	      System.out.println(users+"");
	      Users result = usersDAO.selectUser(users.getId());

	      if (users.getId().isEmpty()) {
	         String msg = "아이디를 입력해주세요.";
	         model.addAttribute("errorMsg", msg);
	         return "users/login";
	      } else if (users.getPassword().isEmpty()) {
	         String msg = "비밀번호 입력해주세요.";
	         model.addAttribute("setId", users.getId());
	         model.addAttribute("errorMsg", msg);
	         return "users/login";
	      } else if (result == null) {
	         String msg = "IDを正しく入力してください。";
	         model.addAttribute("setId", users.getId());
	         model.addAttribute("errorMsg", msg);
	         return "redirect:/login";
	      } else if (!result.getPassword().equals(users.getPassword())) {
	         String msg = "PASSWORDを正しく入力してください。";
	         model.addAttribute("setId", users.getId());
	         model.addAttribute("errorMsg", msg);
	         return "redirect:/login";
	      }
	      session.setAttribute("admin", (result.getAdmin().equals("0")?false:true));
	      session.setAttribute("userId", result.getId());
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

	@ResponseBody
	@RequestMapping(value = "/reset_pw_form", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String find_pw2(Model model, Users user, HttpSession session) {

		Users result = usersDAO.find_pw(user);
		System.out.println(result);
		if (result == null) {
			return "false";
		} else {
			model.addAttribute("based", result);
			return "true";
			//return "users/reset_pw_form";
		}
	}
	
	

	@RequestMapping(value = "/reset_pw", method = RequestMethod.POST)
	public String reset_pw(Users users, String userId, String userPassword, HttpSession session, Model model) {
		/*Users result = (Users) session.getAttribute("based");
		result.setPassword(users.getPassword());*/
		System.out.println("reset_pw : "+users);
		users.setPassword(userPassword);
		usersDAO.reset_pw(users);
		//session.invalidate();
		model.addAttribute("result", 1);
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/userRegisterCheck", method = RequestMethod.POST)
	public int userRegisterCheck(String userID, Users user, HttpSession session) {
		user = usersDAO.selectUser(userID);
		session.setAttribute("toID", user.getId());
		return 0;
	}
}
