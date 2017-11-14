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

import com.app.jsonclasses.ResponseJson;
import com.app.pojos.Address;
import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.User;
import com.app.service.OwnerServiceInterface;
import com.app.service.UserServiceInterface;

@Controller
@RequestMapping("/owner")
public class OwnerController {

	@Autowired
	private OwnerServiceInterface ownerService;

	@Autowired
	private UserServiceInterface userService;

	@GetMapping(value = "/addProperty")
	public String showAddPropertyForm(Property property, Address address, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null)
			return "/owner/addProperty";
		return "redirect:/";

	}

	@PostMapping(value = "/addProperty")
	public String processAddPropertyForm(@Valid Property property, BindingResult result, HttpSession hs,
			RedirectAttributes flashmap, @RequestParam MultipartFile[] photos) {
		if (hs.getAttribute("activeUser") != null) {
			if (result.hasErrors())
				return "/owner/addProperty";
			User updatedActiveUser = null;
			try {
				updatedActiveUser = ownerService.addProperty(property, (User) hs.getAttribute("activeUser"), photos);
			} catch (Exception e) {
				flashmap.addFlashAttribute("status", e.getMessage());
				return "redirect:/owner/addProperty";
			}
			if (updatedActiveUser != null) {
				hs.setAttribute("activeUser", updatedActiveUser);
				hs.setAttribute("propId", property.getPropId());
				flashmap.addFlashAttribute("successStatus", "Property added Successfully");
			} else
				flashmap.addFlashAttribute("status", "Incorrect Details");
			return "redirect:/owner/addProperty";
		}
		return "redirect:/";

	}

	@GetMapping(value = "/myProperty")
	public String showMyPropertyForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null) {
			User u = (User) hs.getAttribute("activeUser");
			List<Property> ls = ownerService.getAllRegisterProperty(u);
			System.out.println(ls);
			hs.setAttribute("propList", ls);
			return "/owner/myProperty";
		}
		return "redirect:/";

	}

	// property details
	@GetMapping(value = "/propertyDetails/{propId}")
	public String showDetailProperty(@PathVariable int propId, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		Property property = userService.getProperty(propId);
		hs.setAttribute("prop", property);
		return "owner/propertyDetails";
	}

	@GetMapping(value = "/notification")
	public String showNotification(HttpSession hs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		List<Notification> ls = ownerService.getNotification((User) hs.getAttribute("activeUser"));
		System.out.println(ls);
		hs.setAttribute("notification", ls);
		return "/owner/notification";

	}

	@RequestMapping(value = "/deleteProperty", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processdeletePropertyRequest(@RequestBody Property reqJson, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeUser") != null) {
				User activeUser = (User) hs.getAttribute("activeUser");
				if (ownerService.deleteProperty(reqJson.getPropId(), activeUser.getUserId())) {
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

	@RequestMapping(value = "/updateProperty", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processUpdatePropertyRequest(@RequestBody Property updateProperty, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		try {
			if (hs.getAttribute("activeUser") != null) {
				User activeUser = (User) hs.getAttribute("activeUser");
				if (ownerService.updateProperty(updateProperty, activeUser))
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

	@RequestMapping(value = "/propertyStatus", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processPropertyStatus(@RequestBody Property updateProperty, HttpSession hs,
			ResponseJson resJson, HttpServletResponse response) {
		if (hs.getAttribute("activeUser") != null) {
			User activeUser = (User) hs.getAttribute("activeUser");
			try {
				if (ownerService.statusUpdateOfProperty(updateProperty, activeUser.getUserId())) {
					resJson.setMessage("Property Status Change");
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
}
