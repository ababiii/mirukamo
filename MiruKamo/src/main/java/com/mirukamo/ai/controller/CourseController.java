/*<<<<<<< HEAD
package com.mirukamo.ai.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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


	@RequestMapping(value = "/lectureInfoPage", method = RequestMethod.GET)
	public String lectureInfoPage(Model model, @RequestParam("teacher") String teacher) {
		
		try {
			teacher = URLDecoder.decode(teacher, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//courseView에서 보내준 값을 model에 넣어준다
		//넣어 준 값을 jsp에서 그 선생님이 맞는지 확인해 주는대 사용해준다. 
		System.out.println(teacher);
		ArrayList<Mirukamo_course> list=courseDAO.getTeacherInfo(teacher);
		ArrayList<ArrayList<Mirukamo_course>> result=new ArrayList<ArrayList<Mirukamo_course>>();
		
		for (Mirukamo_course a : list) {
			boolean flag=true;
			if(result.size()<1){
				ArrayList<Mirukamo_course> temp=new ArrayList<Mirukamo_course>();
				temp.add(a);
				result.add(temp);
			}else{
				for (ArrayList<Mirukamo_course> b : result) {
					if(b.get(0).getPackagename().equals(a.getPackagename())){
						b.add(a);
						flag=false;
						break;
					}
				}
				if(flag){
					ArrayList<Mirukamo_course> temp=new ArrayList<Mirukamo_course>();
					temp.add(a);
					result.add(temp);
				}
				
			}
			
		}
		
		model.addAttribute("list", result);
		model.addAttribute("name", teacher);
		
		return "lectureInfoPage";
	}
	
	@RequestMapping(value = "/lectureInfoPage", method = RequestMethod.POST)
	public String lectureInfoPage() {
		
		
		return "lectureInfoPage";
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
	
	@RequestMapping(value = "/lecture_page", method = RequestMethod.GET)
	public String lecture_page(@RequestParam(value="num", required = true) int num,Model m) {
		System.out.println(num+"이름 들어감");
		logger.debug(num+"");
		
		Mirukamo_course c= courseDAO.selectNumCourse(num);
	ArrayList<Mirukamo_course> p= courseDAO.selectPackCourse(c.getPackagename());
		m.addAttribute("name",c.getFile_name());
		m.addAttribute("thumb",p);
		//엄정환 강의를 보았는지 확인하기
	
		
		return "lecture_page";
	}
	
	@RequestMapping(value = "/lecture_page", method = RequestMethod.POST)
	public String lecture_page2(int num, Model model) {
		logger.debug(num+"숫자들어감");
		model.addAttribute("title_num", num);
		return "lecture_page";
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
	@RequestMapping(value = "/video_sidelist", method = RequestMethod.GET)
	public String video_sidelist() {

		return "video_sidelist";

	}
	
	 @RequestMapping(value = "preview", method = RequestMethod.GET)
	    public void getPreview3(@RequestParam(value="name") String name, 
	    		HttpServletResponse response,HttpServletRequest request, 
	    		HttpSession session) {
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

	 @ResponseBody
	 @RequestMapping(value = "updrill", method = RequestMethod.POST)
		public void updrill(Mirukamo_drill drill,HttpSession session) {
		 System.out.println("드릴저장?");
		 System.out.println(drill);
		drill.setMember_id((String)session.getAttribute("userId"));
		//drill.setMember_id("qweqwe");
		if(!drill.getOriginal_word().equals(drill.getWord())){
			
			drillDao.insertDrill(drill);
		}else{
			System.out.println("저장 안함");
		}
}
	 
	@RequestMapping(value = "/videolist", method = RequestMethod.POST)
	public String videolist(String packagename,String name, HttpSession session, Model model) {
		// session.setAttribute("title", title1);
		System.out.println("★★★★★★" + name);
		model.addAttribute("file_name", name);
		//사용자가 선택한 강의의 packagename을 가져와서 인터셉터로 보내주도록한다. 
		model.addAttribute("packagename", packagename);

		return "video";
		//return "lecture_page";
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
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("들어오냐?");
		System.out.println(upload.getOriginalFilename());
		String savedfile = FileService.saveFile(upload, uploadPath, req);
		course.setFile_name(savedfile);
		
		int lastIndex = savedfile.lastIndexOf('.');
		String thumnail = savedfile.substring(0, lastIndex)+".png";
		
		
		course.setThumnail(thumnail);
		System.out.println("ㅅㅅㄱ : " + course.toString());
		courseDAO.insertCourse(course);
	

		// ------------송수근
		ArrayList<Mirukamo_course> mirucourse = new ArrayList<Mirukamo_course>();

		mirucourse = courseDAO.mirucourse();

		for (int i = 0; i < mirucourse.size(); i++) {
			System.out.println("미루카모 개짜증" + mirucourse.get(i).toString());
		}

		// 강의 영상가져오기
		model.addAttribute("tokyocold", mirucourse);
		String encodeResult="";
		try {
			encodeResult = URLEncoder.encode(course.getTeacher(), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		출처: http://unikys.tistory.com/195 [All-round programmer]
		return "redirect:lectureInfoPage?teacher="+encodeResult;
	}

	// 송수근 > 수강신청 버튼누르기
	@ResponseBody
	@RequestMapping(value = "signclass", method = RequestMethod.POST)
	public String videolistlogin(Model model, HttpSession session,
			String msg) {
		System.out.println("%%%%%%%%수강%%%%%%%%%%  : " + msg.toString());
	
		
		String teachername = sign;
		String userid = (String) session.getAttribute("userId");

		MyCourse mycourse = new MyCourse();

		mycourse.setTeacher(teachername);
		mycourse.setMember_id(userid);

		courseDAO.insertmypage(mycourse);
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
=======*/
package com.mirukamo.ai.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

	@RequestMapping(value = "/lectureInfoPage", method = RequestMethod.GET)
	public String lectureInfoPage(Model model, @RequestParam("teacher") String teacher, String lecture) {
		
		try {
			teacher = URLDecoder.decode(teacher, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//courseView에서 보내준 값을 model에 넣어준다
		//넣어 준 값을 jsp에서 그 선생님이 맞는지 확인해 주는대 사용해준다. 
		System.out.println(teacher);
		Mirukamo_course search=new Mirukamo_course();
		search.setTeacher(teacher);
		search.setPackagename(lecture);
		ArrayList<Mirukamo_course> list=courseDAO.getTeacherInfo(search);
		ArrayList<ArrayList<Mirukamo_course>> result=new ArrayList<ArrayList<Mirukamo_course>>();
		
		for (Mirukamo_course a : list) {
			boolean flag=true;
			if(result.size()<1){
				ArrayList<Mirukamo_course> temp=new ArrayList<Mirukamo_course>();
				temp.add(a);
				result.add(temp);
			}else{
				for (ArrayList<Mirukamo_course> b : result) {
					if(b.get(0).getPackagename().equals(a.getPackagename())){
						b.add(a);
						flag=false;
						break;
					}
				}
				if(flag){
					ArrayList<Mirukamo_course> temp=new ArrayList<Mirukamo_course>();
					temp.add(a);
					result.add(temp);
				}
				
			}
			
		}
		
		model.addAttribute("list", result);
		model.addAttribute("name", teacher);
		
		return "lectureInfoPage";
	}
	
	@RequestMapping(value = "/lectureInfoPage", method = RequestMethod.POST)
	public String lectureInfoPage() {
		
		
		return "lectureInfoPage";
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
	@RequestMapping(value = "/lecture_page", method = RequestMethod.GET)
	public String lecture_page(@RequestParam(value="num", required = true) int num,Model m,HttpSession session, HttpServletResponse response) {
		System.out.println(num+"이름 들어감");
		logger.debug(num+"");
		response.setCharacterEncoding("euc-kr");
		Mirukamo_course c= courseDAO.selectNumCourse(num);
	ArrayList<Mirukamo_course> p= courseDAO.selectPackCourse(c.getPackagename());
		m.addAttribute("name",c.getFile_name());
		m.addAttribute("thumb",p);
		//엄정환 강의를 보았는지 확인하기
		String log=(String)session.getAttribute("userId");
		if(log == null){
				PrintWriter pw= null;
				try {
					pw = response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(pw != null){
				pw.print("<script src='../resources/jQuery/jquery-3.2.1.min.js'></script><script type='text/javascript'>"
					+"$(document).ready(function(){	"
	+"	 setTimeout(function(){"
					+"opener.document.location.href='../login';"
		+"close();"
+" }, 3000);"
+"});"
+				 "</script><img src='../resources/images/loverdug.jpg' style='width:190px;height:auto;'>");
				pw.flush();
				pw.close();
				}
			//response.sendRedirect(request.getContextPath()+"/course/lectureInfoPage?teacher="+request.getAttribute("teacher"));
			
			
		}
		
		return "lecture_page";
	}
	
	@RequestMapping(value = "/lecture_page", method = RequestMethod.POST)
	public String lecture_page2(int num, Model model) {
		logger.debug(num+"숫자들어감");
		model.addAttribute("title_num", num);
		return "lecture_page";
	}
	
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video() {

		return "video";
	}

	@RequestMapping(value = "/eye_blink_detect", method = RequestMethod.GET)
	public String eye() {

		return "eye_blink_detect";
	}

	// 영상 리스트선택시 패키지 보여주는 화면 / 송수근
	@RequestMapping(value = "/packagselect", method = RequestMethod.GET)
	public String YooMyvideolist(Model model, HttpSession session, String val) {
		ArrayList<Mirukamo_course> list = new ArrayList<Mirukamo_course>();
		list = courseDAO.selectCourse();
		System.out.println("코스 전체 가져오기 : " + list);
		ArrayList<Mirukamo_course> yoshisushi = new ArrayList<Mirukamo_course>();
		ArrayList<Mirukamo_course> tokyocold = new ArrayList<Mirukamo_course>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTeacher().equals("요시코")) {
				yoshisushi.add(list.get(i));
			} else {
				tokyocold.add(list.get(i));
			}
		}
		model.addAttribute("yoshisushi", yoshisushi);
		model.addAttribute("tokyocold", tokyocold);

		return "packagselect";
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

		}
	}

	@RequestMapping(value = "/videolist", method = RequestMethod.GET)
	public String videolist1(Model model, HttpSession session, String teacher) {
		System.out.println("티쳐!!!!!!" + teacher);

		ArrayList<Mirukamo_course> list = new ArrayList<Mirukamo_course>();
		list = courseDAO.selectCourse();
		System.out.println("코스 전체 가져오기 : " + list);

		ArrayList<Mirukamo_course> callmebaby = new ArrayList<Mirukamo_course>();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTeacher().equals(teacher)) {
				callmebaby.add(list.get(i));
			}
		}

		for (int i = 0; i < callmebaby.size(); i++) {
			System.out.println("꿰에에엥아아앙" + callmebaby.get(i).toString());
		}

		String yes = "yes";
		// String no = "no";

		String member_id = (String) session.getAttribute("userId");
		ArrayList<MyCourse> plz = new ArrayList<MyCourse>();
		plz = courseDAO.myc(member_id);

		// 마이 수강코스에 아무것도 없는 경우 -> 추가
		if (plz.size() == 0) {
			System.out.println("사용자 이름 강의 하나두 없음");
		}

		for (int i = 0; i < plz.size(); i++) {
			if (plz.get(i).getTeacher().equals(teacher)) {
				model.addAttribute("good", yes);
				callmebaby.add(list.get(i));
			}
		}
		
		  for (int i = 0; i < plz.size(); i++) {
			  if(plz.get(i).getTeacher().equals(teacher)) {
				  model.addAttribute("good", yes);
			  }
		  }
		
		  for (int i = 0; i < plz.size(); i++) {
			  if(plz.get(i).getTeacher().equals(teacher)) {
				  model.addAttribute("good", yes);
			  }
		  }
		model.addAttribute("callmebaby", callmebaby);

		return "videolist";
	}

	@ResponseBody
	@RequestMapping(value = "updrill", method = RequestMethod.POST)
	public void updrill(Mirukamo_drill drill, HttpSession session) {
		System.out.println("드릴저장?");
		System.out.println(drill);
		// drill.setMember_id((String)session.getAttribute("userId"));
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
			try {
				req.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("들어오냐?");
			System.out.println(upload.getOriginalFilename());
			String savedfile = FileService.saveFile(upload, uploadPath, req);
			course.setFile_name(savedfile);
			
			int lastIndex = savedfile.lastIndexOf('.');
			String thumnail = savedfile.substring(0, lastIndex)+".png";
			
			
			course.setThumnail(thumnail);
			System.out.println("ㅅㅅㄱ : " + course.toString());
			courseDAO.insertCourse(course);
		


			String encodeResult="";
			try {
				encodeResult = URLEncoder.encode(course.getTeacher(), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String encodeResult2="";
			try {
				encodeResult2 = URLEncoder.encode(course.getPackagename(), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:lectureInfoPage?teacher="+encodeResult+"&lecture="+encodeResult2;
		
	}

	// 송수근 > 수강신청 버튼누르기
	@ResponseBody
	@RequestMapping(value = "signclass", method = RequestMethod.POST)
	public int videolistlogin(Model model, HttpSession session, int msg) {
		System.out.println("%%%%%%%%수강%%%%  : " + msg);
		// 넘어온 번호로 찾은 수강목록

		Mirukamo_course course = courseDAO.yoursenseicours(msg);

		System.out.println("르가르손 수근 ㄱk즈아" + course.toString());
		String member_id = (String) session.getAttribute("userId");

		course.setMember_id(member_id);
		System.out.println("르가르손 수근 잘 ㄱㅏ즈아" + course.toString());

		// 아이디로 마이코스 검색
		ArrayList<MyCourse> plz = new ArrayList<MyCourse>();
		plz = courseDAO.myc(member_id);

		System.out.println("plz : " + plz.toString());

		// 마이 수강코스에 아무것도 없는 경우 -> 추가
		if (plz.size() == 0) {
			System.out.println("일치 하나도 안함");
			courseDAO.ADDClass(course);
			return 1;
		}
		// 마이 수강코스에 무언가 있는 경우 -> 무언가 있는데 그게 내가 선택한 패키지가 아닐떄
		for (int i = 0; i < plz.size(); i++) {
			if (!plz.get(i).getPackagename().equals(course.getPackagename())) {
				System.out.println("강의 추가");
				courseDAO.ADDClass(course);
			}
		}
		return 1;
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
	
	//김지혜 : 수강신청
	@RequestMapping(value="insertCourse",method=RequestMethod.POST)
	public String insertCourse(String packageName,HttpSession session,Model model){
		System.out.println(packageName);
		Mirukamo_course course = courseDAO.getPackageInfo(packageName);
		if(course==null){
			model.addAttribute("fail", "notCourse");
			return "redirect:../courseView";
		}
		String member_id = (String) session.getAttribute("userId");
		course.setMember_id(member_id);
		ArrayList<MyCourse> plz = new ArrayList<MyCourse>();
		plz = courseDAO.myc(member_id);
		
				// 마이 수강코스에 무언가 있는 경우 -> 무언가 있는데 그게 내가 선택한 패키지일 때
					for (int i = 0; i < plz.size(); i++) {
						if (plz.get(i).getPackagename().equals(course.getPackagename())) {
							model.addAttribute("fail", "already");
						
							return "redirect:../courseView";
						}
				}
					courseDAO.ADDClass(course);
				
		
		return "redirect:../myCourseView";

	}

}
