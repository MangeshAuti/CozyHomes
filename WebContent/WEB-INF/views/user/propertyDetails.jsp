<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app="CozyApp">
<jsp:include page="/master/userNav.jsp" />
<c:if test="${prop eq null }">
<c:redirect url="/"></c:redirect>
</c:if>
<!-- Carousel property Images-->
<div class="row top_cont">
<div class="col-md-1">
</div>
	<div class="col-md-7">
 		 <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>

		    <!-- Wrapper for slides -->
		    <div class="carousel-inner show_prop_detail">
		      <div class="item active">
		      	<c:if test="${prop.images[0] eq null}">
					<img src="<%=request.getContextPath()%>/images/propDefault.jpg" alt="screen1" style="width:100%;height:70%">
				</c:if>
				<c:if test="${prop.images[0] ne null}">
		        	<img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="Property Image" style="width:100%;height:70%">
		      	</c:if>
		      </div>
				<c:forEach var="img" items="${prop.images}">
			      <div class="item">
			        <img src="<spring:url value='/${img.imageUrl}'/>" alt="Property Image" style="width:100%;height:70%">
			      </div>
			      <div class="carousel-caption">
        			${prop.propType} in ${prop.address.city}
        			<div class="pull-right">
        			<c:if test="${prop.verificationStatus eq true}">
			        	<img src="<%=request.getContextPath()%>/images/verified.jpg"
						class="img-circle" alt="profile Image" width="50px"
						height="50px" />
					</c:if></div>
      			</div>
		    	</c:forEach>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
  </div>
  </div>
  <!-- owner info -->
  <div class="col-md-3">
  	<div class="panel panel-info">
 		<div class="panel-heading" align="middle">OWNER</div>
		<div class="panel-body" align="middle">
			<c:if test="${prop.user.imageAdd eq null }">
				<img src="<%=request.getContextPath()%>/images/profile.png"
					class="img-circle" alt="profile Image" width="150px"
					height="150px" />
			</c:if>
			<c:if test="${prop.user.imageAdd ne null }">
				<img src="<spring:url value='/${prop.user.imageAdd}'/>"
					alt="profile Image" class="img-circle" width="150px"
					height="150px">
			</c:if><br><br>
			 ${prop.user.name}
			 <hr>
			<span class="glyphicon glyphicon-envelope"> ${prop.user.email}</span>
			 <hr>
			<span class="glyphicon glyphicon-earphone"> ${prop.user.mobileNo}</span>
			<hr>
			<span class="glyphicon glyphicon-map-marker"> ${prop.user.address.location} ${prop.user.address.city}</span>
		</div>
	</div>
	</div>
	</div>
	<div class="col-md-1"></div>
	<br><br>
<div class="row">
<div class="col-md-1"></div>
<!-- property info -->
<div class="col-md-7">
<div class="panel panel-success">
 		<div class="panel-heading" align="middle">PROPERTY INFORMATION</div>
		<div class="panel-body">
			Property Type :${prop.propType}<hr>
			Area (SqFt):${prop.area}<hr>
			Address:${prop.address.street}<br>
			${prop.address.location} ${prop.address.city} ${prop.address.state} ${prop.address.country}<hr>
			Furnishing Type :${prop.furnishType}<hr>
			Rent :${prop.rent}<hr>
			Deposit :${prop.deposite}<hr>
			Accommodation For:${prop.accomFor}<hr>
			Accommodation Type:${prop.accomType}<hr>
			
			<c:if test="${prop.accomType eq 'Shared' }">
				No of Beds Available:${prop.noBeds}<hr>
			</c:if>
			<c:if test="${prop.accomType eq 'Private' }">
				No of Rooms Available:${prop.noRooms}<hr>
			</c:if>
		</div>
	</div>
</div>
<div class="col-md-3" ng-controller="MyPropertyController">
<c:if test="${prop.user.userId ne sessionScope.activeUser.userId}">
<div class="panel panel-warning">
	<div class="panel-heading" align="middle">BOOK VISIT</div>
		<div class="panel-body">
		<form class="form" ng-submit="sendMessage(${prop.propId})">
			<input type="date" class="form-control" ng-model="booktime" min="{{today | date:'yyyy-MM-dd'}}"  required><hr>
			<span class="glyphicon glyphicon-pencil" ></span><input type="text" ng-model="message" placeholder="Your message here" class="form-control" maxlength="150"><hr>
			<button type="submit" class="btn btn-primary" >Book</button>
		</form>
		 <div class="responseMessage" ng-show="isLoaded">{{response}}</div>
		</div>
</div>
</c:if>
</div>
</div>
</div>
</body>
</html>