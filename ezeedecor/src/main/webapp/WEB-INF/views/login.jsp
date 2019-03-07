<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="fonts" value="/resources/fonts" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EzeeDecor-${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS 
<!--this is the cdn link-->

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

-->

<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="${css}/bootstrap.min.css" rel="stylesheet">



<!-- Bootswatch Theme for this Website -->
<link href="${css}/bootswatch-theme-lux.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="${css}/myweb.css" rel="stylesheet">

<style type="text/css">
.dataTableImg {
	width: 100px;
	height: 100px;
}

.viewProductImg {
	width: 250px;
	height: 250px;
}

.adminDataTableImg {
	height: 50px;
	width: 50px;
}

/*Toggle switch*/
.switch {
	width: 50px;
	height: 30px;
	position: relative;
	display: inline-block;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	cursor: pointer;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px!important;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}
input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(20px);
	-ms-transform: translateX(20px);
	transform: translateX(20px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
<!-- JQUERY JS -->
<script src="${js}/jquery.js"></script>
<script src="${js}/jquery.validate.js"></script>

<!--  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
-->


<!-- Bootstrap core JavaScript -->
<script src="${js}/bootstrap.js"></script>




<script src="${js}/myactivenav.js"></script>

</head>

<body>
	<div class="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container">

 <a class="navbar-brand" href="${contextRoot}/home">EzeeDecor</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
</div>
</nav>
		

		<div class="content">
			<!-- Page Content -->
			<div class="container">
			<c:if test="${not empty message}">
			<div class="row">
			<div class="col-md-offset-3 col-md-6">
			
			<div class="alert alert-danger">
			${message}
			</div>
			</div>
			
			</div>
			
			</c:if>
			
			<c:if test="${not empty logout}">
			<div class="row">
			<div class="col-md-offset-3 col-md-6">
			
			<div class="alert alert-success">
			${logout}
			</div>
			</div>
			
			</div>
			
			</c:if>
<div class="row">
<div class="col-md-offest-3 col-md-6">
<div class="panel panel=primary">

<div class="panel-heading">
<h4>Login</h4>
</div>

<div class="panel-body">

<form action="${contextRoot}/login" method="POST" class="form-horizontal" id="loginForm">

<div class="form-group">
<label for="username" class="col-md-4 control-label">Email: </label>
<div class="col-md-8">
<input type="text" name="username" id="username" class="form-control"/>
</div>
</div>


<div class="form-group">
<label for="password" class="col-md-4 control-label">Password: </label>
<div class="col-md-8">
<input type="password" name="password" id="password" class="form-control"/>
</div>
</div>

<div class="form-group">
<div class="col-md-offset-4 col-md-8">
<input type="submit" value="login" class="btn btn-primary"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</div>
</div>

</form>

<div class="panel-footer">
<div class="text-right">

New User?<a href="${contextRoot}/register">Register Here</a>
</div>

</div>

</div>
</div>

</div>
</div></div>

			

		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>



	</div>
</body>

</html>
