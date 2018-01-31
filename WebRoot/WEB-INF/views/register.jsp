<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<!-- Bootstrap 核心 CSS 文件 -->
		<link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="<%=path%>/css/font-awesome/font-awesome.min.css" rel="stylesheet">
		<!-- JQuery CSS -->
   		<link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">
		<style type="text/css">
			body{background: url(${pageContext.request.contextPath}/images/bg1.jpg) no-repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:650px;margin:100px auto;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>
	</head>
	<body>
	<div class="container">
		<div class="form row">
			<form class="form-horizontal col-sm-offset-2 col-md-offset-2" method="post" id="register_form">
				<h3 class="form-title">Sign Up</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" onblur="checkUsername(this)" type="text" placeholder="Username" name="username" autofocus="autofocus"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required"  onblur="checkPassword(this)" id="password" type="password" placeholder="Password" name="password"/>
					</div>
					<div class="form-group">
							<i class="fa fa-check fa-lg"></i>
							<input class="form-control required" onblur="checkRePassword(this)" type="password" placeholder="Re-type Your Password" name="rpassword"/>
					</div>
					<div class="form-group">
							<i class="fa fa-pencil fa-lg"></i>
							<input class="form-control required" onblur="checkRealname(this)" type="text" placeholder=" Real Name" name="realname"/>
					</div>
					<div class="form-group">
							<i class="fa fa-envelope fa-lg"></i>
							<input class="form-control eamil" onblur="checkEmail(this)" type="text" placeholder=" Email" name="email"/>
					</div>
					<div class="form-group">
							<i class="fa fa-group fa-lg"></i>
							<input class="form-control required" onblur="checkOrg(this)" type="text" placeholder=" University,Group,institute,Corporation,etc" name="org"/>
					</div>
					<div class="form-group">
							<i class="fa fa-globe fa-lg"></i>
							<input class="form-control required" onblur="checkCountry(this)" type="text" placeholder=" Country,Region" name="country"/>
					</div>
					<div class="form-group">
						<input onclick="submitReg()" class="btn btn-group-sm btn-success pull-right" value="Sign Up "/>
						<input onclick="backReg()" class="btn btn-group-sm btn-info pull-left" id="back_btn" value="Back"/>
					</div>
				</div>
			</form>
		</div>
		</div>
		<script type="text/javascript">ctx="${pageContext.request.contextPath}";</script>
		<!-- jQuery -->
		<script src="<%=path%>/js/jquery/jquery.min.js"></script>
    	<script src="<%=path%>/js/jquery/toastr.js"></script>
    	<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
		<script src="<%=path%>/js/views/utils.js"></script>
		<script src="<%=path%>/js/views/checkMessage.js"></script>
	</body>
</html>

