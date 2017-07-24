<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="/master/meta.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="CozyApp">
<jsp:include page="/master/userNav.jsp" />	
 <div class="text-center">
 <div ng-controller="RecoverPController">
<c:forEach var="prop" items="${sessionScope.propList}">
                    <div class="box-border margin-top">
                            <div class="text-center">
                                <h2>${prop.propId}<br/></h2>
                              
                            </div>

                            <div class="row">

                                <div class="col-lg-4 text-center">
                                    <div class="img-responsive">
                                        <img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="..." class="img-rounded img-responsive box-img">
                                    </div>
                                </div> 
                                <div class="col-lg-4 text-left">
                                    <table class="table">
                                        <tr>
                                            <td>Accomodation For:</td>
                                            <td>${prop.accomFor}</td>
                                        </tr>
                                        <tr>
                                            <td>Accomodation Type:</td>
                                            <td>${prop.accomType}</td>
                                        </tr>
                                        <tr>
                                            <td>Daily Veg Rate:</td>
                                            <td>${prop.area }</td>
                                        </tr>
                                        <tr>
                                            <td>Daily Non-Veg Rate:</td>
                                            <td>${prop.deposite }</td>
                                        </tr>
                                    </table>
                                </div>  
                                <div class="col-lg-4 text-left">
                                    <table class="table">
                                        <tr>
                                            <td>Food type:</td>
                                            <td>${prop.furnishType }</td>
                                        </tr>
                                        <tr>
                                            <td>Food Service type:</td>
                                            <td>${prop.noBeds }</td>
                                        </tr>
                                        <tr>
                                            <td>City:</td>
                                            <td>${prop.address.city }</td>
                                        </tr>
                                        <tr>
                                            <td>Locality:</td>
                                            <td>${prop.address.location}</td>
                                        </tr>
                                    </table>                    
                                </div>   
                            </div>
                            <button value="${prop.propId}">Delete</button> 
                            <div class="text-center custom-padding">
                            	<form action="/propP_Project/service/getdetails">
                            		<input type="hidden" name="serviceId" value="${prop.propId}" />
                                	<input type="submit" class="btn btn-danger" value="Get Complete Details" />
                                </form>
                            </div>
                            
								<input type="button" class="btn btn-success" value="${prop.propId}" ng-click="deleteProp()"
									id="del" name="btn" >
								&emsp;

							
                    </div>
                    </c:forEach>
                    </div>
                    <div class="respcontent" ng-show="showResp">{{ResponseContent}}</div>
my property
</body>
</html>