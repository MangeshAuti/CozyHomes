package com.app.pojos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="PROPERTY")
public class Property implements Serializable {
	private static final long serialVersionUID = 1L;
	private int propId;

	@NotEmpty(message = "* Field Required")
	private String accomFor;

	@NotEmpty(message = "* Field Required")
	private String accomType;

	@NotEmpty(message = "* Field Required")
	private String area;

	@NotEmpty(message = "* Field Required")
	private String deposite;

	@NotEmpty(message = "* Field Required")
	private String furnishType;

	private List<Image> images = new ArrayList<>();

	private String noBeds;

	private String noRooms;

	@NotEmpty(message = "* Field Required")
	private String propType;

	@NotNull(message = "* Field Required")
	@Min(0)
	private int rent;

	private boolean status;// Deactive Status

	private Address address;

	private User user;

	private boolean verificationStatus;

	public Property() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROP_ID")
	public int getPropId() {
		return this.propId;
	}

	public void setPropId(int propId) {
		this.propId = propId;
	}

	@Column(name = "ACCOM_FOR", length = 10)
	public String getAccomFor() {
		return this.accomFor;
	}

	public void setAccomFor(String accomFor) {
		this.accomFor = accomFor;
	}

	@Column(name = "ACCOM_TYPE", length = 20)
	public String getAccomType() {
		return this.accomType;
	}

	public void setAccomType(String accomType) {
		this.accomType = accomType;
	}

	@Column(name = "AREA", length = 10)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "DEPOSITE", length = 15)
	public String getDeposite() {
		return this.deposite;
	}

	public void setDeposite(String deposite) {
		this.deposite = deposite;
	}

	@Column(name = "FURNISH_TYPE", length = 20)
	public String getFurnishType() {
		return this.furnishType;
	}

	public void setFurnishType(String furnishType) {
		this.furnishType = furnishType;
	}

	@Column(name = "NO_BEDS", length = 3)
	public String getNoBeds() {
		return this.noBeds;
	}

	public void setNoBeds(String noBeds) {
		this.noBeds = noBeds;
	}

	@Column(name = "NO_ROOMS", length = 3)
	public String getNoRooms() {
		return this.noRooms;
	}

	public void setNoRooms(String noRooms) {
		this.noRooms = noRooms;
	}

	@Column(name = "PROP_TYPE", length = 10)
	public String getPropType() {
		return this.propType;
	}

	public void setPropType(String propType) {
		this.propType = propType;
	}

	@Column(name = "RENT", length = 10)
	public int getRent() {
		return this.rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	@Type(type = "org.hibernate.type.NumericBooleanType")
	@Column(name = "DEACTIVE_STATUS")
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Type(type = "org.hibernate.type.NumericBooleanType")
	@Column(name = "VERIFICATION_STATUS")
	public boolean isVerificationStatus() {
		return verificationStatus;
	}

	public void setVerificationStatus(boolean verificationStatus) {
		this.verificationStatus = verificationStatus;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ADDR_ID")
	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "property", cascade = CascadeType.ALL)
	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> image) {
		this.images = image;
	}

	public Image addImage(Image image) {
		images.add(image);
		image.setProperty(this);

		return image;
	}

	public Image removeImage(Image image) {
		images.remove(image);
		image.setProperty(null);

		return image;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Property)
			return propId == ((Property) obj).propId;
		return false;
	}

	@Override
	public String toString() {
		return "Property [propId=" + propId + ", accomFor=" + accomFor + ", accomType=" + accomType + ", area=" + area
				+ ", deposite=" + deposite + ", furnishType=" + furnishType + ", image=" + images + ", noBeds=" + noBeds
				+ ", noRooms=" + noRooms + ", propType=" + propType + ", rent=" + rent + ", status=" + status
				+ ", address=" + address + "]";
	}

}