<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="/master/meta.jsp" />
</head>
<body>
<jsp:include page="/master/userNav.jsp" />
<c:if test="${sessionScope.notification.size() eq 0}">
			<div class="alert alert-info" align="center" width="50%">
				No notification.
			</div>
		</c:if>
<div class="row">
<div class="col-md-1">
</div>
<c:forEach var="noti" items="${sessionScope.notification}">
<div class="col-md-8">
<div class="panel panel-info" >
 		<div class="panel-heading">
 		${noti.fromUser} want to meet you on ${noti.booktime}
 		</div>
		<div class="panel-body">
		Says:${noti.message}<hr>
		<span class="glyphicon glyphicon-earphone"></span>${noti.fromUserMobileNo}
		</div>
</div>
</div></br>
</c:forEach>


</div>
</div>
</body>
</html>