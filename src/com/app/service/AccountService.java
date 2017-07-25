package com.app.service;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.AccountDao;
import com.app.pojos.Email;
import com.app.pojos.User;

@Service("account_service")
@Transactional
public class AccountService {
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private EmailService emailService;

	final static String DOMAINNAME = "localhost";
	final static int PORTNO = 9090;

	@Transactional(readOnly = true)
	public User validateUser(User user) {
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		User activeUser = accountDao.validateUser(user);
		if (activeUser != null) 
			return activeUser;
		return null;
	}

	public User registerUser(User user) {
		String tempUUID = UUID.randomUUID().toString();
		user.setActive(false);
		user.setRole("u");
		user.setTempId(tempUUID);
		user.setRegDate(new Date());
		System.out.println("inside reg"+user.getPassword());
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		if (accountDao.addUser(user))
		{
			System.out.println("after add property in service"+user);
			return user;
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
