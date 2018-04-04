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
							<li><a href="<%=path%>/my/myInfo" class="navia"><i class="fa fa-user"></i>  &nbsp; Welcome, ${user.username}</a>
							<input type="hidden" name="id" id="user_id" value="${user.id}">
						</c:if>
					</ul>

				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<section>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" id="show-info" style="word-wrap:break-word;">
				<form class="form-horizontal col-sm-offset-2 col-md-offset-2" method="post" id="vdetSubmit_form">
					<h3 class="form-title">Submit your detector</h3>
					<br/>
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
							<p class="help-block" style="color:#F00"><span id="vdetcnt"></span> remaining submission opportunities</p><input onclick="submitDet()" disabled="disabled" id="submitVdet" class="btn btn-group-sm btn-primary pull-right" value="Submit"/>
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