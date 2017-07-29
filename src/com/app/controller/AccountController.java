package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.jsonclasses.RequestJsonP;
import com.app.jsonclasses.ResponseJson;
import com.app.pojos.User;
import com.app.service.AccountServiceInterface;
import com.app.service.EmailServiceInterface;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	@Qualifier("email_service")
	private EmailServiceInterface emailService;

	@Autowired
	@Qualifier("account_service")
	private AccountServiceInterface accountService;

	// Show login form
	@GetMapping(value = "/login")
	public String showLoginForm(User user, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null)
			return "redirect:/user/home";
		else if (hs.getAttribute("activeAdmin") != null)
			return "redirect:/admin/home";
		else
			return "/account/login";
	}

	// Process login form
	@PostMapping(value = "/login")
	public String processLoginForm(@Valid User user, BindingResult result, Model map, RedirectAttributes flashmap,
			HttpSession hs) {
		if (result.hasFieldErrors("email") || result.hasFieldErrors("password")) {
			return "/account/login";
		}
		User activeUser = accountService.validateUser(user);
		if (activeUser != null) {
			if (activeUser.getRole().equals("a")) {
				hs.setAttribute("activeAdmin", activeUser);// if user admin
															// redirect to admin
															// home page
				return "redirect:/admin/home";
			}
			hs.setAttribute("activeUser", activeUser);
			return "redirect:/user/home";// normal user redirect to user home
											// page
		} else {
			flashmap.addFlashAttribute("response", "* Invalid Username or Password");
			return "redirect:/account/login";
		}
	}

	// logout request
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpSession hs) {
		request.setAttribute("successStatus", "Logout Successfully");
		hs.invalidate();
		return "redirect:/";
	}

	// show registration form
	@GetMapping(value = "/registration")
	public String showRegistrationForm(User user) {
		return "/account/registration";
	}

	// process registration form
	@PostMapping(value = "/registration")
	public String processRegistrationForm(@Valid User user, BindingResult result, Model map,
			RedirectAttributes flashmap, HttpSession hs) {
		System.out.println("in process reg form " + map.toString());
		if (result.hasFieldErrors("name") || result.hasFieldErrors("email") || result.hasFieldErrors("password")
				|| result.hasFieldErrors("mobileNo"))
			return "account/registration";
		if (!accountService.checkEmail(user.getEmail())) {
			if (accountService.registerUser(user) != null) {
				if (accountService.sendActivationMail(user)) {
					flashmap.addFlashAttribute("successStatus", "Hello, " + user.getName()
							+ "<br>Registration Successfull  Check Your Email for Activate Account");
					return "redirect:/account/login";
				} else {
					accountService.removeTempUser(user);
					flashmap.addFlashAttribute("status", "Incorrect Email Address");
					return "redirect:/account/registration";
				}
			} else {
				flashmap.addFlashAttribute("status", "Incorrect Details Please try again");
				return "redirect:/account/registration";
			}
		} else {
			flashmap.addFlashAttribute("status", "You are already registered");
			return "redirect:/account/registration";
		}
	}

	// process request of account activation from email
	@GetMapping(value = "/activate/{activateId}")
	public String processAccountActivationFromEmail(Model map, @PathVariable String activateId) {
		if (!activateId.isEmpty()) {
			if (accountService.activateAccount(activateId)) {
				map.addAttribute("status", "Your Account is now Active...");
				return "account/activationstatus";
			}
		}
		return "redirect:/";
	}

	// send temp link to user for recover password
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processForgotPasswordForm(@RequestBody RequestJsonP emailjson, ResponseJson responseJson,
			HttpServletResponse response, HttpServletRequest request) {
		try {
			if (!emailjson.getForgot_email().isEmpty()) {
				if (accountService.sendForgotLink(emailjson.getForgot_email()))
					responseJson.setMessage("Email with verfication link has been sent to your account");
				else
					throw new Exception("Unable to send verification link");
			} else
				throw new Exception("Enter Valid Email");
		} catch (Exception e) {
			responseJson.setErrorMessage(e.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		return responseJson;
	}

	// show recover password form
	@GetMapping(value = "/recoverpassword")
	public String showRecoverPassswordForm(HttpSession hs) {
		if (hs.getAttribute("activeForgotUser") == null)
			return "redirect:/";
		return "/account/recoverpassword";
	}

	// valid recover id and redirect to show recover password form
	@GetMapping(value = "/recoverPassword/{recoverId}")
	public String processPasswordRecoveryFromEmail(@PathVariable(required = false) String recoverId, HttpSession hs) {
		if (!recoverId.isEmpty()) {
			User user = accountService.recoverPasswordfromEmail(recoverId);
			if (user != null) {
				System.out.println(user.toString());
				hs.setMaxInactiveInterval(120);
				hs.setAttribute("activeForgotUser", user);
				return "redirect:/account/recoverpassword";
			}
		}
		return "redirect:/";
	}

	// validate session and reset password
	@RequestMapping(value = "/recoverpassword", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseJson processPasswordRecoveryForm(@RequestBody RequestJsonP requestJson, ResponseJson responseJson,
			HttpServletResponse response, HttpSession hs, HttpServletRequest request) {
		try {
			if ((User) hs.getAttribute("activeForgotUser") == null)
				throw new Exception("timeout occured,Unable to complete this operation at this time");
			if (!requestJson.getNewPassword().isEmpty() && requestJson.getNewPassword().length() > 6) {
				System.out.println((User) hs.getAttribute("activeForgotUser"));
				if (accountService.changePassword(requestJson.getNewPassword(),
						(User) hs.getAttribute("activeForgotUser"))) {
					hs.invalidate();
					responseJson.setMessage("Password reset successfull.");
				} else
					throw new Exception("Sorry for inconvenience,Unable to complete this operation at this time");

			} else
				throw new Exception("Enter valid password.(Password length must be 6 alphanumeric)");

		} catch (Exception e) {
			responseJson.setErrorMessage(e.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		return responseJson;
	}
}
