package com.app.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.jsonclasses.RequestJsonP;
import com.app.pojos.Property;
import com.app.pojos.Search;
import com.app.pojos.User;

public interface UserServiceInterface {

	boolean updateProfileImg(MultipartFile image, User activeUser) throws Exception;

	boolean updateProfile(User updateUser, User activeUser);

	boolean changePassword(RequestJsonP updateUser, User activeUser);

	List<Property> getAllProperty(User user);

	List<Property> getRequestedProperties(Search searchOpt, int start, User activeUser);

	Property getProperty(int propId);

	boolean bookVisit(RequestJsonP notidata, User activeUser);

	List<Property> getSearchProperties(Search searchOpt);

}