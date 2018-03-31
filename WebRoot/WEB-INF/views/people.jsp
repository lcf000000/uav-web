<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>UAV DATASET - TJU and GA</title>
		<!-- Bootstrap core CSS -->
		<link href="<%=path%>/css/bootstrap/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=path%>/css/font-awesome/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet">
		<!-- Google Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic|Roboto:400,300,700' rel='stylesheet' type='text/css'>
		<!-- Animate -->
		<link rel="stylesheet" href="<%=path%>/css/views/animate.css">
		<!-- Icomoon -->
		<link rel="stylesheet" href="<%=path%>/css/views/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="<%=path%>/css/views/style.css">
		
		<!-- Modernizr JS -->
		<script src="<%=path%>/js/views/modernizr-2.6.2.min.js"></script>
		<!-- FOR IE9 below -->
		<!--[if lt IE 9]>
		<script src="js/respond.min.js"></script>
		<![endif]-->
		
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
				<div class="col-md-2">
				</div>
				<div class="col-md-8 panel panel-default"style="word-wrap:break-word;">
					<div class="col-lg-12 col-md-12 text-center">
					<br/>
					<br/>
					<h1 id="fh5co-logo">Organizer</h1>
					<br/>
					</div>
					<div class="container-fluid">
						<div class="row fh5co-post-entry">
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="http://cs.tju.edu.cn/faculty/zhupengfei/faculty-standard/"><img src="<%=path%>/images/people/1.jpg" alt="Image" class="img-responsive"></a>
								</figure>								
								<h3 class="fh5co-article-title"><a href="http://cs.tju.edu.cn/faculty/zhupengfei/faculty-standard/">Pengfei Zhu</a></h3>
								<span class="fh5co-meta fh5co-date">Associate Professor, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="http://www.cbsr.ia.ac.cn/users/lywen/"><img src="<%=path%>/images/people/2.jpg" alt="Image" class="img-responsive"></a>
								</figure>								
								<h3 class="fh5co-article-title"><a href="http://www.cbsr.ia.ac.cn/users/lywen/">Longyin Wen</a></h3>
								<span class="fh5co-meta fh5co-date">Computer Vision Scientist GE Global Research</span>
							</article>
							<div class="clearfix visible-xs-block"></div>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="https://sites.google.com/site/cvbian/"><img src="<%=path%>/images/people/3.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="https://sites.google.com/site/cvbian/">Bian Xiao</a></h3>
								<span class="fh5co-meta fh5co-date">GE Global Research Lead Scientist</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="http://www.dabi.temple.edu/~hbling/"><img src="<%=path%>/images/people/4.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="http://www.dabi.temple.edu/~hbling/#">Haibin Ling</a></h3>
								<span class="fh5co-meta fh5co-date">Associate, Professor Temple University</span>
							</article>
							<div class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
							<div class="col-lg-12 col-md-12 text-center">
							<h1 id="fh5co-logo">Team Member</h1>
							<br/>
							</div>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/5.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Hao Cheng</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/6.JPG" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Chenfeng Liu</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/7.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Xiaoyu Liu</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/8.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Wenya Ma</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/9.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Qinqin Nie</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/10.png" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Haotian Wu</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/11.jpg" alt="Image" class="img-responsive"></a>
								</figure>
								<h3 class="fh5co-article-title"><a href="#">Lianjie Wang</a></h3>
								<span class="fh5co-meta fh5co-date">Master, Tianjin University</span>
							</article>
							<div class="clearfix visible-xs-block"></div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</section>

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
		<!-- jQuery Easing -->
		<script src="<%=path%>/js/views/jquery.easing.1.3.js"></script>
		<!-- Waypoints -->
		<script src="<%=path%>/js/views/jquery.waypoints.min.js"></script>
		<!-- Main JS -->
		<script src="<%=path%>/js/views/main.js"></script>
	</body>
</html>