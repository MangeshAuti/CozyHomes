package com.app.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.app.dao.AccountDao;
import com.app.dao.OwnerDao;
import com.app.dao.UserDao;
import com.app.jsonclasses.RequestJsonP;
import com.app.pojos.Address;
import com.app.pojos.Image;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;
import static com.app.service.OwnerService.*;
@Service("user_service")
@Transactional
public class UserService {
	@Autowired
	UserDao userDao;
	
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	ServletContext servlet;

	public boolean updateProfileImg(MultipartFile image, User activeUser) {
		String path = servlet.getRealPath("/") + "/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		String imgPath="/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		File file = new File(path);
		try {
			FileUtils.writeByteArrayToFile(file, image.getBytes());
		} catch (IOException e) {
		
			e.printStackTrace();
			return false;
		}
		if(activeUser.getImageAdd()==null)
		{
			activeUser.setImageAdd(imgPath);
			return userDao.updateProfileImg(activeUser);
		}
		return true;
	}

	public boolean updateProfile(User updateUser,User activeUser) {
		try{
		String[] loc = updateUser.getAddress().getLocation().split(",");
		System.out.println(loc);
		loc = (String[]) reverseArray(loc);
		if (loc.length >= 1)
			activeUser.getAddress().setCountry(loc[0]);
		if (loc.length >= 2)
			activeUser.getAddress().setState(loc[1]);
		if (loc.length >= 3)
			activeUser.getAddress().setCity(loc[2]);
		if (loc.length >= 4)
			activeUser.getAddress().setLocation(loc[3]);
		else
			activeUser.getAddress().setLocation(null);
		activeUser.setName(updateUser.getName());
		activeUser.setMobileNo(updateUser.getMobileNo());
		return userDao.updateProfile(activeUser);
		}catch(Exception e)
		{
			System.out.println("in servicce exceptipn"+e.getMessage());
			return false;
		}
	}

	public boolean changePassword(RequestJsonP updateUser, User activeUser) {
		String oldP=DigestUtils.md5Hex(updateUser.getOldPassword());
		if(oldP.equals(activeUser.getPassword()))
		{
			activeUser.setPassword(DigestUtils.md5Hex(updateUser.getNewPassword()));
			return accountDao.updatePassword(activeUser);
		}
		return false;
	}

	public List<Property> getAllProperty(User user) {
		return userDao.getProperties(user);
	}

	
}
