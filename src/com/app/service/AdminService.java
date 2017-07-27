package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.AdminDao;
import com.app.pojos.Property;
import com.app.pojos.User;

@Service("admin_service")
@Transactional
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public boolean deleteProperty(int propId) {
		return adminDao.delProperty(propId);
	}

	public boolean updateVerificationStatusProperty(Property updateProperty) {
		if (updateProperty.isVerificationStatus() == true || updateProperty.isVerificationStatus() == false)
			return adminDao.updateVerificationStatus(updateProperty);
		else
			return false;
	}

	public List<User> showUserList() {
		return adminDao.showUsers();
	}

	public List<Property> showPropertyList(int start) {
		return adminDao.showproperties(start);
	}

	public boolean updateProperty(Property updateProperty) {

		return adminDao.updatePropety(updateProperty);
	}

}
