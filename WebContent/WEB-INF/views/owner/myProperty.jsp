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
    <div ng-controller="RecoverPController">
		<c:forEach var="prop" items="${sessionScope.propList}">
		  <div class="row">
		     <div class="col-md-4">
		        <div class="img-responsive">
                    <img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="..." class="img-rounded img-responsive box-img" align="middle">
                </div>
		     </div>
		     <div class="col-md-8">
		        <div class="panel panel-primary prop_quick_view">
		           <div class="panel panel-heading"> <i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location}         
		           </div>
		           <div class="panel-body">
		              <span title="Accomodation For" class="prop_info"><i class="fa fa-user-circle-o fa-prop" aria-hidden="true"></i> ${prop.accomFor}</span>
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
		           </div>
		            <div class="panel-footer">
		               <span class="glyphicon glyphicon-thumbs-up quick_action_glyph" aria-hidden="true"></span>
		               <span class="glyphicon glyphicon-pencil quick_action_glyph" aria-hidden="true"></span>
		               <span class="glyphicon glyphicon-trash quick_action_glyph" aria-hidden="true"></span>    
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