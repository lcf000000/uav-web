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
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="<%=path%>/manager/login"  method="post">
				<h3 class="form-title">Login to your account</h3>
				<div class="col-sm-9 col-md-9">
					<span id="pwderr" class="errInfo"></span>
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="Username" name="username" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="Password" name="password" maxlength="8"/>
					</div>
					<div class="form-group">
						<i class="fa fa-lock fa-lg"></i>
						<input class="form-control required" type="text" name="code" id="code"/>
					</div>
					<div class="form-group">
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					</div>
					<div class="form-group">
						<label class="checkbox">
							<input type="checkbox" name="remember" value="1"/> Remember me
						</label>
						<hr />
						<a href="<%=path%>/views/register.jsp" id="register_btn" class="">Create an account</a>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="Login "/>   
					</div>
				</div>
			</form>
		</div>
		</div>
		<script type="text/javascript">
		var errInfo = "${errInfo}";
		//设置显示配置
	    var messageOpts = {
	       "closeButton" : true,//是否显示关闭按钮
	       "debug" : false,//是否使用debug模式
	       "positionClass" : "toast-top-center",//弹出窗的位置
	       "onclick" : null,
	       "showDuration" : "300",//显示的动画时间
	       "hideDuration" : "1000",//消失的动画时间
	       "timeOut" : "5000",//展现时间
	       "extendedTimeOut" : "1000",//加长展示时间
	       "showEasing" : "swing",//显示时的动画缓冲方式
	       "hideEasing" : "linear",//消失时的动画缓冲方式
	       "showMethod" : "fadeIn",//显示时的动画方式
	       "hideMethod" : "fadeOut" //消失时的动画方式
	   	};
	   	toastr.options = messageOpts;
		$(document).ready(function(){
			if("${sessionScope.message}"!=""){
				toastr.error("${sessionScope.message}");
			}
			changeCode();
			$("#codeImg").bind("click",changeCode);
			if(errInfo!=""){
				if(errInfo.indexOf("验证码")>-1){
					$("#codeerr").show();
					$("#codeerr").html(errInfo);
					$("#code").focus();
				}else{
					$("#nameerr").show();
					$("#nameerr").html(errInfo);
				}
			}
			$("#loginname").focus();
		});
		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}
	
		function changeCode(){
			$("#codeImg").attr("src","${pageContext.request.contextPath}/code?t="+genTimestamp());
		}
		</script>
	</body>
</html>

