
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- Navigation class="nav-item" -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${contextRoot}/home">EzeeDecor</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <ul class="nav navbar-nav navbar-right">
      <security:authorize access="isAnonymous()">
      
           <li id="register" class="nav-item" >
            <a class="nav-link" href="${contextRoot}/register">SignUp</a>
          </li>
          
          <li id="Login" class="nav-item" >
            <a class="nav-link" href="${contextRoot}/login">Login</a>
          </li>
          </security:authorize>
          <li class="dropdown" id="userCart">
          
          <security:authorize access="isAuthenticated()">
          
          <a href="#" 
          class="btn btn-default dropdown-toggle" 
          id="dropdownMenu1" 
          data-toggle="dropdown">
          ${userModel.fullName}
          <span class="caret"></span>
          
          </a>
          
          <ul class="dropdown-menu">
          <security:authorize access="hasAuthority('user')">
          
          <li class="dropdown-item"><a href="${contextRoot}/cart/show">
          <span class="glyphicon glyphicon-shopping-cart"></span>
          <span class="badge"> ${userModel.cart.cartLines}</span>
          - &#8377;  ${userModel.cart.grandTotal}
          </a></li>
          
          <li class="dropdown-item divider" role="separator"></li>
          
          </security:authorize>
          <li class="dropdown-item">
          <a href="${contextRoot}/perform-logout">Logout</a>
          </li>
          
          
          </ul></security:authorize>
          </li>
         
          
        </ul>
      <br/><br/>
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
       
        <ul class="navbar-nav ml-auto">
        
          <li id="home" class="nav-item">
            <a class="nav-link" href="${contextRoot}/home">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          
          <li id="about" class="nav-item">
            <a class="nav-link" href="${contextRoot}/about">About Us</a>
          </li>
          
          <li id="shop" class="nav-item" >
            <a class="nav-link" href="${contextRoot}/show/all/products">Shop</a>
          </li>
          
          <li id="design" class="nav-item">
            <a class="nav-link" href="${contextRoot}/design">Design</a>
          </li>
          
          <li id="makeover" class="nav-item">
            <a class="nav-link" href="${contextRoot}/makeover">MakeOver</a>
          </li>
          
          <li id="samples" class="nav-item">
            <a class="nav-link" href="${contextRoot}/samples">Samples</a></li>
            
            <security:authorize access="hasAuthority('ADMIN')">
            <li id="manageProducts" class="nav-item" >
            <a class="nav-link" href="${contextRoot}/manage/products">Manage Products</a>
          </li>
          </security:authorize>
          </ul>
          
         
      </div>
    </div>
  </nav>
  
  
  <script>
  window.userRole='${userModel.role}';
  </script>
