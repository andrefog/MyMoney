package com.fogsoft.mymoney.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fogsoft.mymoney.model.User;
import com.fogsoft.mymoney.service.LoginService;
import com.fogsoft.mymoney.service.MessageBean;
import com.fogsoft.mymoney.service.MessageType;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String formUpdate() {
		
		if( loginService.isLogged() )
			return "/home";
		
		return "/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String doLogin(User user, Model model, Locale locale) {
		if ( user != null && loginService.login(user) ) {
			System.out.println("XPTO - USUARIO LOGADO COM SUCESSO");
			return "redirect:/home";
		}
		
		String msg = messageSource.getMessage("msg.email.password.invalid", null, locale); 
		model.addAttribute("message", new MessageBean(MessageType.ERRO, msg));
		return "/login";
	}
}
