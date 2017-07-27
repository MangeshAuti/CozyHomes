<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/master/meta.jsp" />
</head>
<body background="<%=request.getContextPath()%>/images/banner.jpg">
	<div class="container">
		<nav class="nav navbar-default">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>/"><img alt="Logo" src="images/logo.jpg"
					class="img-rounded" class="img-responsive"></a>
			</div>
			<ul class='nav nav-pills navbar-right'>
				<li><a href="account/login"><button type='button'
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
		<c:if test="${requestScope.status ne null}">
		<div class="alert alert-info" >${requestScope.status}</div>
		</c:if>
		<div style="margin:100px 0px 100px 0px;">
		
			<form:form modelAttribute="search" action="search/0" method="POST">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="loc" style="color: green;">
							<span style="color: red;" class="glyphicon glyphicon-map-marker"></span>
								Select Location:
							</label> 
							<form:select class="form-control" path="city">
								<span class="caret"></span>
								<c:forEach var="city" items="${requestScope.city}">
									<option value='${city}'>${city}</option>
								</c:forEach>
							</form:select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="space" style="color: green;"><span
								style="color: red;" class="glyphicon glyphicon-home"></span>
								Select Required Space:</label> <form:select class="form-control" path="propType">
								<span class="caret"></span>
								<option>HK</option>
								<option>1BHK</option>
								<option>2BHK</option>
								<option>3BHK</option>
								<option>4BHK</option>
								<option>Any BHK</option>
							</form:select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="tenant" style="color: green;"><span
								style="color: red;" class="glyphicon glyphicon-user"></span>
								Select Tenant Type:</label> <form:select class="form-control" path="accomFor">
								<span class="caret"></span>
								<option>Boy</option>
								<option>Girl</option>
								<option>Family</option>
							</form:select>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="acco" style="color: green;">
							<span style="color: red;" class="glyphicon glyphicon-link"></span>
								Select Accomodation Type:
							</label> 
							<form:select class="form-control" path="accomType">
								<span class="caret"></span>
								<option>Shared</option>
								<option>Private</option>
								<option>Entire House</option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<button class="btn btn-warning search-btn" type="submit">
						<span style="color: yellow;" class="glyphicon glyphicon-search"></span>
							Search Property
						</button>
					</div>
				</div>
			</form:form>
		</div>
		<jsp:include page="/master/footer.jsp" />		
</div>
	
</body>
</html>