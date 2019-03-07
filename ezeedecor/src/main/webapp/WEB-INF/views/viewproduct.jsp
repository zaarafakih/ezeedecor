 <div class="container">

    <div class="row">
    
    
    <div class="col-xs-12">
    <ol class="breadcrumb">
    <li class="breadcrumb-item active"><a href="${contextRoot}/home">Home</a></li>
    <li class="breadcrumb-item active"><a href="${contextRoot}/show/all/products">All Products</a></li>
    <li class="breadcrumb-item active">${product.name}</li>
    </ol>
    </div>
    
    
    
    <!-- to display product image -->
    <div class="col-xs-12 col-sm-4">
    <img src="${images}/${product.code}.jpg" class="img img-responsive img-fluid viewProductImg"/>
    
    </div>
    
    <!-- to display product description -->
    
  
    
    <div class="col-xs-12 col-sm-8">
    <h3>${product.name} </h3>
    <hr/>
    
    <p><strong>Description:</strong></p>
    <p> ${product.description} </p>
    <hr/>
    
    <h4><strong>Price: &#8377; ${product.unitPrice} /-</strong></h4>
    <hr/>
    
   
    <c:choose>
    <c:when test="${product.quantity < 1}">
    <h6>Qty. Available : <span style="color:red">Out of Stock!</span></h6>
    </c:when>
    <c:otherwise>
     <h6>Qty. Available : ${product.quantity}</h6>
    </c:otherwise>
    </c:choose>
    
    <hr/>
    
   
    
   <!--   <security:authorize access="hasAuthority('user')">
   
     </security:authorize>
   
   -->
    <c:choose>
    <c:when test="${product.quantity < 1}">
        <a href="javascript:void(0)" class="btn btn-success disabled"><strike><span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</strike></a>
    
    </c:when>
    
    <c:otherwise>
    <a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</a>
   </c:otherwise></c:choose>
 
   
   
   
   <security:authorize access="hasAuthority('ADMIN')">
   
   <a href="${contextRoot}/manage/${product.id}/product" class="btn btn-warning">
   <span class="glyphicon glyphicon-shopping-pencil"></span>
   Edit</a>
   </security:authorize>
   
   
   <a href="${contextRoot}/show/all/products" class="btn btn-success">Continue Shopping</a>
    </div>
    
    
    </div>
    </div>