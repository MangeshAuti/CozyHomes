<nav class="nav navbar-default">
			<div class="col-md-3">
				<div class="navbar-header">
					<a href="<%=request.getContextPath()%>/" class="navbar-brand">
						<img alt="logo"
						src="<%=request.getContextPath()%>/images/logo.ico" width="30px"
						height="30px" style="display: inline-block"> <b>&nbsp;CozyHomes</b>
					</a>
				</div>
			</div>
			<div class="col-md-9">
				<ul class="nav nav-pills navbar-right">
					<li class="active"><a
						href="<%=request.getContextPath()%>/user/search">Search</a></li>
					<li><a href="notification.jsp">Notifications<span
							class="badge">5</span></a></li>
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="owner" data-toggle="dropdown">
								Home Owner <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="owner">
								<li><a
									href="<%=request.getContextPath()%>/account/addProperty">Add
										Property</a></li>
								<li><a
									href="<%=request.getContextPath()%>/owner/myProperty">My
										Property</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="user" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span>
								${sessionScope.activeUser.name} <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="user">
								<li><a href="<%=request.getContextPath()%>/user/profile">Profile</a></li>
								<li><a href="<%=request.getContextPath()%>/user/favourite">Favourite
										Property</a></li>
								<li><a href="<%=request.getContextPath()%>/account/logout">Logout</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</nav>