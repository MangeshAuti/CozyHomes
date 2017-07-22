package com.app.jsonclasses;

public class ResponseJson 
{
private String message;
private boolean status;
private String errorMessage;
private String errorCode;
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public boolean isStatus() {
	return status;
}
public void setStatus(boolean status) {
	this.status = status;
}
public String getErrorMessage() {
	return errorMessage;
}
public void setErrorMessage(String errorMessage) {
	this.errorMessage = errorMessage;
}
public String getErrorCode() {
	return errorCode;
}
public void setErrorCode(String errorCode) {
	this.errorCode = errorCode;
}
}
