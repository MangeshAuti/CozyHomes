package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.service.AddressServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
public class WebController {

	@Autowired
	private AddressServiceInterface addressService;
	
	@Autowired
	private UserServiceInterface userService;
	
	//index page
	@RequestMapping(value="/")
	public String showWelcomePage(Model map,Search search,HttpSession hs){
		List<String> city=addressService.getcity();
		hs.setAttribute("city",city);
		return "/index";
	}
	
	//about us
	@RequestMapping(value="/aboutUs")
	public String showAboutUsPage(){
		return "/aboutUs";
	}
	
	//show property for search criteria
	@PostMapping(value = "/search/{start}")
	public String processSearchRequest(@PathVariable(required=false) int start, Search searchOpt,HttpSession hs) {
		List<String> city=addressService.getcity();
		hs.setAttribute("city",city);
		searchOpt.setStart(0);
		List<Property> ls = userService.getSearchProperties(searchOpt);
		hs.setAttribute("searchOpt",searchOpt);
		hs.setAttribute("startResultNo", start);
		hs.setAttribute("propList", ls);
		return "/search";
	}

	//pagination
	@GetMapping(value = "/search/{start}")
	public String processSearchPageRequest(@PathVariable int start, Search searchOpt,HttpSession hs) {
		searchOpt = (Search) hs.getAttribute("searchOpt");
		searchOpt.setStart(start);
		List<Property> ls = userService.getSearchProperties(searchOpt);
		hs.setAttribute("searchOpt",searchOpt);
		hs.setAttribute("startResultNo", start);
		hs.setAttribute("propList", ls);
		return "/search";
	}
}
