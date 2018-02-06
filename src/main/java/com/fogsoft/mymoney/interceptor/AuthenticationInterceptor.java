package com.fogsoft.mymoney.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fogsoft.mymoney.service.LoginService;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private LoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		RequestMapping rm = ((HandlerMethod) handler).getMethodAnnotation(RequestMapping.class);
		
		boolean isLoginPage = false;
		boolean isNewUserPage = false;
		boolean isLogged = loginService == null? false : loginService.isLogged();
		
		if (rm != null && rm.value().length > 0 ) {
			isLoginPage = "login".equals(rm.value()[0]);
			isNewUserPage = "addUser".equals(rm.value()[0]);
		}
		
		if (isLogged && isLoginPage ) {
			response.sendRedirect(request.getContextPath() + "/home");
			return false;
		} else if (!isLogged && !isLoginPage && !isNewUserPage ) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return true;
	}
}
