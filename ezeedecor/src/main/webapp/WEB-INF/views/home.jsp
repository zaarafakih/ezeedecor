
<!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

          
        <%@include file="./shared/sidebar.jsp"%>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
             <video class="d-block img-fluid" src="${contextRoot}/resources/images/ezeedecor1.mp4" alt="Tutorial" preload autoplay loop/>
              
            </div>
            <div class="carousel-item">
            <img class="d-block img-fluid" src="${contextRoot}/resources/images/slider1.jpg" alt="Sketch">
              
            </div>
            <div class="carousel-item">
             <img class="d-block img-fluid" src="${contextRoot}/resources/images/slider2.png" alt="Setup">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
<c:forEach items="${categories}" var="category">
	<!--  	<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a>
	-->
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="${contextRoot}/show/category/${category.id}/products"><img class="card-img-top" src="" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="${contextRoot}/show/category/${category.id}/products">${category.name}</a>
                </h4>
                <p class="card-text">${category.description}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

</c:forEach>

          

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->