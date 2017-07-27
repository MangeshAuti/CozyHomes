package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pojos.Address;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.service.AddressService;
import com.app.service.UserService;

@Controller
public class WebController {

	@Autowired
	private AddressService addressService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/")
	public String showWelcomePage(Model map,Search search){
		List<String> city=addressService.getcity();
		/*String []city={"Mumbai","Pune","Nasik","Bangalore"};*/
		map.addAttribute("city",city);
		return "/index";
	}
	
	@RequestMapping(value="/aboutUs")
	public String showAboutUsPage(){
		return "/aboutUs";
	}
	
	
	@RequestMapping(value = "/search/{start}")
	public String processSearchRequest(@PathVariable int start, Search searchOpt,HttpSession hs) {
		searchOpt.setStart(start);
		List<Property> ls = userService.getSearchProperties(searchOpt);
		hs.setAttribute("startResultNo", start);
		hs.setAttribute("propList", ls);
		return "/search";
	}
}
