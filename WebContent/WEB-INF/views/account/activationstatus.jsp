<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Refresh" content="2;url=<%=request.getContextPath()%>/account/login">
<jsp:include page="/master/meta.jsp" />
</head>
<body background="<%=request.getContextPath()%>/images/banner.jpg">
<h3 align="center">${requestScope.status}</h3>
</body>
</html>