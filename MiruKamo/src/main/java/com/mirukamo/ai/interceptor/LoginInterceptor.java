package com.mirukamo.ai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//요청의 전,후처리를 담당하는 클래스
public class LoginInterceptor 
	extends HandlerInterceptorAdapter{
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("LoginInterceptor 실행");
		
		//세션의 로그인 정보 읽음
		HttpSession session=request.getSession();
		String loginId=(String)session.getAttribute("userId");
		//없으면 로그인 페이지로 리다이렉트
		if(loginId==null){
			response.sendRedirect(request.getContextPath()+"/join");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
