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
		<!-- JQuery CSS -->
   		<link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">
		<!-- Bootstrap core CSS -->
		<link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=path%>/css/font-awesome/font-awesome.min.css">
		<!-- DataTables CSS -->
	    <link href="<%=path%>/css/datatables/dataTables.bootstrap.css" rel="stylesheet">
	    <link href="<%=path%>/css/datatables/select.dataTables.min.css" rel="stylesheet">
	    <!-- DataTables Responsive CSS -->
	    <link href="<%=path%>/css/datatables/dataTables.responsive.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="<%=path%>/css/views/main.css" rel="stylesheet">
		<link href="<%=path%>/css/views/personal.css" rel="stylesheet">
		<link href="<%=path%>/css/views/table.css" rel="stylesheet">
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
				<div class="col-md-0">
				</div>
				<div class="col-md-12" style="word-wrap:break-word;">
					<br/>
					<div class="col-xs-5 col-sm-12">
                    <h2>Welcome</h2>
                    <ul class="nav nav-tabs" role="tablist">  
					  <li role="presentation" class="active" id="chose_det"><a href="#tab-det" role="tab" onclick="showDet()" data-toggle="tab">My Image Detector</a></li>  
					  <li role="presentation" class="" id="chose_vdet"><a href="#tab-vdet" role="tab" onclick="showVdet()" data-toggle="tab">My Video Detector</a></li>  
					  <li role="presentation" class="" id="chose_sot"><a href="#tab-sot" role="tab" onclick="showSot()" data-toggle="tab">My Single-Object Tracker</a></li>  
					  <li role="presentation" class="" id="chose_mot"><a href="#tab-mot" role="tab" onclick="showMot()" data-toggle="tab">My Multi-Object Tracker</a></li>
					  <li role="presentation" class="" id="chose_your"><a href="#tab-your" role="tab" onclick="showYour()" data-toggle="tab">Change Personal Information</a></li>  
					</ul>      
					<!-- 面板区 -->  
					<div class="tab-content">  
					  <div class="tab-content">
                                    <div class="tab-pane " id="tab-det">
			                            <table class="table table-striped table-bordered table-hover table-condensed" id="dataTables-idet">
					                        <thead> 
												<tr>
													<th></th>
													<th>Detector Name</th>
							                        <th>Date</th>
							                        <th>AP</th>
							                        <th>APIoU(0.50)</th>
							                      	<th>APIoU(0.75)</th>
							                      	<th>AP-small</th>
							                      	<th>AP-medium</th>
							                      	<th>AP-large</th>
							                      	<th>AR-1</th>
							                      	<th>AR-10</th>
							                      	<th>AR-100</th>
							                      	<th>AR-small</th>
							                      	<th>AR-medium</th>
							                      	<th>AR-large</th>
							                        <th>Language</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
					                      </table>
											<button type="button" class="btn btn-default pull-right" onclick="updateIdet()"><i class="fa fa-pencil"></i> Update</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="removeIdet()"><i class="fa fa-times"></i> Remove</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="addIdet()"><i class="fa fa-plus"></i> Add</button>
			                            </table>
			                            <!-- /.table-responsive -->
	                                    </div>
										 <div class="tab-pane " id="tab-vdet">
				                            <table  style="width:100%" class="table tableArea display nowrap table-striped table-bordered table-hover table-condensed" id="dataTables-ivdet">			                            
				                                <thead>
													<tr>
														<th></th>
														<th>Detector Name</th>
								                        <th>Date</th>
								                        <th>AP</th>
								                        <th>APIoU(0.50)</th>
								                      	<th>APIoU(0.75)</th>
								                      	<th>AP-small</th>
								                      	<th>AP-medium</th>
								                      	<th>AP-large</th>
								                      	<th>AR-1</th>
								                      	<th>AR-10</th>
								                      	<th>AR-100</th>
								                      	<th>AR-small</th>
								                      	<th>AR-medium</th>
								                      	<th>AR-large</th>
								                        <th>Language</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<button type="button" class="btn btn-default pull-right" onclick="updateIdet()"><i class="fa fa-pencil"></i> Update</button>
				                            	<button type="button" class="btn btn-default pull-right" onclick="removeIdet()"><i class="fa fa-times"></i> Remove</button>
				                            	<button type="button" class="btn btn-default pull-right" onclick="addIdet()"><i class="fa fa-plus"></i> Add</button>
				                            </table>
				                            <!-- /.table-responsive -->
	                                    </div>
                                     <div class="tab-pane tableArea" id="tab-sot">
                                     	<table  style="width:100%" class="tableArea display nowrap table-striped table-bordered table-hover" id="dataTables-isot">			                            
			                            	<thead>
												<tr>
													<th></th>
													<th>Detector Name</th>
				                                    <th>Date</th>
				                                    <th>P-Overall</th>
				                                    <th>S-Overall</th>
				                                    <th>Speed</th>
				                                    <th>P-ARC</th>
				                                    <th>P-BC</th>
				                                    <th>P-CM</th>
				                                    <th>P-FM</th>
				                                    <th>P-FOC</th>
				                                    <th>P-IV</th>
				                                    <th>P-LR</th>
				                                    <th>P-OV</th>
				                                    <th>P-POC</th>
				                                    <th>P-SOB</th>
				                                    <th>P-SV</th>
				                                    <th>P-VC</th>
				                                    <th>S-ARC</th>
				                                    <th>S-BC</th>
				                                    <th>S-CM</th>
				                                    <th>S-FM</th>
				                                    <th>S-FOC</th>
				                                    <th>S-IV</th>
				                                    <th>S-LR</th>
				                                    <th>S-OV</th>
				                                    <th>S-POC</th>
				                                    <th>S-SOB</th>
				                                    <th>S-SV</th>
				                                    <th>S-VC</th>
				                                    <th>Language</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
											<button type="button" class="btn btn-default pull-right" onclick="updateIsot()"><i class="fa fa-pencil"></i> Update</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="removeIsot()"><i class="fa fa-times"></i> Remove</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="addIsot()"><i class="fa fa-plus"></i> Add</button>
		                            	</table>
		                            <!-- /.table-responsive -->
                                     </div>

                                     <div class="tab-pane tableArea" id="tab-mot">
                                        <table  style="width:100%" class="table tableArea display nowrap table-striped table-bordered table-hover table-condensed" id="dataTables-imot">			                            
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
											<button type="button" class="btn btn-default pull-right" onclick="updateImot()"><i class="fa fa-pencil"></i> Update</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="removeImot()"><i class="fa fa-times"></i> Remove</button>
			                            	<button type="button" class="btn btn-default pull-right" onclick="addImot()"><i class="fa fa-plus"></i> Add</button>
			                            </table>
			                            <!-- /.table-responsive -->
                                     </div>

                                     <div class="tab-pane" id="tab-your">
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
					</div>   
                </div><!--/.col-sm-6-->
				</div>
				<div class="col-md-0">
				</div>
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
	    <script src="<%=path%>/js/my/yourResults.js"></script>
		<script src="<%=path%>/js/views/viewsGlob.js"></script>
		<script src="<%=path%>/js/views/utils.js"></script>
		
	</body>
</html>