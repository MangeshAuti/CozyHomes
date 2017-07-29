<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="/master/meta.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="CozyApp">
<jsp:include page="/master/userNav.jsp" />
<div class="container prop_container" style="padding-top:30px;">
    <div ng-controller="MyPropertyController">
        <div class="responseMessage" ng-show="isLoaded">{{response}}</div>
        <c:if test="${sessionScope.propList.size() eq 0}">
			<div class="alert alert-info" align="center">
				You have not added any property yet.
			</div>
		</c:if>
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
		           <div class="panel panel-heading"> 
		           		<a href="<%=request.getContextPath()%>/owner/propertyDetails/${prop.propId}" style="color: floralwhite; text-decoration:none"> <i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location} </a>        
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
						      <input type="checkbox" novalidate="" ng-change="changePropertyStatus(${prop.propId})" ng-model="modelvalue[${prop.propId}]"  ng-init="modelvalue[${prop.propId}]=${prop.status}" checked="${prop.status}" >Deactivate-Property
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
</body>
</html>