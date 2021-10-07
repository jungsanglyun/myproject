package com.waap.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutoLoginInterceptor extends  HandlerInterceptorAdapter{
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("isLogOn") == "false" || session.getAttribute("memberInfo") == null) {
			request.setAttribute("viewName", "/member/loginForm");
		}
			
		
		return true;
	}
	
}
