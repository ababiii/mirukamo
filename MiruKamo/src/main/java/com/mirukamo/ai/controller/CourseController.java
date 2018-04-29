
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
import com.mirukamo.ai.dao.DrillDao;
import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.util.FileService;
import com.mirukamo.ai.util.MultipartFileSender;

import com.mirukamo.ai.vo.Mirukamo_course;
import com.mirukamo.ai.vo.Mirukamo_drill;

import com.mirukamo.ai.vo.MyCourse;

import com.mirukamo.ai.vo.Users;

@RequestMapping("course")
@Controller

public class CourseController {
	@Resource(name = "uploadPath")
	String uploadPath;

	@Autowired

	UsersDAO usersDAO;
	@Autowired
	CourseDAO courseDAO;
	@Autowired
	DrillDao drillDao;
	

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
	
	@RequestMapping(value = "/face7", method = RequestMethod.GET)
	public String face7() {
		
		return "face7";
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
	public void getPreview3(@RequestParam(value = "name") String name, HttpServletResponse response,
			HttpServletRequest request, HttpSession session) {
		// name="1.mp4";
		String path = "D://video/" + name;
		logger.debug(name + "영상이름");
		try {
			MultipartFileSender.fromFile(new File(path)).with(request).with(response).serveResource();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
	}

	@RequestMapping(value = "/videolist", method = RequestMethod.GET)
	public String videolist1(Model model) {

		// 요시코 선생님만 들어갈 배열
		ArrayList<Mirukamo_course> yosheko = new ArrayList<Mirukamo_course>();
		
		// 도쿄핫(예명) 선생님만 들어갈 배열
		ArrayList<Mirukamo_course> tokyohot = new ArrayList<Mirukamo_course>();

		ArrayList<Mirukamo_course> list = new ArrayList<Mirukamo_course>();
		list = courseDAO.selectCourse();
		System.out.println("코스 전체 가져오기 : " + list);

		ArrayList<Mirukamo_course> yoshisushi = new ArrayList<Mirukamo_course>();
		ArrayList<Mirukamo_course> tokyocold = new ArrayList<Mirukamo_course>();
		
		//이미지 파일
		for (int i = 0; i < list.size(); i++) {
			String fileName = list.get(i).getFile_name();
			
			int lastIndex = fileName.lastIndexOf('.');
			
			if(lastIndex != -1){
				String imgPath = fileName.substring(0, lastIndex);
				logger.debug("확인용: " + imgPath);
				list.get(i).setThumnail(imgPath+".png");
			}
		}
		
		
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTeacher().equals("요시코")) {
				yoshisushi.add(list.get(i));
			} else {
				tokyocold.add(list.get(i));
			}
			
			
			
		}
			for (int j = 0; j < yoshisushi.size(); j++) {
				System.out.println("요시코 센세 : " + j + "번쨰" + yoshisushi.get(j).toString());
			}

			model.addAttribute("yoshisushi", yoshisushi);
			
			for (int j = 0; j < tokyocold.size(); j++) {
				System.out.println("도쿄핫 센세 : " + j + "번쨰" + tokyocold.get(j).toString());
			}

		
			return "videolist";
			
	}
	

	 @ResponseBody
	 @RequestMapping(value = "updrill", method = RequestMethod.POST)
		public void updrill(Mirukamo_drill drill,HttpSession session) {
		 System.out.println("드릴저장?");
		 System.out.println(drill);
		//drill.setMember_id((String)session.getAttribute("userId"));
		drill.setMember_id("abc");
		
		
		drillDao.insertDrill(drill);
}
	 
	 
	

	@RequestMapping(value = "/videolist", method = RequestMethod.POST)
	public String videolist(String name, HttpSession session, Model model) {
		// session.setAttribute("title", title1);
		System.out.println("★★★★★★" + name);
		model.addAttribute("file_name", name);

		return "video";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Model model) {
		// ----------송수근
		ArrayList<Mirukamo_course> comesensei = courseDAO.senseicours();

		for (int i = 0; i < comesensei.size(); i++) {
			System.out.println("센세이들 코스" + comesensei.get(i).toString());
		}

		ArrayList<String> numstring = new ArrayList<String>();

		// 객체말고 스트링으로 넣어라
		for (int i = 0; i < comesensei.size(); i++) {
			String packagename = comesensei.get(i).getPackagename();
			String num = "" + courseDAO.sen(packagename).get(i).getNum();
			numstring.add(num);
		}

		for (int i = 0; i < numstring.size(); i++) {
			System.out.println("##### 코스11111111111" + numstring.get(i));
			int posernum = Integer.parseInt(numstring.get(i));
			comesensei.get(i).setNum(posernum);
		}

		for (int i = 0; i < comesensei.size(); i++) {
			System.out.println("##### 코스22222222222" + comesensei.get(i).toString());
		}

		model.addAttribute("comesensei", comesensei);
		return "uploadForm";
	}

	//여기에서 비디오 정보가 저장됨
	@RequestMapping(value = "uploadcomplete", method = RequestMethod.POST)
	public String upload1(Mirukamo_course course, MultipartFile upload, Model model, HttpServletRequest req) {
		System.out.println("들어오냐?");
		System.out.println(upload.getOriginalFilename());
		String savedfile = FileService.saveFile(upload, uploadPath, req);
		course.setFile_name(savedfile);

		System.out.println("ㅅㅅㄱ : " + course.toString());
		courseDAO.insertCourse(course);
	

		// ------------송수근
		ArrayList<Mirukamo_course> mirucourse = new ArrayList<Mirukamo_course>();

		mirucourse = courseDAO.mirucourse();

		for (int i = 0; i < mirucourse.size(); i++) {
			System.out.println("미루카모 개짜증" + mirucourse.get(i).toString());
		}

		// 강의 영상가져오기
		model.addAttribute("list", mirucourse);

		return "redirect:videolist";
	}

	// 송수근 > 수강신청 버튼누르기
	@ResponseBody
	@RequestMapping(value = "signclass", method = RequestMethod.POST)
	public String videolistlogin(Model model, HttpSession session,
			String msg) {
		System.out.println("%%%%%%%%수강%%%%%%%%%%  : " + msg.toString());
	
	/*	
		String teachername = sign;
		String userid = (String) session.getAttribute("userId");

		MyCourse mycourse = new MyCourse();

		mycourse.setTeacher(teachername);
		mycourse.setMember_id(userid);

		courseDAO.insertmypage(mycourse);*/
		// ArrayList<Mirukamo_MyCourse> mycourse = new
		// ArrayList<Mirukamo_MyCourse>();
		// model.addAttribute("mynihongosensei", mynihongosensei);

		return msg ;
	}

	// 송수근
	@ResponseBody
	@RequestMapping(value = "/checksen", method = RequestMethod.POST)
	public ArrayList<Mirukamo_course> checksen(Model model, HttpSession session, String val) {
		System.out.println("수강 선생님찾기 위한 번호 : " + val);

		int num = Integer.parseInt(val);
		ArrayList<Mirukamo_course> picksensei = courseDAO.picksensei(num);

		System.out.println("꿰엑" + picksensei.toString());

		return picksensei;
	}
}
