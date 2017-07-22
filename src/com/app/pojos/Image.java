package com.app.pojos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Image {
	private int imageId;
	private String imageUrl;
	private Property property;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	@ManyToOne
	@JoinColumn
	public Property getProperty() {
		return property;
	}
	public void setProperty(Property property) {
		this.property = property;
	}
	
	
	@Override
	public String toString() {
		return "Images [imageId=" + imageId + ", imageUrl=" + imageUrl + ", property=" + property + "]";
	}
	
	
	

}
