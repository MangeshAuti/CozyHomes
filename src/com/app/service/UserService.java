package com.app.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.app.dao.OwnerDao;
import com.app.dao.UserDao;
import com.app.pojos.Image;
import com.app.pojos.User;
import static com.app.service.OwnerService.*;
@Service("user_service")
@Transactional
public class UserService {
	@Autowired
	UserDao userDao;
	
	@Autowired
	ServletContext servlet;

	public boolean updateProfileImg(MultipartFile image, User activeUser) {
		String path = servlet.getRealPath("/") + "/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		String imgPath="/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		activeUser.setImageAdd(imgPath);
		File file = new File(path);
		try {
			FileUtils.writeByteArrayToFile(file, image.getBytes());
		} catch (IOException e) {
		
			e.printStackTrace();
			return false;
		}
		return userDao.updateProfileImg(activeUser);
		
	}

	public boolean updateProfile(User updateUser,User activeUser) {
		
		updateUser.setEmail(activeUser.getEmail());
		String[] loc = updateUser.getAddress().getLocation().split(",");
		System.out.println(loc);
		loc = (String[]) reverseArray(loc);
		if (loc.length >= 1)
			updateUser.getAddress().setCountry(loc[0]);
		if (loc.length >= 2)
			updateUser.getAddress().setState(loc[1]);
		if (loc.length >= 3)
			updateUser.getAddress().setCity(loc[2]);
		if (loc.length >= 4)
			updateUser.getAddress().setLocation(loc[3]);
		else
			updateUser.getAddress().setLocation(null);
		return userDao.updateProfile(updateUser);
	}
}
