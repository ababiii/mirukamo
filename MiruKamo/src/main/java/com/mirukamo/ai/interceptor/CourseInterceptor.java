package com.mirukamo.ai.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mirukamo.ai.dao.AppointmentDAO;
import com.mirukamo.ai.dao.CourseDAO;
import com.mirukamo.ai.vo.MyCourse;
//엄정환, 이용자가 수업 시청을 선택했을 때 그 수업이 자신이 수강신청한 수업인지 확인해 주는 interceptor
//요청의 전,후처리를 담당하는 클래스
public class CourseInterceptor 
	extends HandlerInterceptorAdapter{
	private static final Logger logger=LoggerFactory.getLogger(CourseInterceptor.class);
	
	@Autowired
	AppointmentDAO appointmentDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("CourseInterceptor 실행");
		
		//세션의 로그인 정보 읽음
		HttpSession session=request.getSession();
		String loginId=(String)session.getAttribute("userId");
		
		//강의 제목을 가져온다. 모델에 넣어준..
		String packagename = (String)request.getAttribute("packagename");
		
		//사용자의 수강정보를 list에 담아줌
		ArrayList<MyCourse> list = appointmentDAO.getMyCourse(loginId);
		//list에 담긴 수강정보가 선택한 수업의 수강정보와 일치하지 않을 경우는 시청하지 못하도록 만든다.
		for(int i=0; i<list.size();i++){
		//이 부분이 사용자가 클릭한 수업과 틀릴경우 
		 if(!packagename.equals(list.get(i).getPackagename())){
			 response.sendRedirect(request.getContextPath()+"/course/videolist"); 
		 }
		};
		//없으면 로그인 페이지로 리다이렉트
		if(loginId==null){
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
