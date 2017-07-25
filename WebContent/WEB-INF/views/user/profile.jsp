<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCR6ppQ7ZheQRonKAU5h0xKuZkw7XU1Dp0&libraries=places&callback=initAutocomplete"
	async defer>
</script>
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app="CozyApp">
	<div class="container-fluid" ng-controller="ProfileController">
		<jsp:include page="/master/userNav.jsp" />
		<div class="row">
		<div class="col-md-3">
		<h3>Update Profile</h3>
		&emsp;<a data-toggle="modal" href="#changePassModal" id="change_password"
			ng-click="showForm=true;ResponseContent=''">Change Password</a>
		</div>
		<div class="col-md-9">
		<c:if test="${requestScope.successStatus ne null }"><div class="alert alert-success ">${requestScope.successStatus}</div></c:if>
		<c:if test="${requestScope.status ne null }"><div class="alert alert-warning " >${requestScope.status}</div></c:if>
		</div>
		</div>
		<hr>
		<div class="row">
			<!-- left column -->
			<div class="col-md-3">
				<form:form modelAttribute="user" method="post"
					enctype="multipart/form-data" action="uploadProfilePic">
					<div class="text-center">
						<c:if test="${activeUser.imageAdd eq null }">
							<img src="<%=request.getContextPath()%>/images/profile.png"
								class="img-circle" alt="profile Image" width="150px"
								height="150px" />
						</c:if>
						<c:if test="${activeUser.imageAdd ne null }">
							<img src="<spring:url value='/${activeUser.imageAdd}'/>"
								alt="profile Image" class="img-circle" width="150px"
								height="150px">
						</c:if>
						</br> </br> <input type="file" id="image" class="form-control"
							value="Upload" name='file' /><br> <input type="submit"
							class="btn btn-primary" value="Upload" />
					</div>
				</form:form>
			</div>

			<!-- edit form column -->
			<div class="col-md-9 personal-info">
				<form:form modelAttribute="user" method="post"
					class="form-horizontal">
					<div class="form-group">
						<label class="col-lg-3 control-label">Name:</label>
						<div class="col-lg-7">
							<form:input type="text" class="form-control"
								value='${sessionScope.activeUser.name}'	path="name" />
							<form:errors path="name" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Email:</label>
						<div class="col-lg-7">
							<input class="form-control" type="text" disabled
								value='${sessionScope.activeUser.email}'>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Phone Number:</label>
						<div class="col-lg-7">
							<form:input class="form-control" type="text" maxlength='10'
								value='${sessionScope.activeUser.mobileNo}' path="mobileNo" />
							<form:errors path="mobileNo" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Address:</label>
						<div class="col-lg-7">
							<form:input id="autocomplete" class="form-control"
								placeholder="Enter your address" onFocus="geolocate()"
								type="text" path="address.location" />
							<form:errors path="address.location" cssClass="error" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label"></label>
						<div class="col-lg-7">
							<form:input class="form-control" placeholder="Address Line1"
								path="address.street" type="text" />
							<form:errors path="address.street" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input type="submit" class="btn btn-primary" value="Save Changes">
						</div>
					</div>
				</form:form>
			</div>
		</div>


		<!--change password Model  -->
		<div class="modal fade" id="changePassModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Change Password</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form id="changePassword_form" ng-submit="changePassword()"
							ng-show="showForm">
							<div class="form-group">
								<label for="Old Password"> Old Password</label> <input
									class="form-control" type="password"
									placeholder="Enter Old Password" autofocus="true"
									ng-model="oldpass" />
							</div>
							<div class="form-group">
								<label for="Old Password"> New Password</label> <input
									class="form-control" type="password"
									placeholder="Enter New Password" ng-model="mainpass" />
							</div>
							<div class="form-group">
								<label for="Old Password"> confirm Password</label> <input
									class="form-control" type="password"
									placeholder="Confirm Password" ng-model="confpass" /> <span
									ng-show="mainpass!=confpass">Password have to match!</span>
							</div>
							<input type="submit" class="btn btn-success"
								value="Change Password" id="submit" name="btn"
								ng-disabled="showResetBtn"> &emsp;
						</form>
						<div class="respcontent" ng-show="showResp">{{ResponseContent}}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>