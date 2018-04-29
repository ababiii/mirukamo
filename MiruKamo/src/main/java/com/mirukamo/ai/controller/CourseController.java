
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
	public String videolist1(Model model, HttpSession session) {
		
		// 모든 선생님 강의 다 가져오기
		ArrayList<Mirukamo_course> CcC = new ArrayList<Mirukamo_course>();
		CcC = courseDAO.mirucourse();
		System.out.println("르가르손 수근 잘 ㄱㅏ즈아" + CcC.toString());

		// 아이디로 마이코스 검색
		String member_id = (String) session.getAttribute("userId");
		ArrayList<MyCourse> plz = new ArrayList<MyCourse>();
		plz = courseDAO.myc(member_id);

		System.out.println("plz : " + plz.toString());

		// 마이 수강코스에 아무것도 없는 경우 -> 추가
		if (plz.size() == 0) {
			System.out.println("상요자 이름 강의 하나두 없음");
		}
		// 마이 수강코스에 무언가 있는 경우 -> 해당 페키지 이름이 있으면 수강 신청불가(이미있으니까)
		else {
			for (int i = 0; i < plz.size(); i++) {
				for (int j = 0; j < CcC.size(); j++) {
					if (plz.get(i).getPackagename().equals(CcC.get(j).getPackagename())) {
						System.out.println("마이코스에 이미 강의가 있는 경우");
						//현재 강의를 수강중입니다 
						model.addAttribute("POP", plz.get(i).getPackagename());
					}
				}
			}
		}
		
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
		for (int j = 0; j < yoshisushi.size(); j++) {
			System.out.println("요시코 센세 : " + j + "번쨰" + yoshisushi.get(j).toString());
		}

		model.addAttribute("yoshisushi", yoshisushi);

		for (int j = 0; j < tokyocold.size(); j++) {
			System.out.println("도쿄핫 센세 : " + j + "번쨰" + tokyocold.get(j).toString());
		}

		/*
		 * for (int i = 0; i <= list.size(); i++) { // 선생님 이름이 쿠로사와 요시코면 전체
		 * 값이들어있는 배열에서 요시코 선생님 전용 배열에 넣기 if
		 * (list.get(i).getTeacher().equals("쿠로사와요시코")) {
		 * yosheko.get(yoshe).setFile_name(list.get(i).getFile_name());
		 * yosheko.get(yoshe).setLanguages(list.get(i).getLanguages());
		 * yosheko.get(yoshe).setTeacher(list.get(i).getTeacher());
		 * yosheko.get(yoshe).setNum(list.get(i).getNum());
		 * yosheko.get(yoshe).setTitle(list.get(i).getTitle()); yoshe ++;
		 * //yosheko.add(list.get(i)); } else { // 쿠로사와 요시코 센세이가 아니면, 다른선생님 배열에
		 * 넣자 tokyohot.add(list.get(i)); } }
		 */
		// System.out.println("요시코 베이비 컴온"+yosheko.get(0).toString());

		// model.addAttribute("list", list);

		model.addAttribute("yoshisushi", yoshisushi);
		model.addAttribute("tokyocold", tokyocold);

		return "videolist";
	}

	/*
	 * @RequestMapping(value = "/video_sidelist", method = RequestMethod.GET)
	 * public String video_sidelist() {
	 * 
	 * } model.addAttribute("yoshisushi", yoshisushi);
	 * model.addAttribute("tokyocold", tokyocold); return "videolist";
	 * 
	 * return "video_sidelist";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = "preview", method = RequestMethod.GET) public
	 * void getPreview3(@RequestParam(value="name") String name,
	 * HttpServletResponse response,HttpServletRequest request, HttpSession
	 * session) { //name="1.mp4"; String path = "D://video/"+name;
	 * logger.debug(name+"영상이름"); try { MultipartFileSender.fromFile(new
	 * File(path)) .with(request) .with(response) .serveResource(); } catch
	 * (Exception e) { // TODO Auto-generated catch block //e.printStackTrace();
	 * } }
	 */
	/*
	 * @RequestMapping(value = "/videolist", method = RequestMethod.GET) public
	 * String videolist1( Model model) { ArrayList<Mirukamo_course> list=new
	 * ArrayList<Mirukamo_course>(); list=courseDAO.selectCourse();
	 * System.out.println(list); model.addAttribute("list",list); return
	 * "videolist"; }
	 */

	@RequestMapping(value = "/videolist", method = RequestMethod.POST)
	public String videolist(String name, HttpSession session, Model model) {
		// session.setAttribute("title", title1);
		System.out.println("★★★★★★" + name);
		model.addAttribute("file_name", name);

		return "video";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Model model, HttpSession session) {
		// ------------------------송수근
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

	
		/*
		 * for (int i = 0; i < numstring.size(); i++) {
		 * System.out.println("##### 코스11111111111" + numstring.get(i)); int
		 * posernum = Integer.parseInt(numstring.get(i));
		 * comesensei.get(i).setNum(posernum); }
		 * 
		 * for (int i = 0; i < comesensei.size(); i++) {
		 * System.out.println("##### 코스22222222222" +
		 * comesensei.get(i).toString()); }
		 */
		model.addAttribute("comesensei", comesensei);
		return "uploadForm";
	}

	// 여기에서 비디오 정보가 저장됨
	@RequestMapping(value = "uploadcomplete", method = RequestMethod.POST)
	public String upload1(Mirukamo_course course, MultipartFile upload, Model model) {
		System.out.println("들어오냐?");
		System.out.println(upload.getOriginalFilename());
		String savedfile = FileService.saveFile(upload, uploadPath);
		course.setFile_name(savedfile);

		System.out.println("ㅅㅅㄱ : " + course.toString());
		courseDAO.insertCourse(course);
		/*
		 * String savedName = upload.getOriginalFilename();
		 * 
		 * File target = new File(uploadPath, savedName);
		 * 
		 * // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사 // FileCopyUtils.copy(바이트배열,
		 * 파일객체) try { FileCopyUtils.copy(upload.getBytes(), target); } catch
		 * (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

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
	public int videolistlogin(Model model, HttpSession session, int msg) {
		System.out.println("%%%%%%%%수강%%%%  : " + msg);
		// 넘어온 번호로 찾은 수강목록

		Mirukamo_course course = courseDAO.yoursenseicours(msg);

		System.out.println("르가르손 수근 ㄱk즈아" + course.toString());
		String member_id = (String) session.getAttribute("userId");
		System.out.println("로그인한 아이디" + member_id);

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
		// 마이 수강코스에 무언가 있는 경우 -> 해당 페키지 이름이 있으면 수강 신청불가(이미있으니까)
		else {
			for (int i = 0; i < plz.size(); i++) {
				if (plz.get(i).getPackagename().equals(course.getPackagename())) {
					System.out.println("마이코스에 이미 강의가 있는 경우");
					return 3;
				}
			}
		}

		/*
		 * for (int i = 0; i < plz.size(); i++) { if
		 * (course.get(0).getPackagename().equals(plz.get(i).getPackagename()))
		 * { System.out.println("일치 하나도 함"); return 0; } else {
		 * courseDAO.ADDClass(plz); return 1; } }
		 */
		return 0;
		// }

		/*
		 * if (username.) { }
		 */
		/*
		 * String teachername = sign; String userid = (String)
		 * session.getAttribute("userId");
		 * 
		 * MyCourse mycourse = new MyCourse();
		 * 
		 * mycourse.setTeacher(teachername); mycourse.setMember_id(userid);
		 * 
		 * courseDAO.insertmypage(mycourse);
		 */
		// ArrayList<Mirukamo_MyCourse> mycourse = new
		// ArrayList<Mirukamo_MyCourse>();
		// model.addAttribute("mynihongosensei", mynihongosensei);
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
