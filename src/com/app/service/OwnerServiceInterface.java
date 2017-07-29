package com.app.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.pojos.Notification;
import com.app.pojos.Property;
import com.app.pojos.User;

public interface OwnerServiceInterface {

	User addProperty(Property property, User activeUser, MultipartFile[] photos) throws Exception;

	List<Property> getAllRegisterProperty(User u);

	boolean deleteProperty(int propId, int userId);

	boolean updateProperty(Property updateProperty, User activeUser);

	boolean statusUpdateOfProperty(Property updateProperty, int userId);

	List<Notification> getNotification(User user);

}