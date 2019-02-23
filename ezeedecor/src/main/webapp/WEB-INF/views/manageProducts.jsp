
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissable">

					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>
		<div class="com-md-offset-2 col-md-8">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
					<br>
				</div>
				<div class="panel-body">
					<!-- FORM ELEMENTS -->

					<!-- to avoid using table to place form components -->
					<!--  modelAttribute="product" thsi product comes from managercontroller

here in sf-> name chnanges to path & path will have same value as entity class fields
-->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="row">
							<label class="control-label col-md-4" for="name">Enter
								Product Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<br>
						<div class="row">
							<label class="control-label col-md-4" for="brand">Enter
								Product Brand:</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Product Brand" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>
						<br>
						<br>


						<div class="row">
							<label class="control-label col-md-4" for="decription">Product
								Description:</label>
							<div class="col-md-8">
								<sf:textarea type="text" path="description" id="description"
									rows="4" placeholder="Product Description" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>
						<br>
						<br>

						<div class="row">
							<label class="control-label col-md-4" for="unitPrice">Product
								Price:</label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Product Price" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>
						<br>
						<br>


						<div class="row">
							<label class="control-label col-md-4" for="quantity">Quantity
								Available:</label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Product Quantity Available" class="form-control" />

							</div>
						</div>
						<br>
						<br>

						<div class="row">
							<label class="control-label col-md-4" for="file">Select
								an image: </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>
						<br>
						<br>


						<div class="row">
							<label class="control-label col-md-4" for="categoryId">Select
								Category:</label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />
								<c:if test="${product.id==0}">
									<div class="text-right">
										<br />

										<button type="button" data-toggle="modal"
											data-target="#myCategoryModal" class="btn btn-warning btn-sm">Add
											a Category</button>
									</div>
								</c:if>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" name="submit" id="submit"
										placeholder="Submit" class="btn btn-primary" />
									<!-- Hidden fields for Products -->
									<sf:hidden path="id" />
									<sf:hidden path="code" />
									<sf:hidden path="supplierId" />
									<sf:hidden path="Active" />
									<sf:hidden path="purchases" />
									<sf:hidden path="views" />
								</div>
							</div>
						</div>
					</sf:form>

				</div>

			</div>
		</div>
	</div>


	<div class="row">

		<div class="col-xs-12">
			<h3>Available Products:</h3>
		</div>
		<div class="col-xs-12">

			<div style="overflow: auto">
				<table id="adminProductsTable"
					class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>&#160;</th>
							<th>Name</th>
							<td>Brand</td>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>ID</th>
							<th>&#160;</th>
							<th>Name</th>
							<td>Brand</td>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</tfoot>

				</table>

			</div>

		</div>

	</div>
	
	<div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
	<!-- MODAL HEADER -->
	<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">
	<span>&times;</span>
	</button>
	</div>
	<div class="modal-body">
	<sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category"
	method="POST" class="form-horizontal">
	
	<div class="form-group">
	<label for="cat_name" class="control-label col-md-4">Category Name:</label>
	<div class="col-md-8">
	<sf:input path="name" type="text" id="cat_name" class="form-control"/>
	</div>
	</div>
	
	<div class="form-group">
	<label for="cat_description" class="control-label col-md-4">Category Description:</label>
	<div class="col-md-8">
	<sf:textarea path="description" type="text" id="cat_description" class="form-control" rows="5"/>
	</div>
	</div>
	
	<div class="form-group">
	<div class="col-md-offest-4 col-md-8">
	<input type="submit" value="Add a category" class="btn btn-primary"/>
	</div>
	</div>
	
	
	</sf:form>
	
	</div>
	</div>
	</div>
	</div>
	
	
	
	
	
</div>