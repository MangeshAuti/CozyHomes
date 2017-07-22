package com.app.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {

	@RequestMapping(value="/")
	public String showWelcomePage(Model map){
		String []city={"Mumbai","Pune","Nasik","Bangalore"};
		map.addAttribute("city",city);
		return "/index";
	}
	
	@RequestMapping(value="/aboutUs")
	public String showAboutUsPage(){
		return "/aboutUs";
	}
}
