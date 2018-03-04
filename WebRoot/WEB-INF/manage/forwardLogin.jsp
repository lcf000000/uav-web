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
		<!--用百度的静态资源库的cdn安装bootstrap环境-->
		<!-- Bootstrap 核心 CSS 文件 -->
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
		<style type="text/css">
			body{background: url(${pageContext.request.contextPath}/images/bg1.jpg) no-repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:650px;margin:100px auto;}
			#login_form{display: block;}
			#register_form{display: none;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8 panel panel-default" id="show-info" style="word-wrap:break-word;">
						<div class="col-xs-10 col-sm-12">
							<h3>Please login first! Redirect to login page...  <span id="time"></span> S</h3>
						</div>
					</div>
					<div class="col-md-2">
					</div>
				</div>
		</div>
	</body>
	<script type="text/javascript">
			var i = 3; 
			var intervalid; 
			intervalid = setInterval("fun()", 1000); 
			function fun() { 
				if (i == 0) { 
				window.location.href = ctx + "/manage/admin-login"; 
				clearInterval(intervalid); 
				} 
				document.getElementById("time").innerHTML = i; 
				i--; 
			} 
	</script>
</html>