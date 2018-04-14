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
		<!-- 在bootstrap.min.js 之前引入 -->
    	<script src="<%=path%>/js/jquery/toastr.js"></script>
		<!-- JQuery CSS -->
   		<link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">
		<!-- Bootstrap core CSS -->
		<link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=path%>/css/font-awesome/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet">
		<!-- pignose css -->
		<link href="<%=path%>/css/views/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
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
		<section>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" id="show-info" style="word-wrap:break-word;">
				<form class="form-horizontal col-sm-offset-2 col-md-offset-2" method="post" id="vdetSubmit_form">
					<h3 class="form-title">Submit your detector</h3>
					<br/>
					<input type="hidden" name="user_id" id="user_id" value="${user.id}">
					<div class="col-sm-9 col-md-9">
						<div class="form-group">
							<label>*Detector Name</label>
							<input id="detectorName" class="form-control required" onblur="checkName(this)" type="text" placeholder="A unique name, a short name of your tracker" name="name"/>
						</div>
						<div class="form-group">
							<label>*Development language</label>
							<input class="form-control required"  onblur="checkLang(this)" type="text" placeholder="C++,Matlab,Python,etc" name="language"/>
						</div>
						<div class="form-group">
							<label>*Environment</label>
							<div class="row">
							  <div class="col-xs-3">
							    <input onblur="checkEnviroment(this)" type="text" class="form-control" placeholder="CPU:XXX*cores"  name="core">
							  </div>
							  <div class="col-xs-3">
							    <input onblur="checkEnviroment(this)" type="text" class="form-control" placeholder="@CPU frequency" name="freq">
							  </div>
							  <div class="col-xs-3">
							    <input onblur="checkEnviroment(this)" type="text" class="form-control" placeholder="RAM:XGB" name="ram">
							  </div>
							  <div class="col-xs-3">
							    <input onblur="checkEnviroment(this)" type="text" class="form-control" placeholder="GPU:XXX*N" name="gpu">
							  </div>
							</div>
						</div>
						<div class="form-group">
						    <label>*Upload tracking results</label>
						    <input onblur="checkResFile(this)" type="file" id="exampleInputFile" name="resfile">
						    <p class="help-block">Upload your results in a .zip file.</p>
						</div>
						<div class="form-group">
						    <label>*Description</label>
						    <input onblur="checkDesFile(this)" type="file" id="exampleInputFile" name="desfile">
						    <p class="help-block">A short description of your method. Please use the template paper to describe your method (template is available here). Your file format should be .pdf, .docx or .doc.
.</p>
						</div>
						<div class="form-group">
						    <label>Code (optional)</label>
						    <input type="file" id="exampleInputFile" name="codefile">
						    <p class="help-block">You can choose whether to upload your code(Compressed into a .zip format file).</p>
						</div>
						<div class="form-group">
							<label>*Reference</label>
							<input class="form-control required"  onblur="checkPassword(this)" id="password" type="text" placeholder="Author,  Title,  Conference/Journal,  Year" name="sotlaug"/>
						</div>
						<div class="form-group">
							<p class="help-block" style="color:#F00"><span id="vdet"></span> remaining submission opportunities</p><input onclick="subtVdet()" disabled="disabled" id="submitVdet" class="btn btn-group-sm btn-primary pull-right" value="Submit"/>
						</div>
					</div>
				</form>
				</div>
				<div class="col-md-2">
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
		<script src="<%=path%>/js/my/submitVdet.js"></script>
	</body>
</html>