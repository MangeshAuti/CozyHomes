package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Email;

@Service("email_service")
@Transactional
public class EmailService implements EmailServiceInterface {

	@Autowired
	private JavaMailSender sender;

	public boolean sendMail(Email email) {
		try {
			SimpleMailMessage mesg = new SimpleMailMessage();
			mesg.setTo(email.getDestEmail());
			mesg.setSubject(email.getSubject());
			mesg.setText(email.getMessage());
			sender.send(mesg);
			return true;
		} catch (MailException e) {
			return false;
		}
	}

}
