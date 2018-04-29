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
		ArrayList<MyCourse> list = appointmentDAO.getMyCourse(loginId);
		for(int i=0; i<list.size();i++){
		//이 부분이 사용자가 클릭한 수업과 틀릴경우 
		 list.get(i).getCourse_num();
		};
		//없으면 로그인 페이지로 리다이렉트
		if(loginId==null){
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
