<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<li class="active" id="pill_login"><a href="#"> Login</a></li>
				<li><a href="registration" id="pill_registration"
					style="margin-right: 50px">Register </a></li>
			</ul>
		</nav>
		<c:if test="${requestScope.successStatus ne null }"><div class="alert alert-success " width="500px" align="middle">${requestScope.successStatus}</div></c:if>
		<c:if test="${requestScope.status ne null }"><div class="alert alert-warning " width="500px" align="middle">${requestScope.status}</div></c:if>
		<div class="col-md-4">
		</div>
		<div class="col-md-3" id="login_tab" ng-controller="LoginController" >
			<form:form modelAttribute="user" method="post" id="signin_form">
				<div class="page-header">
					<h3>Login</h3>
				</div>
				<div class="form-group">
					<label for="useremail"><span class="glyphicon glyphicon-user"></span> Email</label>
					<form:input path="email" class="form-control" type="email" placeholder="Email Address" autofocus="true" required="true" maxlength='39'/>
					<form:errors path="email" cssClass="error" />
				</div>

				<div class="form-group">
					<label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label> 
					<form:input path="password" class="form-control"  type="password" placeholder="Enter Password" required="true" maxlength="20"/>
					<form:errors path="password" cssClass="error" />
				</div>
				<div Class="error">${requestScope.response}</div>

				<input type="submit" class="btn btn-primary" value="Log In" name="submit">
				&emsp;
				<a data-toggle="modal" href="#forgotModal" id="forgot_password" ng-click="showForm=true;ResponseContent=''">Forgot
					Password? Reset now</a>
			</form:form>
			<!--Forgot Model  -->
			<div class="modal fade" id="forgotModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Forgot Password</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form id="forgot_form" ng-submit="GetFogotPassResponse()"
								ng-show="showForm">
								<div class="form-group">
									<label for="email"><span
										class="glyphicon glyphicon-user"></span> Username</label> <input
										class="form-control" type="email" name=forgot_email
										id="forgot_email" placeholder="Enter Email" required="true"
										autofocus="true" ng-model="username" maxlength='39'/>
									<div id="wait"></div>
								</div>
								<input type="submit" class="btn btn-success" value="Reset Now"
									id="submit" name="btn" ng-disabled="showResetBtn">
								&emsp;

							</form>
							<div class="respcontent" ng-show="showResp">{{ResponseContent}}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>