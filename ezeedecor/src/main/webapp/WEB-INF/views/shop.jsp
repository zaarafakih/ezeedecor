<div class="container">
	<div class="row">

		<!-- Sidebar -->
		<div class="col-lg-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<!-- Products -->
		<div class="col-lg-9">
			<!-- BreadCrumb Component -->
			<div class="row">
				<div class="col-lg-12">
					<!-- for all products -->
					<c:if test="${userClickAllProducts==true}">
						<script>
							window.categoryId = '';
						</script>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							<li class="breadcrumb-item active"><a href="${contextRoot}/show/all/products">All Products</a></li>
						</ol>
					</c:if>

					<!-- for particular category -->
					<c:if test="${userClickCategoryProducts==true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ol class="breadcrumb">
						
							 <li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							 
							<li class="breadcrumb-item active"><a href="${contextRoot}/show/all/products">All Products</a></li>
							<li class="breadcrumb-item active">Category</li>
							<li class="breadcrumb-item active">${category.name}</li>

						</ol>
					</c:if>
				</div>
				<div class="row">
					<div class="row">

						<div class="col-xs-12">
							<table id="productListTable"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th></th>
										<th>Name</th>
										<th>Brand</th>
										<th>Price</th>
										<th>Qty. Available</th>
										<th></th>
									</tr>
								</thead>
								
								<tfoot>
									<tr>
										<th></th>
										<th>Name</th>
										<th>Brand</th>
										<th>Price</th>
										<th>Qty. Available</th>
										<th></th>
									</tr>
								</tfoot>

							</table>
						</div>
					</div>

				</div>


			</div>
		</div>
	</div>
</div>