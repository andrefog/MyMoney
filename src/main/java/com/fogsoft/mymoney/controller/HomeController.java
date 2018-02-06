package com.fogsoft.mymoney.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping({ "/home", "/" } )
	public String home() throws SQLException {
		return "home";
	}

}
