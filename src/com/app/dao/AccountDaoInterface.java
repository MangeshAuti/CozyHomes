package com.app.dao;

import java.util.List;

import com.app.pojos.User;

public interface AccountDaoInterface {

	// validate user
	User validateUser(User user);

	// insert new user in users table
	boolean addUser(User user);

	// delete user from users table
	void removeUser(User user);

	// check email already available
	boolean checkEmail(String email);

	// change activation status of user set to 1 for active
	boolean activateAccount(String activateId);

	String forgotPassword(String email);

	User recoverPassword(String recoverId);

	boolean updatePassword(User activeForgotuser);

	// get all city available
	List<String> getCities();

}