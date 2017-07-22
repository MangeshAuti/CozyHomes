package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.app.pojos.User;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping(value = "/home")
	public String showLoginForm(User user,HttpServletRequest request,HttpSession hs) {
		if(hs.getAttribute("activeAdmin")==null)
			return "redirect:/";
		return "/admin/home";
	}
}

