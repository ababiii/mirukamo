
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


@RequestMapping("course")
@Controller
public class CourseController {
	
	@Autowired
	UsersDAO usersDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	
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
	
	@RequestMapping(value = "/face5", method = RequestMethod.GET)
	public String face5() {
		
		return "face5";
	}
	
	@RequestMapping(value = "/face6", method = RequestMethod.GET)
	public String face6() {
		
		return "face6";
	}
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video() {
		
		return "video";
	}
	
	@RequestMapping(value = "/eye_blink_detect", method = RequestMethod.GET)
	public String eye() {
		
		return "eye_blink_detect";
	}
	
	
	 @RequestMapping(value = "preview", method = RequestMethod.GET)
	    public void getPreview3(@RequestParam(value="name") String name, HttpServletResponse response,HttpServletRequest request, HttpSession session) {
		 	name="1.mp4";
		 	String path = "D://video/"+name;
		 	logger.debug(name+"영상이름");
	        try {
	            MultipartFileSender.fromFile(new File(path))
	            .with(request)
	            .with(response)
	            .serveResource();
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            //e.printStackTrace();
	        }
	    }
	
	
	

}
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
