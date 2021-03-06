<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app="CozyApp" background="<%=request.getContextPath()%>/images/banner.jpg">
	<div class="container-fluid">
		<nav class="nav navbar-default">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>/"
					class="navbar-brand"> <img alt="logo"
					src="<%=request.getContextPath()%>/images/logo.ico" width="30px"
					height="30px" style="display: inline-block"> <b>&nbsp;CozyHomes</b>
				</a>
			</div>
			<ul class="nav nav-pills navbar-right">
				<li id="pill_login"><a href="<%=request.getContextPath()%>/account/login"> Login</a></li>
				<li class="active"><a href="#"  id="pill_registration"
					style="margin-right: 50px">Register </a></li>
			</ul>
		</nav>
		<c:if test="${requestScope.status ne null }"><div class="alert alert-warning " >${requestScope.status}</div></c:if>
		<div class="col-md-3">
		</div>
		<div class="col-md-3" id="register_tab" ng-controller="RegController">
			<form:form modelAttribute="user" method="post" id="signup_form" name="regform">
				<div class="page-header">
					<h4>Registration</h4>
				</div>
				<div class="form-group">
					<label for="username">Name</label>
					<form:input path="name" class="form-control"  name="name" placeholder="Enter Name" autofocus="true" required="true" maxlength="30"/>
					<form:errors path="name" cssClass="error" />
				</div>

				<div class="form-group">
					<label for="useremail">Email</label>
					<form:input path="email" class="form-control" name="email" type="email" placeholder="Email Address" required="true" maxlength="39"/>
					<form:errors path="email" cssClass="error" />
				</div>

				<div class="form-group">
					<label for="m_password">Password</label> 
					<input class="form-control"  type="password"  placeholder="New Password" ng-model="mainpass" required="true" maxlength="20"/>
					<%-- <form:errors path="password" cssClass="error" /> --%>
				</div>

				<div class="form-group">
					<label for="c_password">Confirm Password</label>
					<form:input path="password" class="form-control"  name="cpassword" type="password"  placeholder="New Password" ng-model="confpass" required="true" maxlength="20"/>
					<form:errors path="password" cssClass="error" />
					<span ng-show="mainpass!=confpass">Password have to match!</span>		
				</div>

				<div class="form-group">
					<label for="mobile_no">Contact No</label>
					<form:input path="mobileNo" class="form-control"   name="mobile" placeholder="Contact No" required="true" type="number" min="1000000000" max="9999999999"/>
					<form:errors path="mobileNo" cssClass="error" />
				</div>

				<div id="response"></div>
				<button type="submit" class="btn btn-success" ng-disabled="regform.$invalid" name="submit">Register</button>
				
			</form:form>
		</div>
	</div>
</body>
</html>