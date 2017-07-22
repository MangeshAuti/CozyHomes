<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app>
	<div class="container-fluid">
		<nav class="nav navbar-default">
			<div class="navbar-header">
				<a href="/"><img alt="Logo" src="images/logo.jpg"
					class="img-rounded" class="img-responsive"></a>
			</div>
			<ul class='nav nav-pills navbar-right'>
				<li ng-show='${sessionScope.activeUser}==null'><a href="account/login"><button type='button'
							class='btn btn-warning'>
							<span style="color: yellow;" class="glyphicon glyphicon-log-in"></span>
							Login
						</button></a></li>
				<li><a href="aboutUs">
						<button type='button' class='btn btn-warning'
							style="margin-right: 50px">
							<span style="color: yellow;" class="glyphicon glyphicon-eye-open"></span>
							About Us
						</button>
				</a></li>
			</ul>
		</nav>
		<div class="alert alert-info" >${requestScope.status}</div>
		<div style="margin:100px 0px 100px 0px;">
			<form action="search_property" method="POST">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="loc" style="color: green;">
							<span style="color: red;" class="glyphicon glyphicon-map-marker"></span>
								Select Location:
							</label> 
							<select class="form-control" id="loc">
								<span class="caret"></span>
								<c:forEach var="city" items="${requestScope.city}">
									<option value='${city}'>${city}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="space" style="color: green;"><span
								style="color: red;" class="glyphicon glyphicon-home"></span>
								Select Required Space:</label> <select class="form-control" id="space">
								<span class="caret"></span>
								<option>1BHK</option>
								<option>2BHK</option>
								<option>3BHK</option>
								<option>4BHK</option>
								<option>Entire House</option>
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="tenant" style="color: green;"><span
								style="color: red;" class="glyphicon glyphicon-user"></span>
								Select Tenant Type:</label> <select class="form-control" id="tenant">
								<span class="caret"></span>
								<option>Gentlemens</option>
								<option>Ladies</option>
								<option>Familt</option>
							</select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="acco" style="color: green;"><span
								style="color: red;" class="glyphicon glyphicon-link"></span>
								Select Accomodation Type:</label> <select class="form-control" id="acco">
								<span class="caret"></span>
								<option>Shared</option>
								<option>Private</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<button class="btn btn-warning search-btn" type="submit"
							id="search">
							<span style="color: yellow;" class="glyphicon glyphicon-search"></span>
							Search Property
						</button>
					</div>
				</div>
			</form>
		</div>
				<div class="row jumbotron">
					<div class="col-md-4">
						<label class="contact" style="color: red;"><u>Contact
								Us:</u></label> <label class="contact">Our Mailing Address:</br> B1/7
							Harmony Society, Nagras Road, Aundh, Pune</br> Pin - 411007
						</label>
					</div>
					<div class="col-md-4">
						<label class="contact">Our Contact Number: 7869641546</label> <label
							class="contact">Our Email Address: cozyhomesportal@gmail.com</label>
						<label class="copyright" style="color: grey;"> Copyright © 2017 CozyHomes Limited</label>
					</div>
					<div class="col-md-4">
						<label>Follow us on Social Media</label>
						<ul class="social">
							<li><a href="https://www.facebook.com/">Facebook</a></li>
							<li><a href="https://www.twitter.com/">Twitter</a></li>
							<li><a href="https://www.google.com/">google+</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

	</div>
</body>
</html>