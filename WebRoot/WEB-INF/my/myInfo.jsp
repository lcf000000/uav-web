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
		<!-- DataTables CSS -->
	    <link href="<%=path%>/css/datatables/dataTables.bootstrap.css" rel="stylesheet">
	    <link href="<%=path%>/css/datatables/select.dataTables.min.css" rel="stylesheet">
	    <!-- DataTables Responsive CSS -->
	    <link href="<%=path%>/css/datatables/dataTables.responsive.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">
		<link href="<%=path%>/css/views/main.css" rel="stylesheet">
		<link href="<%=path%>/css/views/personal.css" rel="stylesheet">
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
                                <li><a href="<%=path%>/views/temp" class="navia">Image Detection</a></li>
                                 <li><a href="<%=path%>/views/temp" class="navia">Video Detection</a></li>
                                <li><a href="<%=path%>/views/temp" class="navia">Single-Tracking</a></li>
                                <li><a href="<%=path%>/views/temp" class="navia">Multi-Tracking</a></li>
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
						<li><a href="<%=path%>/views/people" class="navia">People</a></li>
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
				<div class="col-md-0">
				</div>
				<div class="col-md-12" style="word-wrap:break-word;">
					<br/>
                    <form class="form-horizontal col-sm-offset-2 col-md-offset-2" method="post" id="changePass_form">
					<h3 class="form-title">Change password</h3>
					<div class="col-sm-9 col-md-9">
						<input type="hidden" name="id" id="user_id" value="${user.id}">
						<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" value="${user.password}" onblur="checkPassword(this)" id="password" type="password" placeholder="fill in your new password" name="password"/>
						</div>
						<div class="form-group">
							<i class="fa fa-check fa-lg"></i>
							<input class="form-control required" value="${user.password}" onblur="checkRePassword(this)" type="password" placeholder="Re-type Your Password" name="rpassword"/>
						</div>
						<div class="form-group">
								<i class="fa fa-envelope fa-lg"></i>
								<input class="form-control eamil" value="${user.email}" onblur="checkEmail(this)" type="text" placeholder=" Email" name="email"/>
						</div>
						<div class="form-group">
								<i class="fa fa-group fa-lg"></i>
								<input class="form-control required" value="${user.org}" onblur="checkOrg(this)" type="text" placeholder=" University,Group,institute,Corporation,etc (letters and , . only)" name="org"/>
						</div>
						<div class="form-group">
								<i class="fa fa-globe fa-lg"></i>
								<input class="form-control required" value="${user.country}" onblur="checkCountry(this)" type="text" placeholder="Country,Region 's Code, as CN,US..." name="country"/>
						</div>
						<div class="form-group">
						<input class="btn btn-success btn-block" value="Change" disabled="disabled" id="changeSubmit" onclick="submitChange()" />
						</div>
					</div>
				</form>
             </div>
          </div> <!--/.tab-content-->  
		  <div class="col-md-0">
		  </div>
		</section>
		<div class="row">
		<br/>
		</div>
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
		
		<!-- DataTables JavaScript -->
	    <script src="<%=path%>/js/datatables/jquery.dataTables.min.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.bootstrap.min.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.responsive.js"></script>
	    <script src="<%=path%>/js/datatables/fnReloadAjax.js"></script>
	    <script src="<%=path%>/js/datatables/dataTables.select.min.js"></script>
	    <script src="<%=path%>/js/jquery/toastr.js"></script>
	    <script src="<%=path%>/js/my/myInfo.js"></script>
		<script src="<%=path%>/js/views/viewsGlob.js"></script>
		<script src="<%=path%>/js/views/utils.js"></script>
		
	</body>
</html>