package com.app.pojos;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
	private int addrId;

	private String location;
	
	private String city;

	private String state;

	private String country;

	private String street;
	/*private Property property;*/
	
	/*private User user;*/

	public Address() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ADDR_ID")
	public int getAddrId() {
		return addrId;
	}

	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(length = 30)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(length = 30)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(length = 30)
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}


	
	/*@OneToOne
	@JoinColumn(name="propId")
	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}
*/
	
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	@Override
	public String toString() {
		return "Address [addrId=" + addrId + ", location=" + location + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", street=" + street + "]";
	}

	

	
}