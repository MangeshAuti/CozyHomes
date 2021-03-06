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
					height="30px" style="display: inline-block"> <b>&nbsp;CozyHomes</b>&emsp;<small>Admin</small>
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
					<li class="active">
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
								<li><a href="<%=request.getContextPath()%>/account/logout">Logout</a></li>
							</ul>
						</div>
					</li>
				</ul>
		</div>	
  </nav>
<!-- user list -->
<div class="container">
  <h4>Register User List</h4>
  <hr>
  <table class="table borderless " id="user_list" cellspacing="0">
    <tbody>
    <c:forEach var="user" items="${sessionScope.userList}">
     <c:if test="${user.role eq 'u'}">
      <tr class="tablerow">
        <td><i class="fa fa-user-plus " aria-hidden="true"></i> ${user.name}</td>
        <td><i class="fa fa-envelope" aria-hidden="true"></i> ${user.email}</td>
        <td><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;${user.mobileNo}</td>
        <td><i class="fa fa-map-marker" aria-hidden="true"></i> ${user.address.location} ${user.address.city} ${user.address.state} ${user.address.country}</td>
      </tr>
      </c:if>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>