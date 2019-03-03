<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>EzeeDecor-${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS 
<!--this is the cdn link-->

<script src="${js}/jquery.js"></script>





<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<!-- 
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

 -->

<!-- 
 <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
-->


<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="${css}/bootstrap.min.css" rel="stylesheet">



<!-- Bootswatch Theme for this Website -->
<link href="${css}/bootswatch-theme-lux.css" rel="stylesheet">

<!-- DataTable bootstrap -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">






<!-- Custom styles for this template -->
<link href="${css}/myweb.css" rel="stylesheet">

<style type="text/css">
.dataTableImg {
	width: 250px;
	height: 250px;
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

<!-- css for cart-->
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}

.cartImg{
width:100px;
height:100px;
}

.unavailable{
color:red;
}

</style>
<!-- JQUERY JS-->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script> 
         
<script src="${js}/jquery.js"></script>
<script src="${js}/jquery.validate.js"></script>

<!--  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
-->


<!-- Bootstrap core JavaScript -->
<script src="${js}/bootstrap.js"></script>

<!-- datatable plugin -->
<script src="${js}/jquery.dataTables.js"></script>

<!-- datatable js -->
<script src="${js}/dataTables.bootstrap.js"></script>
<!-- Bootbox js 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/3.3.0/bootbox.min.js"></script> -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

<script src="${js}/bootbox.min.js"></script>



<script src="${js}/myactivenav.js"></script>

</head>

<body>
	<div class="wrapper">

		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>


		<div class="content">
			<!-- Page Content -->

			<c:if test="${userClickHome==true}">
				<%@include file="home.jsp"%>
			</c:if>

			<c:if test="${userClickAbout==true}">
				<%@include file="about.jsp"%>
			</c:if>

			<c:if
				test="${userClickCategoryProducts==true or userClickAllProducts==true}">
				<%@include file="shop.jsp"%>
			</c:if>

			<c:if test="${userClickDesign==true}">
				<%@include file="design.jsp"%>
			</c:if>

			<c:if test="${userClickMakeover==true}">
				<%@include file="makeover.jsp"%>
			</c:if>

			<c:if test="${userClickSamples==true}">
				<%@include file="samples.jsp"%>
			</c:if>

			<c:if test="${userClickViewProduct==true}">
				<%@include file="viewproduct.jsp"%>
			</c:if>

			<c:if test="${userClickManageProduct==true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>
			
			<c:if test="${ userClickShowCart==true}">
				<%@include file="cart.jsp"%>
			</c:if>

		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>



	</div>
</body>

</html>
