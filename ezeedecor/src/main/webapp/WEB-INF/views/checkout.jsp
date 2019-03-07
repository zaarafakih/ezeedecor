<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
 <c:set var="i" value="1" scope="page"/>

</head>

<body>
  
<form method="post" action="${initParam['posturl']}" name="f1">



<input type="hidden" name="upload" value="1"/>
<input type='hidden' name='rm' value='2'>
<input type="hidden" name="currency-code" value="INR"/>
<input type="hidden" name="return" value="${initParam['returnurl']}"/>
<input type="hidden" name="cmd" value="_xclick"/>

<input type="hidden" name="business" value="${initParam['business']}"/>



<c:forEach items="${cartLines}" var="cartLine">
<input type="hidden" name="item_number" value="${cartLine.product.id}"/>
<input type="hidden" name="item_name" value="${cartLine.product.name}"/>
<input type="hidden" name="amount" value="${cartLine.product.unitPrice}"/>
<input type="hidden" name="quantity" value="1"/>
</c:forEach>


<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"/>
<script type="text/javascript">
            document.f1.submit();
        </script>
					


</form>
  
</body>
	</html>