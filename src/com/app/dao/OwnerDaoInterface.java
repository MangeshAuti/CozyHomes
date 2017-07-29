package com.app.dao;

import java.util.List;

import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.User;

public interface OwnerDaoInterface {

	boolean insertProperty(Property property, User user);

	int addProperty(Property property);

	List<Property> getPropertyList(User user);

	boolean delProperty(int propId, int userId);

	boolean updatePropety(Property updateProperty, User propertyOwner);

	boolean statusUpdateOfProperty(Property updateProperty, int userId);

	List<Notification> getNotification(User user);

}