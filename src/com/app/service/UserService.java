package com.app.service;

import static com.app.service.OwnerService.reverseArray;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.app.dao.AccountDaoInterface;
import com.app.dao.UserDao;
import com.app.jsonclasses.RequestJsonP;
import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;

@Service("user_service")
@Transactional
public class UserService implements UserServiceInterface {
	@Autowired
	UserDao userDao;

	@Autowired
	AccountDaoInterface accountDao;

	@Autowired
	ServletContext servlet;

	public boolean updateProfileImg(MultipartFile image, User activeUser) throws Exception {
		System.out.println(image.getContentType());
		String[] fileContent = image.getContentType().split("/");
		if (!(fileContent[1].equals("jpeg") || fileContent[1].equals("jpg") || fileContent.equals("png")))
			throw new Exception("Image format must be jpg,jpeg or png");
		if (image.getSize() > 20000000)
			throw new Exception("Maximum 19 Mb Image allowed");
		String path = servlet.getRealPath("/") + "/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		String imgPath = "/" + "profileImg_" + activeUser.getUserId() + ".jpg";
		File file = new File(path);
		try {
			FileUtils.writeByteArrayToFile(file, image.getBytes());
		} catch (IOException e) {

			e.printStackTrace();
			return false;
		}
		if (activeUser.getImageAdd() == null) {
			activeUser.setImageAdd(imgPath);
			return userDao.updateProfileImg(activeUser);
		}
		return true;
	}

	public boolean updateProfile(User updateUser, User activeUser) {
		try {
			if (updateUser.getAddress().getLocation() != null) {
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
			}
			activeUser.setName(updateUser.getName());
			activeUser.setMobileNo(updateUser.getMobileNo());
			return userDao.updateProfile(activeUser);
		} catch (Exception e) {
			System.out.println("in servicce exceptipn" + e.getMessage());
			return false;
		}
	}

	public boolean changePassword(RequestJsonP updateUser, User activeUser) {
		String oldP = DigestUtils.md5Hex(updateUser.getOldPassword());
		if (oldP.equals(activeUser.getPassword())) {
			activeUser.setPassword(DigestUtils.md5Hex(updateUser.getNewPassword()));
			return accountDao.updatePassword(activeUser);
		}
		return false;
	}

	public List<Property> getAllProperty(User user) {
		return userDao.getProperties(user);
	}

	public List<Property> getRequestedProperties(Search searchOpt, int start, User activeUser) {
		if (activeUser.getAddress() != null && activeUser.getAddress().getCity() != null)
			searchOpt.setCity(activeUser.getAddress().getCity());
		searchOpt.setStart(start);
		return userDao.getSearchProperties(searchOpt);
	}

	public Property getProperty(int propId) {
		return userDao.getProperty(propId);
	}

	public boolean bookVisit(RequestJsonP notidata, User activeUser) {
		Notification notification = new Notification();
		if (notidata.getBooktime() != null)
			notification.setBooktime(notidata.getBooktime().substring(0, 10));
		notification.setFromUser(activeUser.getName());
		notification.setFromUserMobileNo(activeUser.getMobileNo());
		notification.setMessage(notidata.getMsg());
		return userDao.sendMessage(notidata, notification);
	}

	public List<Property> getSearchProperties(Search searchOpt) {
		return userDao.getSearchProperties(searchOpt);
	}

}
