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
		<link rel="shortcut icon" href="<%=path%>/images/favicon.ico" type="image/x-icon" />
		<!-- Bootstrap 核心 CSS 文件 -->
		<script type="text/javascript">ctx="${pageContext.request.contextPath}";</script>
		<link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="<%=path%>/css/font-awesome/font-awesome.min.css" rel="stylesheet">
		<!-- 在bootstrap.min.js 之前引入 -->
		<script src="<%=path%>/js/jquery/jquery.min.js"></script>
    	<script src="<%=path%>/js/jquery/toastr.js"></script>
		<!-- JQuery CSS -->
   		<link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">
		<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<script src="<%=path%>/js/views/utils.js"></script>
		<script src="<%=path%>/js/views/loginCheck.js"></script>
		<style type="text/css">
			body{background: url(${pageContext.request.contextPath}/images/bg1.jpg) no-repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:650px;margin:100px auto;}
			#login_form{display: block;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>
	</head>
	<body>
	<div class="container">
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" method="post" action="<%=path%>/user/login">
				<h3 class="form-title">Login to your account</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" onblur="checkUsername(this)" type="text" placeholder="Username" name="username" autofocus="autofocus" maxlength="40"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" onblur="checkPassword(this)" type="password" placeholder="Password" name="password" maxlength="40"/>
					</div>
					<div class="form-group">
						<i class="fa fa-check fa-lg"></i>
						<input class="form-control required" onblur="checkCode(this)" placeholder="Verification Code" type="text" name="code" id="code"/>
					</div>
					<div class="form-group">
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					</div>
					<div class="form-group">
						<label class="checkbox">
							<input type="checkbox" onblur="enableLG()"/> Enable Login
						</label>
						<hr />
						<a href="<%=path%>/views/register" id="register_btn" class="">Create an account</a>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-md-3"><input onclick="backReg()" class="btn btn-info btn-block" id="back_btn" value="Back"/></div>
						<div class="col-sm-9 col-md-9"><input type="submit" class="btn btn-success btn-block" value="Login" disabled="disabled" id="loginSubmit" onclick="submitLogin()" /></div>
					</div>
				</div>
			</form>
		</div>
		</div>
	</body>
	<script type="text/javascript">
	$(document).ready(function(){
		var message = "${message}";
		if(message!=""){
			toastr.error(message);
		}
		changeCode();
		$("#codeImg").bind("click",changeCode);
	});
	</script>
</html>

