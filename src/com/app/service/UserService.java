package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.UserDao;
import com.app.pojos.User;

@Service("user_service")
@Transactional
public class UserService {
	@Autowired
	UserDao userDao;
	
	public boolean uploadProfilePic(User user)
	{
		return userDao.uploadPic(user);
	}
}
