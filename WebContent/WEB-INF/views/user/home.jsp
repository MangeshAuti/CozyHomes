<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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