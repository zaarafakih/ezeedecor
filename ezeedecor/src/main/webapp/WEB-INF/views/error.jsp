<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />


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


<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<link href="${css}/bootstrap.css" rel="stylesheet">


<!-- Bootswatch Theme for this Website -->
<link href="${css}/bootswatch-theme-lux.css" rel="stylesheet">

<!-- DataTable bootstrap -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="${css}/myweb.css" rel="stylesheet">



<script src="${js}/myactivenav.js"></script>

</head>

<body>
	<div class="wrapper">

		<div class="container">
		
		<div class="navbar-header">
      <a class="navbar-brand" href="${contextRoot}/home"><u>Go back to the website</u></a>
		
		</div></div>
<hr/>

		<div class="content">
			
			<div class="container">
			
			<div class="row">
			
			<div class="col-xs-12">
			<div class="jumbotron">
			
			<h1>${errorTitle}</h1>
			<hr/>
			<blockquote>
			${errorDescription}
			</blockquote>
			
			
			</div>
			
			
			</div>
			</div>
			
			
			</div>
			
			
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>



	</div>
</body>

</html>
