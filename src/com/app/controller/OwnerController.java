package com.app.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojos.Address;
import com.app.pojos.Property;
import com.app.pojos.User;
import com.app.service.EmailService;
import com.app.service.OwnerService;

@Controller
@RequestMapping("/owner")
public class OwnerController {

	@Autowired
	private OwnerService ownerService;
	
	@GetMapping(value = "/addProperty")
	public String showAddPropertyForm(Property property,Address address, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null)
			return "/owner/addProperty";
		return "redirect:/";
		
	}
	
	@PostMapping(value = "/addProperty")
	public String processAddPropertyForm(@Valid Property property, BindingResult result,HttpSession hs,RedirectAttributes flashmap) {
		if (hs.getAttribute("activeUser") != null)
		{
			if(result.hasErrors())
			 return "/owner/addProperty";
			User updatedActiveUser=ownerService.addProperty(property,(User)hs.getAttribute("activeUser"));
			if(updatedActiveUser!=null)
			{
				hs.setAttribute("activeUser", updatedActiveUser);
				hs.setAttribute("propId", property.getPropId());
				flashmap.addFlashAttribute("status","Property added Successfully");
			}
			else
			flashmap.addFlashAttribute("status","Incorrect Details");
			return "redirect:/owner/addProperty";
		}
		return "redirect:/";
		
	}
	
	@GetMapping(value = "/myProperty")
	public String showMyPropertyForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null)
		{
			ownerService.updateUser((User)hs.getAttribute("activeUser"));
			System.out.println((User)hs.getAttribute("activeUser"));
			return "/owner/myProperty";
		}
		return "redirect:/";
		
	}
}
