package com.app.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "USERS")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int userId;
	private boolean active;
	@NotEmpty(message = "*Field Required")
	@Email(message = "* Invalid Email format")
	private String email;
	private String imageAdd;
	@Length(min = 10, max = 10, message = "* Mobile number must be 10 digit")
	private String mobileNo;
	@NotEmpty(message = "*Field Required")
	private String name;
	@Length(min = 6, max = 50, message = "* password must be min 6 character")
	private String password;
	private Date regDate;
	private String role;
	private String tempId;
	private List<Property> properties;
	private Address address = new Address();

	public User() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Type(type = "org.hibernate.type.NumericBooleanType")
	@Column(name = "ACTIVE_STATUS")
	public boolean getActive() {
		return this.active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@Column(length = 40, unique = true,name="EMAIL")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "IMAGE_ADD")
	public String getImageAdd() {
		return this.imageAdd;
	}

	public void setImageAdd(String imageAdd) {
		this.imageAdd = imageAdd;
	}

	@Column(name = "MOBILE_NO", length = 12)
	public String getMobileNo() {
		return this.mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Column(name = "NAME", length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "PASSWORD", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "REG_DATE")
	public Date getRegDate() {
		return this.regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Column(name = "ROLE", length = 5)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "TEMP_ID", length = 50)
	public String getTempId() {
		return this.tempId;
	}

	public void setTempId(String tempId) {
		this.tempId = tempId;
	}

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	public List<Property> getProperties() {
		return this.properties;
	}

	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}

	public Property addProperty(Property property) {
		properties.add(property);
		property.setUser(this);
		return property;
	}

	public Property removeProperty(Property property) {
		properties.remove(property);
		property.setUser(null);
		return property;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ADDR_ID")
	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", active=" + active + ", email=" + email + ", imageAdd=" + imageAdd
				+ ", mobileNo=" + mobileNo + ", name=" + name + ", password=" + password + ", regDate=" + regDate
				+ ", role=" + role + ", tempId=" + tempId + "]";
	}

}