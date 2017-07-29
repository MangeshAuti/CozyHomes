package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.jsonclasses.ResponseJson;
import com.app.pojos.Property;
import com.app.pojos.User;
import com.app.service.AdminServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	@Qualifier("admin_service")
	private AdminServiceInterface adminService;

	@Autowired
	private UserServiceInterface userService;

	@GetMapping(value = "/home")
	public String showLoginForm(User user, HttpServletRequest request, HttpSession hs) {
		if (hs.getAttribute("activeAdmin") == null)
			return "redirect:/";
		return "/admin/home";
	}

	// Admin Delete Property Fuctionality
	@RequestMapping(value = "/deleteProperty", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processdeletePropertyRequestfromAdmin(@RequestBody Property reqJson, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeAdmin") != null) {
				if (adminService.deleteProperty(reqJson.getPropId())) {
					resJson.setMessage("Property Deleted SuccessFully");
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

	// Admin Verify Property Functionality
	@RequestMapping(value = "/propertyVerification", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processPropertyVerificationStatus(@RequestBody Property updateProperty, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		if (hs.getAttribute("activeAdmin") != null) {
			try {
				if (adminService.updateVerificationStatusProperty(updateProperty)) {
					resJson.setMessage("Property Verification Status Change");
					return resJson;
				}
				throw new Exception("Unable to perform your request ,Try Again");
			} catch (Exception e) {
				resJson.setErrorMessage(e.getMessage());
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				return resJson;
			}
		}
		resJson.setErrorMessage("Unable to perform your request ,Try Again");
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		return resJson;
	}

	// Show All user list
	@GetMapping(value = "/userList")
	public String showAllUsers(HttpSession hs) {
		if (hs.getAttribute("activeAdmin") == null)
			return "redirect:/";
		List<User> ls = adminService.showUserList();
		hs.setAttribute("userList", ls);
		return "admin/userList";
	}

	// Show All Properties
	@GetMapping(value = "/propertyList/{start}")
	public String showAllProperty(@PathVariable int start, HttpSession hs) {
		if (hs.getAttribute("activeAdmin") == null)
			return "redirect:/";
		List<Property> ls = adminService.showPropertyList(start);
		hs.setAttribute("startResultNo", start);
		hs.setAttribute("propList", ls);
		return "admin/propertyList";
	}

	// property details
	@GetMapping(value = "/propertyDetails/{propId}")
	public String showDetailProperty(@PathVariable int propId, HttpSession hs) {
		if (hs.getAttribute("activeAdmin") == null)
			return "redirect:/";
		Property property = userService.getProperty(propId);
		hs.setAttribute("prop", property);
		return "admin/propertyDetails";
	}

	// Update Properties
	@RequestMapping(value = "/updateProperty", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processUpdatePropertyRequest(@RequestBody Property updateProperty, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeAdmin") != null) {
				if (adminService.updateProperty(updateProperty))
					resJson.setMessage("Property Updated SuccessFully");
				else
					throw new Exception("Unable to perform your request ,Try Again");
			} else {
				resJson.setErrorMessage("Unable to perform your request ,Try Again");
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}

		} catch (Exception e) {
			resJson.setErrorMessage(e.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		return resJson;
	}
}
