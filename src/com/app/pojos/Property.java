package com.app.pojos;

import java.io.Serializable;
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

@Entity
public class Property implements Serializable {
	private static final long serialVersionUID = 1L;

	private int propId;

	private String accomFor;

	private String accomType;

	private String area;

	private String deposite;

	private String furnishType;

	private List<Image> image;

	private String noBeds;

	private String noRooms;

	private String propType;

	private int rent;
	
	private boolean status;

	private Address address;

	private User user;

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

	@Column(name = "ACCOM_FOR")
	public String getAccomFor() {
		return this.accomFor;
	}

	public void setAccomFor(String accomFor) {
		this.accomFor = accomFor;
	}

	@Column(name = "ACCOM_TYPE")
	public String getAccomType() {
		return this.accomType;
	}

	public void setAccomType(String accomType) {
		this.accomType = accomType;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDeposite() {
		return this.deposite;
	}

	public void setDeposite(String deposite) {
		this.deposite = deposite;
	}

	@Column(name = "FURNISH_TYPE")
	public String getFurnishType() {
		return this.furnishType;
	}

	public void setFurnishType(String furnishType) {
		this.furnishType = furnishType;
	}

	@Column(name = "NO_BEDS")
	public String getNoBeds() {
		return this.noBeds;
	}

	public void setNoBeds(String noBeds) {
		this.noBeds = noBeds;
	}

	@Column(name = "NO_ROOMS")
	public String getNoRooms() {
		return this.noRooms;
	}

	public void setNoRooms(String noRooms) {
		this.noRooms = noRooms;
	}

	@Column(name = "PROP_TYPE")
	public String getPropType() {
		return this.propType;
	}

	public void setPropType(String propType) {
		this.propType = propType;
	}

	public int getRent() {
		return this.rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToOne(mappedBy = "property", cascade = CascadeType.ALL)
	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@ManyToOne
	@JoinColumn(name = "User_Id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "property", cascade = CascadeType.ALL)
	public List<Image> getImage() {
		return image;
	}

	public void setImage(List<Image> image) {
		this.image = image;
	}

	public Image addImage(Image image) {
		getImage().add(image);
		image.setProperty(this);

		return image;
	}

	public Image removeProperty(Image image) {
		getImage().remove(image);
		image.setProperty(null);

		return image;
	}
}