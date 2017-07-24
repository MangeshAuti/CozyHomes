package com.app.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.jsonclasses.ResponseJson;
import com.app.pojos.Property;
import com.app.pojos.User;
import com.app.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping(value = "/home")
	public String showLoginForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		return "/user/home";
	}

	@GetMapping(value = "/profile")
	public String showProfileForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		return "/user/profile";
	}

	@PostMapping(value = "/uploadProfilePic")
	public String processUploadProfileImgForm(User user, @RequestParam("file") MultipartFile file, RedirectAttributes flashmap,
			HttpSession hs, ServletRequest rs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		else if (!file.isEmpty()) 
		{
				User activeUser = (User) hs.getAttribute("activeUser");
				if(!userService.updateProfileImg(file,activeUser))
					
				flashmap.addFlashAttribute("Status", "file Upload Fail...");
				return "redirect:/user/profile";
			} else {
				flashmap.addFlashAttribute("Status", "please select file....");
				return "redirect:/user/profile";
			}
		}
	
	// WORK IN PROGRESS
		@RequestMapping(value = "/deleteProperty", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseJson processUpdateProfileForm(@RequestBody User updateUser, HttpSession hs,
				ResponseJson resJson) {
			if (hs.getAttribute("activeUser") != null) {
				User activeUser = (User) hs.getAttribute("activeUser");
				try {
					if (userService.updateProfile(updateUser,activeUser)) {
						resJson.setMessage("ProFile Updated SuccessFully");
					}
					throw new Exception("Unable to perform your request ,Try Again");
				} catch (Exception e) {
					resJson.setErrorMessage(e.getMessage());
				}
			}
			resJson.setErrorMessage("Unable to perform your request ,Try Again");
			return resJson;
		}
}
