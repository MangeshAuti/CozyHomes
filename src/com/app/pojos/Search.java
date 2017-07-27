package com.app.pojos;

public class Search {
private String city="pune";
private String accomFor="boy";
private String accomType="shared";
private int rent=10001;
private String propType="HK";
private int start=0;
public Search() {
	super();
}

@Override
public String toString() {
	return "Search [city=" + city + ", accomFor=" + accomFor + ", accomType=" + accomType + ", rent=" + rent
			+ ", propType=" + propType + ", start=" + start + "]";
}

public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getAccomFor() {
	return accomFor;
}
public void setAccomFor(String accomFor) {
	this.accomFor = accomFor;
}
public String getAccomType() {
	return accomType;
}
public void setAccomType(String accomType) {
	this.accomType = accomType;
}
public int getRent() {
	return rent;
}
public void setRent(int rent) {
	this.rent = rent;
}
public String getPropType() {
	return propType;
}
public void setPropType(String propType) {
	this.propType = propType;
}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
}

}
