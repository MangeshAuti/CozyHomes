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
		<c:forEach var="prop" items="${sessionScope.propList}">
		  <div class="row">
		     <div class="col-md-4">
		        <div class="img_div">
                    <img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="Property Image" class="thumbnail img-rounded img-responsive box-img prop_img" align="middle">
                </div>
		     </div>
		     <div class="col-md-8">
		        <div class="panel panel-primary prop_quick_view">
		           <div class="panel panel-heading"> <i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location}         
		           </div>
		           <div class="panel-body">
		              <span title="Accomodation For" class="prop_info"><i class="fa fa-user-circle-o fa-prop" aria-hidden="true"></i><span> ${prop.accomFor}</span>
		              </span>
		              <span title="Accomodation Type" class="prop_info"><i class="fa fa-users fa-prop" aria-hidden="true"></i> ${prop.accomType}</span>
		              <span title="Property Area" class="prop_info"><i class="fa fa-columns fa-prop" aria-hidden="true"></i> ${prop.area}</span><hr>
		              <span title="Rent" class="prop_info"><i class="fa fa-inr fa-prop" aria-hidden="true"></i> ${prop.rent}</span>
		              <span title="Deposite" class="prop_info"><i class="fa fa-money fa-prop" aria-hidden="true"></i> ${prop.deposite}</span><hr>
		              <span title="Furnishing Type" class="prop_info"><i class="fa fa-home fa-prop" aria-hidden="true"></i> ${prop.furnishType}</span>
		              <span  class="prop_info">
		                 <c:if test="${prop.accomType eq 'Shared'}">
		                   <span title="No of beds"> <i class="fa fa-bed fa-prop" aria-hidden="true"></i> ${prop.noBeds}</span>
		                 </c:if>
		                 <c:if test="${prop.accomType eq 'Private'}">
		                   <span title="No of Rooms"> <i class="fa fa-user-plus fa-prop" aria-hidden="true"></i> ${prop.noRooms}</span>
		                 </c:if>
		              </span>
		              <span title="location" class="prop_info"><i class="fa fa-location-arrow fa-prop" aria-hidden="true"></i> ${prop.address.location} ,${prop.address.city}</span>
		           </div>
		            <div class="panel-footer">
		               <span class="quickaction_bar">
			               <span class="glyphicon glyphicon-pencil quick_action_glyph" aria-hidden="true" data-toggle="modal" data-target="#${prop.propId}" ></span>
			               <span class="glyphicon glyphicon-trash quick_action_glyph" aria-hidden="true" ng-click="deleteProperty(${prop.propId})"></span> 
		               </span>   
		            </div>
		        </div>
		        <div id="${prop.propId}" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h5 class="modal-title">Update Property</h5>
					      </div>
					      <div class="modal-body">
					       		<form:form modelAttribute="property"  method="post" id="addproperty_form" enctype="multipart/form-data" class="form-horizontal">
				<div class="page-header">
					<h4 style="font-weight: bold; font-size: 22px;">Add Property Information</h4>
				</div>
				   <div class="form-group">
				      <label class="control-label col-sm-2" for="PropertyType">Property Type:</label>
				        <div class="col-sm-4">
				         <form:select path="propType" id="PropertyType" class="form-control" ng-model="PropertyType">
				        <option ng-repeat="x in PropertyTypes" value="{{x.type}}">{{x.type}}</option>
                        </form:select>
                        <form:errors path="propType" cssClass="error" />
				      </div>
				  </div>
			</form:form>
					       
					      </div>
					     <div class="modal-footer">
					        <button type="submit" class="btn btn-success" ng-click="updateProperty(${prop.propId})">Update</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					     </div>
					    </div>
					
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