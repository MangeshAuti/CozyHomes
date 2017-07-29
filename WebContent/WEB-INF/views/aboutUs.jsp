<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body background="<%=request.getContextPath()%>/images/banner.jpg">
<div class="container">
		<nav class="nav navbar-default">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>/"><img alt="Logo" src="images/logo.jpg"
					class="img-rounded" class="img-responsive"></a>
			</div>
			<ul class='nav nav-pills navbar-right'>
				<li><a href="account/login"><button type='button'
							class='btn btn-warning'>
							<span style="color: yellow;" class="glyphicon glyphicon-log-in"></span>
							Login
						</button></a></li>
				<li class="active"><a href="aboutUs">
						<button type='button' class='btn btn-warning'
							style="margin-right: 50px">
							<span style="color: yellow;" class="glyphicon glyphicon-eye-open"></span>
							About Us
						</button>
				</a></li>
			</ul>
		</nav>
<hr>
<div class=" col-md-10 panel panel-info">
	<div class="panel-body">
	A Website where property owner can list the details of his to rent properties and tenant can find accommodation easily sitting on a remote place.
	<br> It provides a common communication platform between property owner and tenant.
	</div>
	<div class="panel-footer">
	Contact us: cozyhomesportal@gmail.com
	</div>
</div>
</div>
</body>
</html>