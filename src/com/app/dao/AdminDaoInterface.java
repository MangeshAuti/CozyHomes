package com.app.dao;

import java.util.List;

import com.app.pojos.Property;
import com.app.pojos.User;

public interface AdminDaoInterface {

	boolean delProperty(int propId);

	boolean updateVerificationStatus(Property updateProperty);

	List<User> showUsers();

	List<Property> showproperties(int start);

	boolean updatePropety(Property updateProperty);

}