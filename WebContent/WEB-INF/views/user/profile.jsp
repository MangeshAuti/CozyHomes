<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<body >
	<div class="container-fluid">
		<jsp:include page="/master/userNav.jsp" />
		<h3>Update Profile</h3>
		<hr>
		<div class="row">
      	<!-- left column -->
      		<div class="col-md-3">
      			<h3 style="color: red;">&emsp;${requestScope.status}</h3>
     			<form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="uploadProfilePic">
       				<div class="text-center">
       					<c:if test="${activeUser.imageAdd eq null }">
         						<img src="<%=request.getContextPath()%>/images/profile.png" class="img-circle" alt="profile Image"/>
    						</c:if>
    						<c:if test="${activeUser.imageAdd ne null }">
    							<img src="<spring:url value='/${activeUser.imageAdd}'/>" alt="profile Image" class="img-circle" width="150px" height="150px">
         
    						</c:if>
     						<h6>Upload a different photo...</h6>
		         	 	<input type="file" id="image" class="form-control" value="Upload" name='file'/></br></br>
			          	<input type="submit" class="btn btn-primary" value="Upload" />
		          	</div>
	          	</form:form>
        	</div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form:form modelAttribute="user" method="post" id="update_form" class="form-horizontal">
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-8">
              <form:input path="name" type="text" class="form-control" value='${sessionScope.activeUser.name}'/>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" disabled value='${sessionScope.activeUser.email}'>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Phone Number:</label>
            <div class="col-lg-8">
              <input class="form-control" type="varchar" maxlength=10 value='${sessionScope.activeUser.mobileNo}'>
            </div>
          </div>
          
          	<div class="form-group">
			<label class="col-lg-3 control-label">Address:</label>
	   		<div class="col-lg-8">  
      			<form:input id="autocomplete" path="address.location" class="form-control" placeholder="Enter your address"
				             onFocus="geolocate()" type="text"/>
			</div>
			</div>
			 <div class="form-group">
	         <label class="col-lg-3 control-label" ></label>
	           <div class="col-lg-8">  
			      <form:input path="address.street" class="form-control" placeholder="Address Line1"
			             type="text"/>
			    </div>
			 </div>
        
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