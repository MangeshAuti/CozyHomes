package com.app.service;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.AccountDaoInterface;
import com.app.pojos.Email;
import com.app.pojos.User;

@Service("account_service")
@Transactional
public class AccountService implements AccountServiceInterface {
	@Autowired
	private AccountDaoInterface accountDao;

	@Autowired
	private EmailServiceInterface emailService;

	final static String DOMAINNAME = "localhost";
	final static int PORTNO = 9090;

	public User validateUser(User user) {
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		User activeUser = accountDao.validateUser(user);
		if (activeUser != null)
			return activeUser;
		return null;
	}

	public User registerUser(User user) {
		try {
			user.setActive(false);
			user.setRole("u");
			user.setTempId(UUID.randomUUID().toString());
			user.setRegDate(new Date());
			user.setPassword(DigestUtils.md5Hex(user.getPassword()));
			if (accountDao.addUser(user))
				return user;
		} catch (Exception e) {

		}
		return null;
	}

	public void removeTempUser(User user) {
		accountDao.removeUser(user);
	}

	public boolean checkEmail(String email) {
		return accountDao.checkEmail(email);
	}

	public boolean sendActivationMail(User user) {
		Email email = new Email();
		email.setDestEmail(user.getEmail());
		email.setSubject("CozyHomes :Account Activation");
		email.setMessage("Dear " + user.getName() + ",\nFor activation of CozyHomes Account please "
				+ "<a href='http://" + DOMAINNAME + ":" + PORTNO + "/CozyHomes1/account/activate/" + user.getTempId()
				+ "'>click here</a>");
		if (emailService.sendMail(email))
			return true;
		return false;
	}

	public boolean sendForgotLink(String forgotemail) {
		String tempRecoverId = accountDao.forgotPassword(forgotemail);
		if (tempRecoverId != null) {
			Email email = new Email();
			email.setDestEmail(forgotemail);
			email.setSubject("CozyHomes :Password Recovery request");
			email.setMessage("Dear User, \nFor Recover Password of CozyHomes Account please " + "<a href='http://"
					+ DOMAINNAME + ":" + PORTNO + "/CozyHomes1//account/recoverPassword/" + tempRecoverId
					+ "'>click here</a>");
			if (emailService.sendMail(email))
				return true;
			return false;
		}
		return false;
	}

	public User recoverPasswordfromEmail(String recoverId) {
		return accountDao.recoverPassword(recoverId);

	}

	public boolean changePassword(String password, User user) {
		user.setPassword(DigestUtils.md5Hex(password));
		if (accountDao.updatePassword(user))
			return true;
		return false;
	}
	
	public boolean activateAccount(String activateId) {
		return accountDao.activateAccount(activateId);
	}

}
