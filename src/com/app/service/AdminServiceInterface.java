package com.app.service;

import java.util.List;

import com.app.pojos.Property;
import com.app.pojos.User;

public interface AdminServiceInterface {

	boolean deleteProperty(int propId);

	boolean updateVerificationStatusProperty(Property updateProperty);

	List<User> showUserList();

	List<Property> showPropertyList(int start);

	boolean updateProperty(Property updateProperty);

}