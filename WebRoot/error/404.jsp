<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)">
<title>404</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="<%=path%>/images/error/favicon.png">
<link href="<%=path%>/css/views/base.css" rel="stylesheet">

</head>
<body style="background:white;">

<!-- Login page -->
<div id="error404" class="other_pages" >
  <div class="row-fluid container spacer fluid">
    <div class="span12">
      <h2>Not sure if</h2>
      <h1>404 Page&nbsp;&nbsp;<img src="<%=path%>/images/error/404.png" alt="资源未找到" /></h1>
      <h3 class="bottom-line">Or I don`t get the joke</h3>
    </div>
  </div>
  <!-- End .container -->
</div>

</body>
</html>