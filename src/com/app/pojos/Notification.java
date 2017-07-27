package com.app.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Notification {
	private int notificationId;
	private String message;
	private String booktime;
	private int userId;
	private String fromUser;
	private String fromUserMobileNo;
	
	public Notification() {
		
	}


	@Override
	public String toString() {
		return "Notification [notificationId=" + notificationId + ", message=" + message + ", booktime=" + booktime
				+ ", userId=" + userId + ", fromUser=" + fromUser + ", fromUserMobileNo=" + fromUserMobileNo + "]";
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getNotificationId() {
		return notificationId;
	}
	public void setNotificationId(Integer notificationId) {
		this.notificationId = notificationId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getBooktime() {
		return booktime;
	}

	public void setBooktime(String booktime) {
		this.booktime = booktime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getFromUserMobileNo() {
		return fromUserMobileNo;
	}

	public void setFromUserMobileNo(String fromUserMobileNo) {
		this.fromUserMobileNo = fromUserMobileNo;
	}
	
	
}
