package com.app.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String processUploadProfileForm(User user, @RequestParam("file") MultipartFile file, RedirectAttributes flashmap,
			HttpSession hs, ServletRequest rs) {
		if (hs.getAttribute("activeUser") == null)
			return "redirect:/";
		else if (!file.isEmpty()) {
			try {
				/*byte[] bytes = file.getBytes();
				User temp = (User) hs.getAttribute("activeUser");
				String fileName = hs.getServletContext().getRealPath("/profilePic/" + temp.getUserId() + ".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fileName)));
				stream.write(bytes);
				stream.close();

				temp.setImageAdd(fileName);
				System.out.println("detached pojo" + temp);*/
				User temp = (User) hs.getAttribute("activeUser");
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (file.getSize() > 0) 
				{

					inputStream = file.getInputStream();
					// File realUpload = new File("C:/");
					/*String fileName = hs.getServletContext().getRealPath("/profilePic/" + temp.getUserId() + ".jpg");*/
					String fileName = rs.getRealPath("/profilePic/" + temp.getUserId() + ".jpg");
					outputStream = new FileOutputStream(fileName);
					int readBytes = 0;
					byte[] buffer = new byte[8192];
					while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1)
					{
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();
					temp.setImageAdd(fileName);
					hs.setAttribute("activeUser", temp);
					if (userService.uploadProfilePic(temp)) {
						System.out.println("file upload successfully");
						return "redirect:/user/profile"; // like vendor
					}
				}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				flashmap.addFlashAttribute("errorInFileUpload", "file Upload Fail...");
				return "redirect:/user/profile";
			} else {
				flashmap.addFlashAttribute("errorInFileUpload", "please select file....");
				return "redirect:/user/profile";
			}
		}
	}
