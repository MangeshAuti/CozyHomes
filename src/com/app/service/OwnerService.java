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
import com.app.pojos.Image;
import com.app.pojos.Property;
import com.app.pojos.User;

@Service("owner_service")
@Transactional
public class OwnerService {
	@Autowired
	private OwnerDao ownerDao;

	@Autowired
	ServletContext servlet;

	public static Object[] reverseArray(Object[] arr) {
		List<Object> list = Arrays.asList(arr);
		Collections.reverse(list);
		return list.toArray();
	}

	public User addProperty(Property property, User activeUser, MultipartFile[] photos) {
		property.setStatus(true);
		String[] loc = property.getAddress().getLocation().split(",");
		System.out.println(loc);
		loc = (String[]) reverseArray(loc);
		if (loc.length >= 1)
			property.getAddress().setCountry(loc[0]);
		if (loc.length >= 2)
			property.getAddress().setState(loc[1]);
		if (loc.length >= 3)
			property.getAddress().setCity(loc[2]);
		if (loc.length >= 4)
			property.getAddress().setLocation(loc[3]);
		else
			property.getAddress().setLocation(null);
		property.setUser(activeUser);
		// activeUser.addProperty(property);
		ownerDao.addProperty(property);
		int i = 0;
		for (MultipartFile p : photos) {
			String path = servlet.getRealPath("/") + "/" + property.getPropId() + "_" + i + ".jpg";
			Image img = new Image();
			img.setImageUrl("/" + property.getPropId() + "_" + i + ".jpg");
			property.addImage(img);
			File file = new File(path);
			try {
				FileUtils.writeByteArrayToFile(file, p.getBytes());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i++;
		}
		if (ownerDao.insertProperty(property, activeUser))
			return activeUser;
		return null;

	}

	public List<Property> getAllRegisterProperty(User u) {
		List<Property> ls = ownerDao.getPropertyList(u);
		return ls;
	}

	public boolean deleteProperty(int propId, int userId) {
		return ownerDao.delProperty(propId, userId);

	}

	public boolean updateProperty(Property updateProperty, int userId) {
		return ownerDao.updatePropety(updateProperty, userId);

	}

	public boolean statusUpdateOfProperty(Property updateProperty, int userId) {
		if (updateProperty.isStatus() == true || updateProperty.isStatus() == false)
			return ownerDao.statusUpdateOfProperty(updateProperty, userId);
		else
			return false;

	}
}
