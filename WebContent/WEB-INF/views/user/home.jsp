<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/master/meta.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container-fluid">
	<jsp:include page="/master/userNav.jsp" />	
		<div class="row" style="margin:20px 0px 50px 0px">
		<form action="/search" method="get">
			<div class="col-md-3">
					<div class="col-md-1">
						<label style="font-size: 15px;">Filters:</label>
					</div>
					<div class="col-md-1 pull-right" style="margin-right: 50px;">
						<input type="submit" class="btn btn-primary" value="Search"
							/>
					</div>
					</br> </br>
					<ul class="nav nav-pills nav-stacked">
						<li>
							<div class="form-group">
								<label for="loc" style="color: green;"><span
									style="color: red;" class="glyphicon glyphicon-map-marker"></span>
									Select Location:</label> <select class="form-control" id="loc">
									<span class="caret"></span>
									<option>Pune</option>
									<option>Mumbai</option>
									<option>Nasik</option>
								</select>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label for="space" style="color: green;"><span
									style="color: red;" class="glyphicon glyphicon-home"></span>
									Select Required Space:</label> <select class="form-control" id="space">
									<span class="caret"></span>
									<option>1BHK</option>
									<option>2BHK</option>
									<option>3BHK</option>
									<option>4BHK</option>
									<option>Entire House</option>
								</select>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label for="tenant" style="color: green;"><span
									style="color: red;" class="glyphicon glyphicon-user"></span>
									Select Tenant Type:</label> <select class="form-control" id="tenant">
									<span class="caret"></span>
									<option>Gentlemens</option>
									<option>Ladies</option>
									<option>Familt</option>
								</select>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label for="acco" style="color: green;"><span
									style="color: red;" class="glyphicon glyphicon-link"></span>
									Select Accomodation Type:</label> <select class="form-control"
									id="acco">
									<span class="caret"></span>
									<option>Shared</option>
									<option>Private</option>
								</select>
							</div>
						</li>
						<li><label style="color: green;">Rent: </label> <input
							name="rangeInput" type="range" min="500" max="50000" step="500"
							value="2000" onchange="updateTextInput(this.value);" /> <input
							type="text" id="textInput" value="2000" disabled></li>
					</ul>
			</div>
			<div class="col-md-9">
				<label><u><font size="5px">Search Results</font></u></label>
				<c:forEach var="prop" items="${sessionScope.propList}">
		  <div class="row">
		     <div class="col-md-4">
		        <div class="img-responsive">
                    <img src="<spring:url value='/${prop.images[0].imageUrl}'/>" alt="..." class="img-rounded img-responsive box-img" align="middle">
                </div>
		     </div>
		     <div class="col-md-8">
		        <div class="panel panel-primary prop_quick_view">
		           <div class="panel panel-heading"> <i class="fa fa-home" aria-hidden="true"></i> ${prop.propType} In ${prop.address.location}         
		           </div>
		           <div class="panel-body">
		              <span title="Accomodation For" class="prop_info"><i class="fa fa-user-circle-o fa-prop" aria-hidden="true"></i> ${prop.accomFor}</span>
		              <span title="Accomodation Type" class="prop_info"><i class="fa fa-users fa-prop" aria-hidden="true"></i> ${prop.accomType}</span>
		              <span title="Property Area" class="prop_info"><i class="fa fa-columns fa-prop" aria-hidden="true"></i> ${prop.area}</span><hr>
		              <span title="Rent" class="prop_info"><i class="fa fa-inr fa-prop" aria-hidden="true"></i> ${prop.rent}</span>
		              <span title="Deposite" class="prop_info"><i class="fa fa-money fa-prop" aria-hidden="true"></i> ${prop.deposite}</span><hr>
		              <span title="Furnishing Type" class="prop_info"><i class="fa fa-home fa-prop" aria-hidden="true"></i> ${prop.furnishType}</span>
		              <span  class="prop_info">
		                 <c:if test="${prop.accomType eq 'Shared'}">
		                   <span title="No of beds"> <i class="fa fa-bed fa-prop" aria-hidden="true"></i> ${prop.noBeds}</span>
		                 </c:if>
		                 <c:if test="${prop.accomType eq 'Private'}">
		                   <span title="No of Rooms"> <i class="fa fa-user-plus fa-prop" aria-hidden="true"></i> ${prop.noRooms}</span>
		                 </c:if>
		              </span>
		           </div>
		            <div class="panel-footer">
		               <span class="glyphicon glyphicon-thumbs-up quick_action_glyph" aria-hidden="true"></span>
		               <span class="glyphicon glyphicon-pencil quick_action_glyph" aria-hidden="true"></span>
		               <span class="glyphicon glyphicon-trash quick_action_glyph" aria-hidden="true"></span>    
		            </div>
		        </div>
		     </div>
		  </div>                  
		</c:forEach>
			</div>
			</form>
		</div>



		<div class="row jumbotron">
			<div class="col-md-4">
				<label class="contact" style="color: red;"><u>Contact
						Us:</u></label> <label class="contact">Our Mailing Address:</br> B1/7
					Harmony Society, Nagras Road, Aundh, Pune</br> Pin - 411007
				</label>
			</div>
			<div class="col-md-4">
				<label class="contact">Our Contact Number: 7869641546</label> <label
					class="contact">Our Email Address: mangeshauti@gmail.com</label> <label
					class="copyright" style="color: red;"><h4>Copyright @
						2017 CozyHomes Limited</h4></label>
			</div>
			<div class="col-md-4">
				<label>Follow us on Social Media</label>
				<ul class="social">
					<li><a href="https://www.facebook.com/">Facebook</a></li>
					<li><a href="https://www.twitter.com/">Twitter</a></li>
					<li><a href="https://www.google.com/">google+</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>