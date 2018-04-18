<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="<%=path%>/images/favicon.ico" type="image/x-icon" />
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>UAV DATASET - TJU and GA</title>
		<!-- Bootstrap core CSS -->
		<link href="<%=path%>/css/bootstrap/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=path%>/css/font-awesome/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<!-- pignose css -->
		<link href="<%=path%>/css/views/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
		<!-- //pignose css -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet" type="text/css" media="all" />
	    <link href="<%=path%>/css/views/table.css" rel="stylesheet">
	</head>
<body>
<!-- banner -->
<div class="ban-top">
	<div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class="menu__item"><a class="menu__link" href="<%=path%>/views/index">Home <span class="sr-only">(current)</span></a></li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Benchmark <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-1">
								<ul class="multi-column-dropdown">
									<li><i class="fa fa-bookmark-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=2">&nbsp;&nbsp;Object Detection in Images</a></li>
									<li><i class="fa fa-bookmark-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=3">&nbsp;&nbsp;Object Detection in Videos</a></li>
									<li><i class="fa fa-bookmark-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=4">&nbsp;&nbsp;Single-Object Tracking</a></li>
									<li><i class="fa fa-bookmark-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=5">&nbsp;&nbsp;Multi-Object Tracking</a></li>
								</ul>
							</ul>
					</li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Evaluate <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-2">
								<ul class="multi-column-dropdown">
									<li>Participate:</li>
									<li><i class="fa fa-gear fa-lg"></i><a href="<%=path%>/views/getInfo?loc=6">&nbsp;&nbsp;Results Format</a></li>
									<li><i class="fa fa-gear fa-lg"></i><a href="<%=path%>/views/getInfo?loc=7">&nbsp;&nbsp;Test Guidelines</a></li>
									<li><i class="fa fa-gear fa-lg"></i><a href="<%=path%>/views/getInfo?loc=8">&nbsp;&nbsp;Upload Results</a></li>
									<li class="divider"></li>
									<li>Evaluate:</li>
									<li><i class="fa fa-tasks fa-lg"></i><a href="<%=path%>/views/getInfo?loc=9">&nbsp;&nbsp;Object Detection in Images</a></li>
									<li><i class="fa fa-tasks fa-lg"></i><a href="<%=path%>/views/getInfo?loc=10">&nbsp;&nbsp;Object Detection in Videos</a></li>
									<li><i class="fa fa-tasks fa-lg"></i><a href="<%=path%>/views/getInfo?loc=11">&nbsp;&nbsp;Single-Object Tracking</a></li>
									<li><i class="fa fa-tasks fa-lg"></i><a href="<%=path%>/views/getInfo?loc=12">&nbsp;&nbsp;Multi-Object Tracking</a></li>
									<li class="divider"></li>
									<li>Leaderboards:</li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Object Detection in Images</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Object Detection in Videos</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Single-Object Tracking</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Multi-Object Tracking</a></li>
								</ul>
							</ul>
					</li>
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/my/submit">Submit</a></li>
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/views/getInfo?loc=17">FAQ</a></li>
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/views/people">People</a></li>
				  </ul>
				  <ul class="nav navbar-nav menu__list nav-right">
					  <c:if test="${empty sessionScope.user.username}">
						<li class=" menu__item"><a href="<%=path%>/views/login" class="menu__link"><i class="fa fa-sign-in"></i>   &nbsp; Sign in</a></li> 
						<li class=" menu__item"><a href="<%=path%>/views/register" class="menu__link"><i class="fa fa-pencil"></i>  &nbsp; Sign up</a></li>
					  </c:if>
					  <c:if test="${not empty sessionScope.user.username}">
						<li class=" menu__item"><a href="#" onclick="loginOut()" class="menu__link"><i class="fa fa-sign-out"></i>  &nbsp; Sign out</a></li>
						<li class=" menu__item"><a href="<%=path%>/my/myInfo" class="menu__link"><i class="fa fa-user"></i>  &nbsp; Welcome, ${user.username}</a>
						<input type="hidden" name="id" id="user_id" value="${user.id}">
					  </c:if>
				  </ul>
				</div>
			  </div>
			</nav>	
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //banner-top -->
		<section>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" id="show-info" style="word-wrap:break-word;">
					
					<br/>
					<table class="table table-striped table-bordered table-hover table-condensed" id="dataTables-motres">
                        <thead> 
							<tr>
								<th></th>
								<th>Tracker Name</th>
		                        <th>Date</th>
		                        <th>MOTAL</th>
		                        <th>MOTP</th>
		                      	<th>MOTA</th>
		                      	<th>IDF1</th>
		                      	<th>IDP</th>
		                      	<th>IDR</th>
		                      	<th>Rcll</th>
		                      	<th>Prcn</th>
		                      	<th>FAR</th>
		                      	<th>GT</th>
		                      	<th>MT</th>
		                      	<th>PT</th>
		                      	<th>ML</th>
		                      	<th>FP</th>
		                      	<th>FN</th>
		                      	<th>IDs</th>
		                      	<th>FM</th>
		                        <th>Language</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
                      </table>
                      <br/>
                      <div id="mot-metrics">
					</div>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</section>
		<br/>
		<footer class="footer">
			<div class="footer-bottom">
				<i class="fa fa-copyright"></i> Copyright 2018. All rights reserved.<br>
			</div>
		</footer>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript">ctx="${pageContext.request.contextPath}";</script>
		<script src="<%=path%>/js/jquery/jquery.min.js"></script>
		<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
		<script src="<%=path%>/js/views/viewsGlob.js"></script>
		<script src="<%=path%>/js/views/mottable.js"></script>
		<!-- DataTables JavaScript -->
	    <script src="<%=path%>/js/datatables/jquery.dataTables.min.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.bootstrap.min.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.responsive.js"></script>
	    <script src="<%=path%>/js/datatables/fnReloadAjax.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.select.min.js"></script>
	</body>
</html>