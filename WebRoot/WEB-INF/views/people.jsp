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
<!--[if gt IE 8]>	   <html class="no-js"> <![endif]-->
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
		<!-- Animate -->
		<link rel="stylesheet" href="<%=path%>/css/views/animate.css">
		<!-- Icomoon -->
		<link rel="stylesheet" href="<%=path%>/css/views/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="<%=path%>/css/views/style.css">
		<!-- pignose css -->
		<link href="<%=path%>/css/views/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
		<!-- //pignose css -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet" type="text/css" media="all" />
		<!-- Modernizr JS -->
		<script src="<%=path%>/js/views/modernizr-2.6.2.min.js"></script>
		<!-- FOR IE9 below -->
		<!--[if lt IE 9]>
		<script src="js/respond.min.js"></script>
		<![endif]-->
		
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
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/views/index">Home <span class="sr-only">(current)</span></a></li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Benchmark <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-1">
								<ul class="multi-column-dropdown">
									<li><a href="<%=path%>/views/getInfo?loc=2">Detection in Images</a></li>
									<li><a href="<%=path%>/views/getInfo?loc=3">Detection in Videos</a></li>
									<li><a href="<%=path%>/views/getInfo?loc=4">Single-Object Tracking</a></li>
									<li><a href="<%=path%>/views/getInfo?loc=5">Multi-Object Tracking</a></li>
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
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=9">&nbsp;&nbsp;Detection in Images</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=10">&nbsp;&nbsp;Detection in Videos</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=11">&nbsp;&nbsp;Single-Object Tracking</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/getInfo?loc=12">&nbsp;&nbsp;Multi-Object Tracking</a></li>
									<li class="divider"></li>
									<li>Leaderboards:</li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Detection in Images</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Detection in Videos</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Single-Object Tracking</a></li>
									<li><i class="fa fa-bar-chart-o fa-lg"></i><a href="<%=path%>/views/temp">&nbsp;&nbsp;Multi-Object Tracking</a></li>
								</ul>
							</ul>
					</li>
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/my/submit">Submit</a></li>
					<li class=" menu__item"><a class="menu__link" href="<%=path%>/views/getInfo?loc=17">FAQ</a></li>
					<li class="active menu__item menu__item--current"><a class="menu__link" href="<%=path%>/views/people">People</a></li>
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
									<a href="http://cs.tju.edu.cn/faculty/zhupengfei/faculty-standard/"><img src="<%=path%>/images/people/1.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>								
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="http://cs.tju.edu.cn/faculty/zhupengfei/faculty-standard/">Pengfei Zhu</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px; text-transform : capitalize"><br>Associate Professor<br /> <br>Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="http://www.cbsr.ia.ac.cn/users/lywen/"><img src="<%=path%>/images/people/2.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>								
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="http://www.cbsr.ia.ac.cn/users/lywen/">Longyin Wen</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px; text-transform :capitalize"><br>Computer Vision Scientist<br/> <br>GE Global Research<br/></div></span>
							</article>
							<div class="clearfix visible-xs-block"></div>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="https://sites.google.com/site/cvbian/"><img src="<%=path%>/images/people/3.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="https://sites.google.com/site/cvbian/">Bian Xiao</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Lead Scientist<br /> <br>GE Global Research<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="http://www.dabi.temple.edu/~hbling/"><img src="<%=path%>/images/people/4.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="http://www.dabi.temple.edu/~hbling/#">Haibin Ling</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Associate Professor</br> <br>Temple University</br></div></span>
							</article>
							<section id="content-h">
					<!-- 新加入 -->
							   <div class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
							   <div class="container-fluid">
						       <div class="row fh5co-post-entry">
					              <div class="col-lg-12 col-md-12 text-center">
					              
					               <h1 id="fh5co-logo">Keynote Speaker</h1>
					               <br/>
					                </div>
				             <article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box col-md-push-2">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/15.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Daniel Cremers</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Professor<br /><br> Technische Universität München<br/></div></span>
							</article>
							
							 <article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box col-md-push-4">
								<figure>
							
									<a href="#"><img src="<%=path%>/images/people/16.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Mubarak Shah</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Professor<br /><br> University of Central Florida<br/></div></span>
							</article>
							</div>
							</div>
							
							
							</section>
							
					<div class="col-lg-12 col-md-12 text-center">
					
					<h1 id="fh5co-logo">Advisory Committee</h1>
					<br/>
					</div>
							    <div class="container">
							     <div class="row">
								    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box col-md-push-1 ">
								    <div class="box-hang">
								    <list>
								   <li style="font-size: 12px"> Hamilton Scott Clouse (USAirforce Research)</li> 
									<li style="font-size: 12px">Liyi Dai (US Army Research Office)</li> 
									<li style="font-size: 12px">Riad I.Hammound (BAE Systems, USA) </li>
									<li style="font-size: 12px">Qinghua Hu (Tianjin Univ., China)</li>
									<li style="font-size: 12px">David Jacobs (Univ. Maryland College Park, USA)</li> 
									<li style="font-size: 12px">John Lizzi (GEGlobal Research, Niskayuna, USA)</li>
									<li style="font-size: 12px">Stan Z. Li (Institute ofAutomation, Chinese Academy of Sciences, China)</li>
									</list>
							        </div>
							        </div>
							        
							        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box col-md-offset-3">
								    <div class="box-hang"><list>
								   
							        <li style="font-size: 12px">Anton Milan (Amazon Research and Development Center, Germany)</li>
                                    <li style="font-size: 12px"> Zhuowen Tu (Univ. California San Diego, USA)</li>
                                    <li style="font-size: 12px">Siyu Tang (Max Planck Institute for Intelligent Systems, Germany)</li>
                                    <li style="font-size: 12px">Yi Wu (Indiana Univ., USA)</li>
                                    <li style="font-size: 12px">Wenhan Luo (Tencent AI Lab)</li>
                                    <li style="font-size: 12px">Ming-Hsuan Yang （University of California at Merced, USA）</li>
                                     </list>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                     
							 
							  <br/><br/><br/><br/>
							
							<div class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
							<div class="col-lg-12 col-md-12 text-center">
							<h1 id="fh5co-logo">Team Member</h1>
							<br/>
							</div>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/5.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Hao Cheng</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Master<br /><br> Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/6.JPG" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Chenfeng Liu</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Master<br/><br> Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/7.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Xiaoyu Liu</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Master<br/> <br>Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/8.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Wenya Ma</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px;text-transform : capitalize "><br>Master<br/><br>Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/9.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Qinqin Nie</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px;text-transform : capitalize "><br>Master<br/><br> Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/10.png" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Haotian Wu</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px ;text-transform : capitalize"><br>Master<br/> <br>Tianjin University<br/></div></span>
							</article>
							<article class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
								<figure>
									<a href="#"><img src="<%=path%>/images/people/11.jpg" alt="Image" class="img-responsive"style= "margin: 0 auto;"></a>
								</figure>
								<h3 class="fh5co-article-title"><div style="text-align: center;"><a href="#">Lianjie Wang</a></div></h3>
								<span class="fh5co-meta fh5co-date"><div style="white-space:nowrap;font-size: 12px;text-transform : capitalize "><br>Master<br/><br>Tianjin University<br/></div></span>
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