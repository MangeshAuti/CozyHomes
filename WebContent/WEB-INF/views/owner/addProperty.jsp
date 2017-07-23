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
 </style>
</head>
<body>
	<div class="container-fluid" ng-app="myApp" ng-controller="myCtrl">
		<jsp:include page="/master/userNav.jsp" />	
		<h4>${requestScope.status}</h4>
		property id<h4>${sessionScope.propId}</h4>
		<div class="col-md-16" id="addproperty_tab">
			<form:form modelAttribute="property"  method="post" id="addproperty_form" class="form-horizontal">
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
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="area">Area(sqft):</label>
			      <div class="col-sm-4">          
			        <form:input  path="area" class="form-control" placeholder="Enter Area" />
			        <form:errors path="area" cssClass="error" />
			     </div>
			     </div>
			      <div class="form-group">
				      <label class="control-label col-sm-2" for="FurnishingType">Furnishing Type:</label>
				        <div class="col-sm-4">
				       <form:select id="FurnishingType" path="furnishType" class="form-control" ng-model="FurnishingType">
				        <form:option ng-repeat="x in FurnishingTypes" value="{{x.type}}">{{x.type}}</form:option>
                        </form:select>
                         <form:errors path="furnishType" cssClass="error" />
				      </div>
				  </div>
				  <div class="form-group">
				  	<label class="control-label col-sm-2" for="AccomodatonFor">Accomodation For:</label>
				   	<div>
				     	<div class="col-sm-3">
				      		<div class="checkbox-inline">
				       			<label><input  type="radio"  path="accomFor" name="accomFor" value="boy" ng-model="boy">Boy</label>
				      		</div>
				      		<div  class="checkbox-inline">
				       			<label><input  type="radio" path="accomFor" name="accomFor" value="girl" ng-model="girl">Girl</label>
				      		</div>
				      		<div  class="checkbox-inline">
				       			<label><input  type="radio" path="accomFor" name="accomFor" value="family" ng-model="family">family</label>
				      		</div>
				     </div>
				      <form:errors path="accomFor" cssClass="error" />
				  </div>
				 </div> 
				  <div class="form-group">
				      <label class="control-label col-sm-2" for="AccomodationType">Accomodation Type:</label>
				        <div class="col-sm-4">
				        <form:select path="accomType" id="AccomodationType" class="form-control" ng-model="AccType" >
				        <option ng-repeat="x in AccomodationTypes" value="{{x.type}}">{{x.type}}</option>
				        <form:errors path="accomType" cssClass="error" />
                        </form:select>
				      </div>
				  </div>
				   <div class="form-group">
				      <div class="col-sm-12"  ng-if="AccType === 'Shared'">
				        <label class="control-label col-sm-2" for="NoOfBeds">No Of Beds:</label>
				        <div class="col-sm-1">
				        <form:select path="noBeds" id="NoOfBeds" class="form-control" >
				           <option ng-repeat="x in Beds_Rooms" value="{{x.type}}">{{x.type}}</option>
				            <form:errors path="noBeds" cssClass="error" />
                         </form:select>
                        </div>
				      </div>
				        <div class="col-sm-12"  ng-if="AccType === 'Private'">
				         <label class="control-label col-sm-2" for="NoOfRooms">No Of Rooms:</label>
				          <div class="col-sm-1">
				             <form:select path="noRooms" id="NoOfRoomss" class="form-control" >
				             <option ng-repeat="x in Beds_Rooms" value="{{x.type}}">{{x.type}}</option>
                            </form:select>
                            <form:errors path="noRooms" cssClass="error" />
                          </div>
				        </div>
				  </div>
				  <div class="form-group">
			        <label class="control-label col-sm-2" for="rent">Rent:</label>
			         <div class="col-sm-4">          
			           <form:input type="number" path="rent" class="form-control" placeholder="Enter Rent" />
			          <form:errors path="rent" cssClass="error" />
			         </div>
			      </div>
			      
			       <div class="form-group">
			        <label class="control-label col-sm-2" for="deposite">Deposite:</label>
			         <div class="col-sm-4">          
			          <form:input type="number" class="form-control" path="deposite"  placeholder="Enter Deposite" />
			          <form:errors path="deposite" cssClass="error" />
			         </div>
			       </div>
			        <div class="form-group">
			          <label class="control-label col-sm-2" for="address">Address:</label>
			           <div class="col-sm-4">  
					      <form:input id="autocomplete" path="address.location" class="form-control" placeholder="Enter your address"
					             onFocus="geolocate()" type="text"/>
					    </div>
					 </div>
					 <div class="form-group">
			          <label class="control-label col-sm-2" for="address"></label>
			           <div class="col-sm-4">  
					      <form:input path="address.street" class="form-control" placeholder="Address Line1"
					             type="text"/>
					    </div>
					 </div>
					 <%-- <div class="form-group">
			          <label class="control-label col-sm-2" for="address">Upload Image 1:</label>
			           <div class="col-sm-4">  
					     <form:input type="file" path="image[0]" id="image[0]" class="form-control" value="Upload" name='file[0]'/>
					    </div>
					 </div>
					 <div class="form-group">
			          <label class="control-label col-sm-2" for="address">Upload Image 2:</label>
			           <div class="col-sm-4">  
					     <form:input type="file" id="image[1]" path="image[0]" class="form-control" value="Upload" name='file[1]'/>
					    </div>
					 </div> --%>
					<div ng-show="false">
					 <div class="form-group" style="margin-left: 220px;">
					  <div class="col-sm-8">
					    <table id="address">
					      <tr>
					        <td class="label">Street address</td>
					        <td class="slimField">
					        	<input class="field" disabled="true" id="street_number" path="address.streetNo"/>
					        </td>
					        <td class="wideField" colspan="2">
					        <input path="address.street" class="field" id="route"
					              disabled="true"/></td>
					      </tr>
					      <tr>
					        <td class="label">City</td>
					        <td class="wideField" colspan="3"><input path="address.city" class="field" id="locality"
					              disabled="true"></input></td>
					      </tr>
					      <tr>
					        <td class="label">State</td>
					        <td class="slimField"><input path="address.state" class="field"
					              id="administrative_area_level_1" disabled="true"></input></td>
					        <td class="label">Zip code</td>
					        <td class="wideField"><input path="address.zipcode" class="field" id="postal_code"
					              disabled="true"></input></td>
					      </tr>
					      <tr>
					        <td class="label">Country</td>
					        <td class="wideField" colspan="3"><input path="address.country" class="field"
					              id="country" disabled="true"></input></td>
					          </tr>
					        </table>
					      </div>
				    	</div>        
                   </div>
		     </div>
					          
					      <div class="col-sm-offset-2 col-sm-10">
					        <button type="submit" class="btn btn-success">Submit</button>
					      </div>
					   
				
			</form:form>
		</div>
	</div>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCR6ppQ7ZheQRonKAU5h0xKuZkw7XU1Dp0&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>
</html>