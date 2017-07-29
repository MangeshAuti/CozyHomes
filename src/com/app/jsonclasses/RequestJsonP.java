package com.app.jsonclasses;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class RequestJsonP {

	@Email(message = "Invalid Email")
	private String forgot_email;
	@Length(min = 6, message = "Password must be greater than 6 character")
	private String newPassword;
	@Length(min = 6, message = "Password must be greater than 6 character")
	private String oldPassword;
	private int propId;
	private String msg;
	@NotEmpty
	private String booktime;

	public int getPropId() {
		return propId;
	}

	public void setPropId(int propId) {
		this.propId = propId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getBooktime() {
		return booktime;
	}

	public void setBooktime(String booktime) {
		this.booktime = booktime;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getForgot_email() {
		return forgot_email;
	}

	public void setForgot_email(String forgot_email) {
		this.forgot_email = forgot_email;
	}

}
