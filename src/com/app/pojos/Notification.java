package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="NOTIFICATIONS")
public class Notification {
	private int notificationId;
	@Length(max = 255)
	private String message;
	private String booktime;
	private int userId;
	private String fromUser;
	private String fromUserMobileNo;

	public Notification() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NOTIFICATION_ID")
	public Integer getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(Integer notificationId) {
		this.notificationId = notificationId;
	}

	@Column(name = "MESSAGE")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "BOOKDATE", length = 11)
	public String getBooktime() {
		return booktime;
	}

	public void setBooktime(String booktime) {
		this.booktime = booktime;
	}

	@Column(name = "USER_ID")
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "FROM_USER")
	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	@Column(name = "FR_MOBILE_NO", length = 12)
	public String getFromUserMobileNo() {
		return fromUserMobileNo;
	}

	public void setFromUserMobileNo(String fromUserMobileNo) {
		this.fromUserMobileNo = fromUserMobileNo;
	}

	@Override
	public String toString() {
		return "Notification [notificationId=" + notificationId + ", message=" + message + ", booktime=" + booktime
				+ ", userId=" + userId + ", fromUser=" + fromUser + ", fromUserMobileNo=" + fromUserMobileNo + "]";
	}
}
