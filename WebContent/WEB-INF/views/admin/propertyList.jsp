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
<style>
a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}

a:hover {
    background-color: #ddd;
    color: black;
}

.previous {
    background-color: #f1f1f1;
    color: black;
}

.next {
    background-color: #4CAF50;
    color: white;
}

.round {
    border-radius: 50%;
}
</style>
</head>
<body ng-app="CozyApp">
<nav class="nav navbar-default">
		<div class="col-md-3">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>/" class="navbar-brand">
					<img alt="logo" class="logo"
					src="<%=request.getContextPath()%>/images/logo.ico" width="30px"
					height="30px" style="display: inline-block"> <b>&nbsp;CozyHomes</b>&emsp;<small>Admin</small>
				</a>
			</div>
		</div>
		<div class="col-md-9 navlinks">
				<ul class="nav nav-pills navbar-right">
					<li>
						<a href="<%=request.getContextPath()%>/admin/home">Home</a>
					<li>
					<li class="active">
						<a href="<%=request.getContextPath()%>/admin/propertyList/0" class="active">Properties</a>
					<li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/userList" >Users</a>
					<li>
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="user" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user" style="color:green;"></span>
								${sessionScope.activeAdmin.name} <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="user">
								<li><a href="<%=request.getContextPath()%>/account/logout">Logout</a></li>
							</ul>
						</div>
					</li>
				</ul>
		</div>	
  </nav>
<!-- Property List -->
<c:if test="${sessionScope.propList.size() eq 0}">
	<div class="alert alert-info"  align="center" style="margin:10px 100px 10px 100px">
		Property Not Available
	</div>
</c:if>
<div class="container prop_container" style="padding-top:30px;">
    <div ng-controller="AdminController">
        <div class="responseMessage" ng-show="isLoaded">{{response}}</div>
		<c:forEach var="prop" items="${sessionScope.propList}">
		  <div class="row">
		     <div class="col-md-4">
		     <c:if test="${prop.images[0] eq null}">
					<img src="<%=request.getContextPath()%>/images/propDefault.jpg" alt="Property Image" class="thumbnail img-rounded img-responsive box-img prop_img" align="middle">
				</c:if>
				<c:if test="${prop.images[0] ne null}">
		        <div class="img_div">
                    <img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="Property Image" class="thumbnail img-rounded img-responsive box-img prop_img" align="middle">
                </div>
                </c:if>
		     </div>
		     <div class="col-md-8">
		        <div class="panel panel-primary prop_quick_view">
		           <div class="panel panel-heading" style="padding:0px 15px !important">
		           		<a href="<%=request.getContextPath()%>/admin/propertyDetails/${prop.propId}" class="img_link"><i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location} </a>        
		           </div>
		           <div class="panel-body">
		              <span title="Accomodation For " class="prop_info${prop.propId} prof_info" id="accomFor"><i class="fa fa-user-circle-o fa-prop" aria-hidden="true"></i><span> ${prop.accomFor}</span>
		              </span>
		              <span title="Accomodation Type" class="prop_info${prop.propId} prof_info" id="accomType"><i class="fa fa-users fa-prop" aria-hidden="true"></i> ${prop.accomType}</span>
		              <span title="Property Area" class="prop_info${prop.propId} prof_info" id="area"><i class="fa fa-columns fa-prop" aria-hidden="true"></i> ${prop.area} Sqft</span><hr>
		              <span title="Rent" class="prop_info${prop.propId} prof_info" id="rent"><i class="fa fa-inr fa-prop" aria-hidden="true"></i><span class="edit_prop" contenteditable> ${prop.rent} </span></span>
		              <span title="Deposite" class="prop_info${prop.propId} prof_info" id="deposite"><i class="fa fa-money fa-prop" aria-hidden="true"></i><span class="edit_prop" contenteditable> ${prop.deposite}</span></span><hr>
		              <span title="Furnishing Type" class="prop_info${prop.propId} prof_info" id="furnishType"><i class="fa fa-home fa-prop" aria-hidden="true"></i> ${prop.furnishType}</span>
		              <span  class="prop_info">
		                 <c:if test="${prop.accomType eq 'Shared'}">
		                   <span title="No of beds"  class="prop_info${prop.propId}" id="noBeds"> <i class="fa fa-bed fa-prop" aria-hidden="true"></i><span class="edit_prop" contenteditable> ${prop.noBeds}</span></span>
		                 </c:if>
		                 <c:if test="${prop.accomType eq 'Private'}">
		                   <span title="No of Rooms" class="prop_info${prop.propId}" id="noRooms"> <i class="fa fa-user-plus fa-prop" aria-hidden="true"></i><span class="edit_prop" contenteditable> ${prop.noRooms}</span></span>
		                 </c:if>
		              </span>
		              <span title="location" class="prop_info${prop.propId} prof_info" id="location" ><i class="fa fa-location-arrow fa-prop" aria-hidden="true"></i> ${prop.address.location} ,${prop.address.city}</span>
		           </div>
		            <div class="panel-footer">
		               <form class="pull-left">
						    <label class="checkbox-inline">
						      <input type="checkbox" novalidate="" ng-change="changePropertyStatus(${prop.propId})" ng-model="modelvalue[${prop.propId}]" ng-init="modelvalue[${prop.propId}]=${prop.verificationStatus}">Verification-Status
						    </label>
					   </form>    
		               <span class="quickaction_bar">
			               <span class="glyphicon glyphicon-ok quick_action_glyph" aria-hidden="true" ng-click="updateProperty(${prop.propId})"></span>
			               <span class="glyphicon glyphicon-trash quick_action_glyph" aria-hidden="true" ng-click="deleteProperty(${prop.propId})"></span> 
		               </span>   
		            </div>
		        </div>
		        
		     </div>
		  </div>                  
		</c:forEach>
	</div>
	<div class="respcontent" ng-show="showResp">{{ResponseContent}}</div>
</div>	
<c:if test="${sessionScope.startResultNo gt 0}">
	<a href="<%=request.getContextPath()%>/admin/propertyList/${sessionScope.startResultNo -5}" class="previous pull-left">&laquo; Previous</a>
</c:if>

<c:if test="${sessionScope.propList.size() ne 0}">
<a href="<%=request.getContextPath()%>/admin/propertyList/${sessionScope.startResultNo +5}" class="next pull-right">Next &raquo;</a>
</c:if>
</body>
</html>