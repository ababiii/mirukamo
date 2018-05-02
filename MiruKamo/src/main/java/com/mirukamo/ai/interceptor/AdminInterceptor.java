package com.mirukamo.ai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ResultSetSupportingSqlParameter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mirukamo.ai.dao.AppointmentDAO;
import com.mirukamo.ai.vo.Users;

//요청의 전,후처리를 담당하는 클래스
public class AdminInterceptor 
	extends HandlerInterceptorAdapter{
	private static final Logger logger=LoggerFactory.getLogger(AdminInterceptor.class);
	@Autowired
	AppointmentDAO appointmentDAO;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("adminInterceptor 실행");
		
		//세션의 로그인 정보 읽음
		HttpSession session=request.getSession();
		String loginId=(String)session.getAttribute("userId");
		Users user=appointmentDAO.getMyInfo(loginId);
		if(user==null){
	         response.sendRedirect(request.getContextPath()+"/");
	         return false;
	      }
		//없으면 로그인 페이지로 리다이렉트
		if(user.getAdmin()==null||user.getAdmin().equals("0")||user.getAdmin().equals("")){
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
