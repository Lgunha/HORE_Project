package com.hotel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("pre handle");
		//인터셉터로 로그인 한 사람인지 인증 체크
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("nowUser");
		
		if(obj==null) {  //로그인이 안된 경우
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post handle");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
