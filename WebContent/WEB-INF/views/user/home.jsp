<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/master/meta.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<body>
<div class="container">
<jsp:include page="/master/userNav.jsp" />	
<div class="row" style="padding-top:15px">
<form:form modelAttribute="search" method="POST" class="form-inline">
	<div class="form-group col-md-2">
		<label for="loc" style="color: green;">
			<span style="color: red;" class="glyphicon glyphicon-map-marker"></span>
		</label>
		<form:select path="city" class="form-control">
			<span class="caret"></span>
			<c:forEach var="ct" items="${sessionScope.city}">
			<c:if test="${searchOpt.city eq ct }">
				<option selected>
			</c:if>
			<c:if test="${searchOpt.city ne ct}">
				<option>
			</c:if>
			${ct}</option>
			</c:forEach>
		</form:select>
	</div>
	
	<div class="form-group col-md-2">
	<label for="space" style="color: green;">
	<span style="color: red;" class="glyphicon glyphicon-home"></span>
	</label> 
	<form:select class="form-control" path="propType">
			<span class="caret"></span>
			<c:forEach var="pt" items="HK,1BHK,2BHK,3BHK,4BHK,5BHK" >	
			<c:if test="${searchOpt.propType eq pt}">
				<option selected>
			</c:if>
			<c:if test="${searchOpt.propType ne pt}">
				<option>
			</c:if>
			${pt}</option>
			</c:forEach>
	</form:select>
	</div>
	
	<div class="form-group col-md-2">
		<label for="tenant" style="color: green;"><span
			style="color: red;" class="glyphicon glyphicon-user"></span>
			</label> <form:select class="form-control" path="accomFor">
			<span class="caret"></span>
			<c:forEach var="af" items="Boy,Girl,Family" >	
			<c:if test="${searchOpt.accomFor eq af}">
				<option selected>
			</c:if>
			<c:if test="${searchOpt.accomFor ne af}">
				<option>
			</c:if>
			${af}</option>
			</c:forEach>
		</form:select>
	</div>
	
	<div class="form-group col-md-2">
		<label for="acco" style="color: green;"><span
			style="color: red;" class="glyphicon glyphicon-link"></span>
			</label> <form:select class="form-control"
			path="accomType">
			<span class="caret"></span>
			<c:forEach var="at" items="Shared,Private,Entire House" >	
			<c:if test="${searchOpt.accomType eq at}">
				<option selected>
			</c:if>
			<c:if test="${searchOpt.accomType ne at}">
				<option>
			</c:if>
			${at}</option>
			</c:forEach>
		</form:select>
	</div>
	
	<div class="form-group col-md-2">
	<label style="color: green;">Rent: </label> 
	<form:input path="rent" type="range" min="500" max="15000" step="500"
							value="${searchOpt.rent}" onchange="updateTextInput(this.value);" />
	 <input  type="text" id="textInput" value="${searchOpt.rent}" disabled="true">
	 </div>
	 
	 <input type="submit" class="btn btn-primary col-md-2" value="Search"/>
</form:form>
</div>
<hr>

	<c:if test="${sessionScope.propList.size() eq 0}">
		<div class="alert alert-info" align="center">
				No Property Found
		</div>
	</c:if>
	<c:forEach var="prop" items="${sessionScope.propList}">
  	<div class="row">
  	
		<div class="col-md-4">
			<div class="img_div" style="height:257px !important">
				<c:if test="${prop.images[0] eq null}">
					<img src="<%=request.getContextPath()%>/images/propDefault.jpg" alt="Property Image" class="thumbnail img-rounded img-responsive box-img prop_img" align="middle">
				</c:if>
				<c:if test="${prop.images[0] ne null}">
		        	<img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="Property Image" class="thumbnail img-rounded img-responsive box-img prop_img" align="middle">
		      	</c:if>
		   	 </div>
	     </div>
	     <div class="col-md-8">
	        <div class="panel panel-primary prop_quick_view">
	         	 <div class="panel panel-heading"> 
	         	  	<a href="<%=request.getContextPath()%>/user/propertyDetails/${prop.propId}" class="img_link"><i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location} </a>   
         		 </div>     
		    	<div class="panel-body">
		              <span title="Accomodation For " class="prop_info${prop.propId} prof_info" id="accomFor"><i class="fa fa-user-circle-o fa-prop" aria-hidden="true"></i><span> ${prop.accomFor}</span>
		              </span>
		              <span title="Accomodation Type" class="prop_info${prop.propId} prof_info" id="accomType"><i class="fa fa-users fa-prop" aria-hidden="true"></i> ${prop.accomType}</span>
		              <span title="Property Area" class="prop_info${prop.propId} prof_info" id="area"><i class="fa fa-columns fa-prop" aria-hidden="true"></i> ${prop.area} Sqft</span><hr>
		              <span title="Rent" class="prop_info${prop.propId} prof_info" id="rent"><i class="fa fa-inr fa-prop" aria-hidden="true"></i> ${prop.rent} </span>
		              <span title="Deposite" class="prop_info${prop.propId} prof_info" id="deposite"><i class="fa fa-money fa-prop" aria-hidden="true"></i> ${prop.deposite}</span><hr>
		              <span title="Furnishing Type" class="prop_info${prop.propId} prof_info" id="furnishType"><i class="fa fa-home fa-prop" aria-hidden="true"></i> ${prop.furnishType}</span>
		              <span  class="prop_info">
		                 <c:if test="${prop.accomType eq 'Shared'}">
		                   <span title="No of beds"  class="prop_info${prop.propId}" id="noBeds"> <i class="fa fa-bed fa-prop" aria-hidden="true"></i> ${prop.noBeds}</span>
		                 </c:if>
		                 <c:if test="${prop.accomType eq 'Private'}">
		                   <span title="No of Rooms" class="prop_info${prop.propId}" id="noBeds"> <i class="fa fa-user-plus fa-prop" aria-hidden="true"></i> ${prop.noRooms}</span>
		                 </c:if>
		              </span>
		              <span title="location" class="prop_info${prop.propId} prof_info" id="location" ><i class="fa fa-location-arrow fa-prop" aria-hidden="true"></i> ${prop.address.location} ,${prop.address.city}</span>
		   		</div>
		    </div>   
		   </div>   
		   </div>  
		   <hr>
</c:forEach>

<c:if test="${sessionScope.startResultNo gt 0}">
	<a href="<%=request.getContextPath()%>/user/home/${sessionScope.startResultNo -5}" class="previous pull-left">&laquo; Previous</a>
</c:if>

<c:if test="${sessionScope.propList.size() ne 0}">
<a href="<%=request.getContextPath()%>/user/home/${sessionScope.startResultNo +5}" class="next pull-right">Next &raquo;</a>	
</c:if>
</div>
</body>
</html>