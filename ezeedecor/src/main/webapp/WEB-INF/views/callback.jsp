<%@page import="java.util.UUID"%>

      
         
      
            
      
<h1>Transaction Success</h1>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous">
</script>
<script src="jquery.invoice.js"></script>
<script>

jQuery().invoice({
	  addRow : "#addRow",
	  //delete : ".delete",
	  parentClass : ".item-row",

	  price : ".price",
	  qty : ".qty",
	  total : ".total",
	  totalQty: "#totalQty",

	  subtotal : "#subtotal",
	  discount: "#discount",
	  shipping : "#shipping",
	  grandTotal : "#grandTotal"
	});
</script>

<div class="container">
<div class="row">
<table class="table">

<thead>
<tr class="item-row">
<th>Transaction Id</th>
<th>User email id</th>
<th>Product Code</th>
<th>Product Name</th>
<th>Product Brand</th>
<th>Price</th>

</tr>
</thead>
<tbody>

<!--
<tr id="hiderow">
<td colspan="4">
<a id="addRow" href="javascript:;" title="Add a row" class="btn btn-primary">Add a row</a>
</td>
</tr>-->
<tr>
<!-- details -->
<c:forEach items="${cartLines}" var="cartLine">
<tr class="item-row">
<td><label><%=UUID.randomUUID().toString().substring(25, 35)%></label></td>
<td><label>${userModel.userr.email}</label></td>
<td><label>${cartLine.product.code}</label></td>
<td><label>${cartLine.product.name}</label></td>
<td><label>${cartLine.product.brand}</label></td>
<td><label> ${cartLine.buyingPrice}</label></td>



</tr>


</c:forEach>
<tr>
<td></td>
<td></td>
<td class="text-right"><strong>Grand Total</strong></td>
<td>${userModel.cart.grandTotal}</td>
</tr>


</tbody>
</table>



</div>

</div>
