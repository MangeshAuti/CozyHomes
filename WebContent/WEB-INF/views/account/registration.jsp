<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app="CozyApp">
	<div class="container-fluid">
		<nav class="nav navbar-default">
			<div class="navbar-header">
				<div class="navbar-brand">
					<img alt="logo" src="<%=request.getContextPath()%>/images/logo.ico"
						width="30px" height="30px" style="display: inline-block"> <b>&nbsp;CozyHome</b>
				</div>
			</div>
			<ul class="nav nav-pills navbar-right">
				<li id="pill_login"><a href="<%=request.getContextPath()%>/account/login"> Login</a></li>
				<li class="active"><a href="#"  id="pill_registration"
					style="margin-right: 50px">Register </a></li>
			</ul>
		</nav>
		<h3 align="center">${requestScope.status}</h3>
		<div class="col-md-3" id="register_tab" ng-controller="RegController">
			<form:form modelAttribute="user" method="post" id="signup_form" name="regform">
				<div class="page-header">
					<h4>Registration</h4>
				</div>
				<div class="form-group">
					<label for="username">Name</label>
					<form:input path="name" class="form-control"  name="name" placeholder="Enter Name" />
					<form:errors path="name" cssClass="error" />
				</div>

				<div class="form-group">
					<label for="useremail">Email</label>
					<form:input path="email" class="form-control" name="email" type="email" placeholder="Email Address" />
					<form:errors path="email" cssClass="error" />
				</div>

				<div class="form-group">
					<label for="m_password">Password</label> 
					<input class="form-control"  type="password"  placeholder="New Password" ng-model="mainpass"/>
					<%-- <form:errors path="password" cssClass="error" /> --%>
				</div>

				<div class="form-group">
					<label for="c_password">Confirm Password</label>
					<form:input path="password" class="form-control"  name="cpassword" type="password"  placeholder="New Password" ng-model="confpass"/>
					<form:errors path="password" cssClass="error" />
					<span ng-show="mainpass!=confpass">Password have to match!</span>		
				</div>

				<div class="form-group">
					<label for="mobile_no">Contact No</label>
					<form:input path="mobileNo" class="form-control"   name="mobile" placeholder="Contact No" />
					<form:errors path="mobileNo" cssClass="error" />
				</div>

				<div id="response"></div>
				<button type="submit" class="btn btn-success" ng-disabled="regform.$invalid" name="submit">Register</button>
				
			</form:form>
		</div>
	</div>
</body>
</html>