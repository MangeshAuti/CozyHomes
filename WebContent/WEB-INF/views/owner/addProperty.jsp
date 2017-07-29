<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body background="<%=request.getContextPath()%>/images/banner.jpg">
	<div class="container-fluid" ng-app="myApp" ng-controller="myCtrl">
		<jsp:include page="/master/userNav.jsp" />	
		<c:if test="${requestScope.successStatus ne null }"><div class="alert alert-success " align="middle">${requestScope.successStatus}</div></c:if>
		<c:if test="${requestScope.status ne null }"><div class="alert alert-warning " align="middle" >${requestScope.status}</div></c:if>
		<div class="col-md-12" id="addproperty_tab">
        	<div class="page-header">
					<h4 style="font-weight: bold; font-size: 22px;">Add Property Information</h4>
			</div>
			<form:form modelAttribute="property"  method="post" id="addproperty_form" enctype="multipart/form-data" class="form-horizontal">
                <div class="col-md-6">  
                    <div class="form-group">
                        <div class="col-md-3">
                           <label class="control-label " for="PropertyType">Property Type:</label>
                        </div>
                        <div class="col-md-7">
                            <form:select path="propType" id="PropertyType" class="form-control" ng-init="PropertyType='1BHK'" ng-model="PropertyType" placeholder="Select Property Type" required="true">
                        <option ng-repeat="x in PropertyTypes" value="{{x.type}}">{{x.type}}</option>
                        </form:select>
                        <form:errors path="propType" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label" for="area">Area(sqft):</label>
                        </div>
                        <div class="col-md-7">          
                            <form:input  path="area" class="form-control" placeholder="Enter Area" required="true" type="number" min="0" max='99999'/>
                            <form:errors path="area" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-md-3">
                           <label class="control-label " for="FurnishingType">Furnishing Type:</label>
                        </div>   
                        <div class="col-md-7">
                            <form:select id="FurnishingType" path="furnishType" class="form-control" ng-init="FurnishingType='Full Furnished'" ng-model="FurnishingType" placeholder="Select Furnishing Type" required="true">
                            <form:option ng-repeat="x in FurnishingTypes" value="{{x.type}}">{{x.type}}</form:option>
                            </form:select>
                            <form:errors path="furnishType" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                           <label class="control-label" for="AccomodatonFor">Accomodation For:</label>
                        </div>
                        <div class="col-md-8">
                            <div class="checkbox-inline">
                                <label><input  type="radio"  path="accomFor" name="accomFor" value="boy" ng-model="boy"> Boy</label>
                            </div>
                            <div  class="checkbox-inline">
                                <label><input  type="radio" path="accomFor" name="accomFor" value="girl" ng-model="girl"> Girl</label>
                            </div>
                            <div  class="checkbox-inline">
                                <label><input  type="radio" path="accomFor" name="accomFor" value="family" ng-model="family"> family</label>
                            </div>
                       		 <form:errors path="accomFor" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">                        
                          <label class="control-label " for="AccomodationType">Accom. Type:</label>
                        </div>
                        <div class="col-md-7">
                        <form:select path="accomType" id="AccomodationType" class="form-control"  ng-model="AccType" ng-init="AccType='Shared'" placeholder="Select Accomodation Type" required="true">
                        	<option ng-repeat="x in AccomodationTypes" value="{{x.type}}">{{x.type}}</option>
                        </form:select>
                        </div>
                        <form:errors path="accomType" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <div  ng-if="AccType === 'Shared'">
                        	<div class="col-md-3">
                            	<label class="control-label " for="NoOfBeds">No Of Beds:</label>
                            </div>
                            <div class="col-md-7">
                                <form:select path="noBeds" id="NoOfBeds" class="form-control" >
                                    <option ng-repeat="x in Beds_Rooms" value="{{x.type}}">{{x.type}}</option>
                                    <form:errors path="noBeds" cssClass="error" />
                                </form:select>
                            </div>
                        </div>
                        <div  ng-if="AccType === 'Private'">
                        	<div class="col-md-3">
                            	<label class="control-label " for="NoOfRooms">No Of Rooms:</label>
                            </div>
                            <div class="col-md-7">
                                <form:select path="noRooms" id="NoOfRoomss" class="form-control" required="true" >
                                	<option ng-repeat="x in Beds_Rooms" value="{{x.type}}">{{x.type}}</option>
                                </form:select>
                                <form:errors path="noRooms" cssClass="error" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">                        
                           <label class="control-label " for="rent">Rent:</label>
                        </div>   
                        <div class="col-md-7">          
                        <form:input type="number" path="rent" class="form-control" placeholder="Enter Rent" min='0' max="35000" required="true"/>
                        <form:errors path="rent" cssClass="error" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">  		      
                    <div class="form-group">
                        <div class="col-md-3"> 
                            <label class="control-label " for="deposite">Deposite:</label>
                        </div>
                        <div class="col-md-7">          
                        <form:input type="number" class="form-control" path="deposite"  placeholder="Enter Deposite" min='0' max="99999" required="true"/>
                        <form:errors path="deposite" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3"> 
                           <label class="control-label " for="address">Address:</label>
                        </div>
                        <div class="col-md-7">  
                            <form:input id="autocomplete" path="address.location" class="form-control" placeholder="Enter your address"
                                    onFocus="geolocate()" type="text" required="true" maxlength='250'/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3"> 
                           <label class="control-label " for="address"></label>
                        </div>
                        <div class="col-md-7">  
                            <form:input path="address.street" class="form-control" placeholder="Address Line1"
                                    type="text" maxlength='100' />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3"> 
                            <label class="control-label " for="address">Upload Image 1:</label>
                        </div>    
                        <div class="col-md-7">  
                            <input type="file"  name="photos" class="form-control" value="Upload" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3"> 
                           <label class="control-label " for="address">Upload Image 2:</label>
                        </div>   
                        <div class="col-md-7">  
                            <input type="file" name="photos" class="form-control" value="Upload"/>
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-md-3"> 
                           <label class="control-label " for="address">Upload Image 3:</label>
                        </div>   
                        <div class="col-md-7">  
                            <input type="file" name="photos" class="form-control" value="Upload"/>
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-md-3"> 
                           <label class="control-label " for="address">Upload Image 4:</label>
                        </div>   
                        <div class="col-md-7">  
                            <input type="file" name="photos" class="form-control" value="Upload"/>
                        </div>
                    </div> 
       
                    <div class="col-md-10">
                        <button type="submit" class="btn btn-success pull-right">Submit</button>
                    </div>
                </div>
			</form:form>
		</div>
	</div>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCR6ppQ7ZheQRonKAU5h0xKuZkw7XU1Dp0&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>
</html>