<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCR6ppQ7ZheQRonKAU5h0xKuZkw7XU1Dp0&libraries=places&callback=initAutocomplete"
	async defer>
	
</script>
<jsp:include page="/master/meta.jsp" />
</head>
<body ng-app ng-controller>
	<div class="container-fluid">
		<jsp:include page="/master/userNav.jsp" />
		<h3>Update Profile</h3>
		<hr>
		<div class="row">
      <!-- left column -->
      <div class="col-md-3">
      <h3 style="color: red;">&emsp;${errorInFileUpload}</h3>
      <form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="uploadProfilePic">
        <div class="text-center">
        <c:if test="${activeUser.imageAdd eq null }">
          <img src="<%=request.getContextPath()%>/images/profile.png" class="avatar img-circle" alt="avatar"/>
     </c:if>
     <c:if test="${activeUser.imageAdd ne null }">
          <img src="${activeUser.imageAdd}" class="avatar img-circle" alt="avatar"/>
     </c:if>
      <h6>Upload a different photo...</h6>
          <input type="file" id="image" class="form-control" value="Upload" name='file'/></br></br>
          <input type="submit" class="btn btn-primary" value="Upload" />
          </div></form:form>
        </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form:form modelAttribute="user" method="post" id="update_form">
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-8">
              <form:input path="name" type="text" class="form-control" value='${sessionScope.activeUser.name}'/></br>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" disabled value='${sessionScope.activeUser.email}'></br>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Phone Number:</label>
            <div class="col-lg-8">
              <input class="form-control" type="varchar" maxlength=10 value='${sessionScope.activeUser.mobileNo}'></br>
            </div>
          </div>
          
          <label class="col-md-3 control-label">Enter Address:</label>
    	  <table id="address">
    	  <tr>
    	  	<td colspan="4">
    	  		<input class="form-control" id="autocomplete" placeholder="Enter your address"
             	onFocus="geolocate()" type="text"></input>
    	  	</td>
    	  </tr>
      		<tr>
        		<td class="form-group"><label class="col-md-3 control-label">Street Address:</label></td>
        			<td class="slimField"><input class="field" id="street_number"
              		disabled></input></td>
        			<td class="wideField" colspan="2"><input class="field" id="route"
              		disabled></input></td>
      		</tr>
      		
      		<tr>
      		<td class="form-group"><label class="col-md-3 control-label">City:</label></td>
	        <td class="wideField" colspan="3"><input class="field" id="locality"
	              disabled></input></td>
	        </tr>
      		<tr>
	        <td class="form-group"><label class="col-md-3 control-label">State:</label></td>
	        <td class="slimField"><input class="field"
	        id="administrative_area_level_1" disabled></input></td>
	        
        	<td class="form-group"><label class="col-md-3 control-label">Zip Code:</label></td>
        	<td class="wideField"><input class="field" id="postal_code" disabled></input></td>
      		</tr>
      		<tr>
        <td class="form-group"><label class="col-md-3 control-label">Country:</label></td>
        <td class="wideField" colspan="3"><input class="field" id="country" disabled></input></td>
      </tr>
    </table></br></br>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
              </form:form>
            </div>
          </div> 
      </div>
  </div>
</div>
		</div>

</body>
</html>