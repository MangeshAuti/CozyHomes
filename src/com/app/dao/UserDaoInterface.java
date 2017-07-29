package com.app.dao;

import java.util.List;

import com.app.jsonclasses.RequestJsonP;
import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;

public interface UserDaoInterface {

	boolean updateProfileImg(User user);

	boolean updateProfile(User user);

	// show property for user home page
	List<Property> getProperties(User user);

	// show property using search criteria
	List<Property> getSearchProperties(Search searchOpt);

	Property getProperty(int propId);

	boolean sendMessage(RequestJsonP notiData, Notification notification);

}