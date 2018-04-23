
package com.mirukamo.ai.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mirukamo.ai.dao.CourseDAO;
import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.util.FileService;
import com.mirukamo.ai.util.MultipartFileSender;
import com.mirukamo.ai.vo.Mirukamo_course;
import com.mirukamo.ai.vo.Users;


@RequestMapping("course")
@Controller
public class CourseController {
	 @Resource(name="uploadPath")
	    String uploadPath;
	
	@Autowired
	UsersDAO usersDAO;
	@Autowired
	CourseDAO courseDAO;
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	final String filepath = "D://video/";
	
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
		 	//name="1.mp4";
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
	 @RequestMapping(value = "/videolist", method = RequestMethod.GET)
		public String videolist1( Model model) {
		 ArrayList<Mirukamo_course> list=new ArrayList<Mirukamo_course>();
		 list=courseDAO.selectCourse();
		 System.out.println(list);
			model.addAttribute("list",list);
			return "videolist";
		}
	 
	 @RequestMapping(value = "/videolist", method = RequestMethod.POST)
		public String videolist(String name, HttpSession session, Model model) {
			//session.setAttribute("title", title1);
		 	System.out.println("★★★★★★"+name);
			model.addAttribute("file_name",name);
		
			
		return "video";
		}
	
	 
	 @RequestMapping(value = "/upload", method = RequestMethod.GET)
		public String upload() {
		  return "uploadForm";
		}
	
	 @RequestMapping(value = "uploadcomplete", method = RequestMethod.POST)
		public String upload1(Mirukamo_course course,MultipartFile upload) {
		 System.out.println("들어오냐?");
		 System.out.println(upload.getOriginalFilename());
		 String savedfile = FileService.saveFile(upload, uploadPath);
		 course.setFile_name(savedfile);
		
		 courseDAO.insertCourse(course);
	      /*  String savedName = upload.getOriginalFilename();

	        File target = new File(uploadPath, savedName);

	        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
	        // FileCopyUtils.copy(바이트배열, 파일객체)
	        try {
				FileCopyUtils.copy(upload.getBytes(), target);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/


		 
		 
		  return "redirect:videolist";
}
}
