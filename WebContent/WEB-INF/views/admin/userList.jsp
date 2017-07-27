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
</head>
<body>
<nav class="nav navbar-default">
		<div class="col-md-3">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>/" class="navbar-brand">
					<img alt="logo" class="logo"
					src="<%=request.getContextPath()%>/images/logo.ico" width="30px"
					height="30px" style="display: inline-block"> <b>&nbsp;CozyHomes</b>
				</a>
			</div>
		</div>
		<div class="col-md-9 navlinks">
				<ul class="nav nav-pills navbar-right">
					<li>
						<a href="<%=request.getContextPath()%>/admin/home">Home</a>
					<li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/propertyList/0">Properties</a>
					<li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/userList" class="active">Users</a>
					<li>
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="user" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user" style="color:green;"></span>
								${sessionScope.activeAdmin.name} <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="user">
								<li><a href="<%=request.getContextPath()%>/admin/profile">Profile</a></li>
								<li><a href="<%=request.getContextPath()%>/account/logout">Logout</a></li>
							</ul>
						</div>
					</li>
				</ul>
		</div>	
  </nav>
<!-- user list -->
<div class="container">
  <h2>Register User List</h2>
  <table class="table table-striped">
    <thead>
    
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Mobile No</th>
        <th>Location</th>
        <th>City</th>
        <th>State</th>
        <th>Country</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${sessionScope.userList}">
     <c:if test="${user.role eq 'u'}">
      <tr>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.mobileNo}</td>
        <td>${user.address.location}</td>
        <td>${user.address.city}</td>
        <td>${user.address.state}</td>
        <td>${user.address.country}</td>
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>