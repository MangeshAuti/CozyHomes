package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.jsonclasses.RequestJsonP;
import com.app.jsonclasses.ResponseJson;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;
import com.app.service.AddressServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServiceInterface userService;

	@Autowired
	private AddressServiceInterface addressService;

	// show home page with some property
	@GetMapping(value = "/home")
	public String showLoginForm(User user, HttpSession hs, Search searchOpt) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		else {
			List<String> city = addressService.getcity();
			hs.setAttribute("city", city);
			User activeUser = (User) hs.getAttribute("activeUser");
			List<Property> ls = userService.getAllProperty(activeUser);
			hs.setAttribute("searchOpt", searchOpt);
			hs.setAttribute("startResultNo", 0);
			hs.setAttribute("propList", ls);
		}
		return "/user/home";
	}

	// show search criteria result
	@PostMapping(value = "/home/{start}")
	public String processSearchRequest(@PathVariable(required = false) int start, Search searchOpt, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		searchOpt.setStart(0);
		List<Property> ls = userService.getSearchProperties(searchOpt);
		hs.setAttribute("startResultNo", searchOpt.getStart());
		hs.setAttribute("searchOpt", searchOpt);
		hs.setAttribute("propList", ls);
		return "user/home";
	}

	// pagination
	@GetMapping(value = "/home/{start}")
	public String processSearchPageRequest(@PathVariable int start, Search searchOpt, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		searchOpt = (Search) hs.getAttribute("searchOpt");
		System.out.println(searchOpt.getStart());
		searchOpt.setStart(start);
		List<Property> ls = userService.getSearchProperties(searchOpt);
		hs.setAttribute("startResultNo", start);
		hs.setAttribute("propList", ls);
		return "user/home";
	}

	// show profile
	@GetMapping(value = "/profile")
	public String showProfileForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		user = (User) hs.getAttribute("activeUser");
		return "/user/profile";
	}

	// upload profile picture
	@PostMapping(value = "/uploadProfilePic")
	public String processUploadProfileImgForm(User user, @RequestParam("file") MultipartFile file,
			RedirectAttributes flashmap, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		else if (!file.isEmpty()) {
			User activeUser = (User) hs.getAttribute("activeUser");
			try {
				if (userService.updateProfileImg(file, activeUser)) {
					flashmap.addFlashAttribute("successStatus", "Profile Image Uploaded successfully");
				} else
					flashmap.addFlashAttribute("status", "file Upload Fail.");
			} catch (Exception e) {
				flashmap.addFlashAttribute("status", e.getMessage());
			}
			return "redirect:/user/profile";
		} else {
			flashmap.addFlashAttribute("Status", "please select file.");
			return "redirect:/user/profile";
		}
	}

	@PostMapping(value = "/profile")
	public String processUpdateProfileForm(@Valid User updateUser, BindingResult result, HttpSession hs,
			RedirectAttributes flashmap) {
		if (hs.getAttribute("activeUser") != null) {
			if (result.hasFieldErrors("name") || result.hasFieldErrors("mobileNo"))
				return "/user/profile";
			else {
				User activeUser = (User) hs.getAttribute("activeUser");
				System.out.println(activeUser);
				if (userService.updateProfile(updateUser, activeUser))
					flashmap.addFlashAttribute("successStatus", "Profile Updated SuccessFully");
				else
					flashmap.addFlashAttribute("status", "Unable to perform your request ,Try Again");
				return "redirect:/user/profile";
			}
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processChangePasswordForm(@RequestBody @Valid RequestJsonP updateUser, BindingResult result,
			HttpSession hs, ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeUser") != null) {
				if (result.hasFieldErrors("oldPassword") || result.hasFieldErrors("newPassword")) {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					throw new Exception("Invalid Password Length");
				} else {
					User activeUser = (User) hs.getAttribute("activeUser");
					if (userService.changePassword(updateUser, activeUser)) {
						resJson.setMessage("Password Change SuccessFully");
						System.out.println("active session" + (User) hs.getAttribute("activeUser"));
						// hs.setAttribute("activeUser",activeUser);
					} else {
						response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
						throw new Exception("Incorrect old password,Try Again");
					}
				}
			} else {
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				throw new Exception("Unable to perform your request ,Try Again");
			}
		} catch (Exception e) {
			resJson.setErrorMessage(e.getMessage());

		}
		return resJson;
	}

	@GetMapping(value = "/propertyDetails/{propId}")
	public String showDetailProperty(@PathVariable int propId, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		Property property = userService.getProperty(propId);
		hs.setAttribute("prop", property);
		return "user/propertyDetails";
	}

	@RequestMapping(value = "/bookVisit", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processbookvisitForm(@RequestBody @Valid RequestJsonP notification, BindingResult result,
			HttpSession hs, ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeUser") != null) {
				if (result.hasFieldErrors("booktime")) {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					throw new Exception("Date Required");
				}
				if (result.hasFieldErrors("message")) {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					throw new Exception("Maximum 255 character allowed");
				}
				User activeUser = (User) hs.getAttribute("activeUser");
				if (userService.bookVisit(notification, activeUser)) {
					resJson.setMessage("Message Send");
				} else {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					throw new Exception("Unable to perform your request ,Try Again");
				}
			} else {
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				throw new Exception("Unable to perform your request ,Try Again");
			}
		} catch (Exception e) {
			resJson.setErrorMessage(e.getMessage());
		}
		return resJson;
	}
}
