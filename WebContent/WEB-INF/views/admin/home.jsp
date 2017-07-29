<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<li class="active">
						<a href="<%=request.getContextPath()%>/admin/home">Home</a>
					<li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/propertyList/0">Properties</a>
					<li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/userList">Users</a>
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
  
 <div class="row top_cont"> 
      <!-- Carousel -->
	  <div class="container" style="width:850px;"> 
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner show_prop_detail" >
		      <div class="item active">
		        <img src="<%=request.getContextPath()%>/images/screen1.jpg" alt="screen1" style="width:100%">
		      </div>
		
		      <div class="item">
		        <img src="<%=request.getContextPath()%>/images/screen2.jpg" alt="screen2" style="width:100%">
		      </div>
		    
		      <div class="item">
		        <img src="<%=request.getContextPath()%>/images/screen4.jpg" alt="screen4" style="width:100%">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
	 </div>
</div>
 <!-- footer -->
</body>
</html>