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
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>UAV DATASET - TJU and GA</title>
		<!-- Bootstrap core CSS -->
		<link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=path%>/css/font-awesome/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet">
		<link href="<%=path%>/css/views/table.css" rel="stylesheet">
	</head>
	<body>
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-static-top" role="banner" id="navi">
			<div class="container">
				<div class="navbar-header">
                    <a class="navbar-brand" href="<%=path%>/"><img src="<%=path%>/images/logo-lb.png" alt="logo"></a>
                </div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="<%=path%>/" class="navia">Home</a></li>
						<li class="dropdown">
                            <a href="#" class="dropdown-toggle navia" data-toggle="dropdown">Benchmarks <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/views/getInfo?loc=2" class="navia">Image Detection</a></li>
                                <li><a href="<%=path%>/views/getInfo?loc=3" class="navia">Video Detection</a></li>
                                <li><a href="<%=path%>/views/getInfo?loc=4" class="navia">Single-Tracking</a></li>
                                <li><a href="<%=path%>/views/getInfo?loc=5" class="navia">Multi-Tracking</a></li>
                            </ul>
                        </li>
						<li class="dropdown">
                            <a href="#" class="dropdown-toggle navia" data-toggle="dropdown">Results <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=path%>/views/detTable" class="navia">Image Detection</a></li>
                                 <li><a href="<%=path%>/views/vdetTable" class="navia">Video Detection</a></li>
                                <li><a href="<%=path%>/views/sotTable" class="navia">Single-Tracking</a></li>
                                <li><a href="<%=path%>/views/motTable" class="navia">Multi-Tracking</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                        	<a href="#" class="dropdown-toggle navia" data-toggle="dropdown">Submit <i class="fa fa-angle-down"></i></a>
                        	<ul class="dropdown-menu">
                                <li><a href="<%=path%>/views/getInfo?loc=14" class="navia">Instructions</a></li>
                                <li><a href="<%=path%>/my/submit" class="navia">Submit Result</a></li>
                            </ul>
                        </li>
						<li><a href="<%=path%>/views/getInfo?loc=15" class="navia">FAQ</a></li>
						<li><a href="<%=path%>/views/getInfo?loc=16" class="navia">People</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty sessionScope.user.username}">
							<li><a href="<%=path%>/views/login" class="navia"><i class="fa fa-sign-in"></i>   &nbsp; Sign in</a></li> 
							<li><a href="<%=path%>/views/register" class="navia"><i class="fa fa-pencil"></i>  &nbsp; Sign up</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.user.username}">
							<li><a href="#" onclick="loginOut()" class="navia"><i class="fa fa-sign-out"></i>  &nbsp; Sign out</a></li>
							<li><a href="<%=path%>/my/yourResults" class="navia"><i class="fa fa-user"></i>  &nbsp; Welcome, ${user.username}</a>
							<input type="hidden" name="id" id="user_id" value="${user.id}">
						</c:if>
					</ul>

				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<section>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" id="show-info" style="word-wrap:break-word;">
					<div id="mot-metrics">
					</div>
					<br/><br/><br/>
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