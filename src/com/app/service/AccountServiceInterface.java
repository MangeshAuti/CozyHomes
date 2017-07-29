package com.app.service;

import com.app.pojos.User;

public interface AccountServiceInterface {

	// validate user service
	User validateUser(User user);

	User registerUser(User user);

	void removeTempUser(User user);

	boolean checkEmail(String email);

	boolean sendActivationMail(User user);

	boolean sendForgotLink(String forgotemail);

	User recoverPasswordfromEmail(String recoverId);

	boolean changePassword(String password, User user);

	boolean activateAccount(String activateId);

}