<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

		</nav>
		<h2 align="center">${requestScope.status}</h2>
		<div class="col-md-4">
		</div>
		<div class="col-md-4" id="recoveryPassword_div" ng-controller="RecoverPController">
			<h3 id="response"></h3>
			<form method="post" id="password_recovery_form"
				ng-show="${sessionScope.activeForgotUser.email ne null}"
				ng-submit="setNewPassword()">
				<div class="page-header">
					<h4>Passsword Recovery Form</h4>
				</div>


				<div class="form-group">
					<label for="useremail">Email</label> 
					<input class="form-control" value="${sessionScope.activeForgotUser.email}" disabled="true" />

				</div>

				<div class="form-group">
					<label for="password">Password</label> 
					<input class="form-control"
						id="newpassword" type="password" placeholder="New Password"
						ng-model="mainpass" autofocus="true" required="true"/>
					<div id="passresponse"></div>
				</div>

				<div class="form-group">
					<label for="c_password">Confirm Password</label> 
					<input
						class="form-control" id="confirmpassword" type="password"
						placeholder="Confirm Password" ng-model="confpass" required="true"/> <span
						ng-show="mainpass!=confpass">Password have to match!</span>
				</div>

				<div id="response"></div>
				<input type="submit" class="btn btn-success" value="Register"
					name="submit">
			</form>
			<div class="respcontent" ng-show="showResp">{{ResponseContent}}</div>
		</div>
		</div>
</body>
</html>