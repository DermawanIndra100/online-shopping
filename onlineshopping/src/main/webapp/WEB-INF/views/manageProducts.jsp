<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-8">
				<div class="alert alert-info alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>

		<div class="col-md-offset-4 col-md-8">
			<div class="card ">
				<div class="card-header bg-primary">
					<h4>Product Management</h4>
				</div>
				<div class="card-body">
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<!--  <em class="help-block">Please Enter Product Name!</em> -->
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Brand Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Product
								Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									class="form-control" placeholder="Write a description here!" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Unit Price: </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Unit Price in IDR" class="form-control" />
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Quantity
								Available: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control" />
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
							</div>
						</div>

						<!-- File element for image upload -->
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select
								an File: </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
								<sf:errors path="file" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Select
								Category: </label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />
								<c:if test="${product.id == 0}">
									<div class="text-right">
										<br />
										<button type="button" data-toggle="modal"
											data-target="#myCategoryModal" class="btn btn-warning btn-sm">Add
											Category</button>
									</div>
								</c:if>

							</div>
						</div>


						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-info" />
								<!-- hidden input yang gak ada di form -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />
							</div>
						</div>



					</sf:form>


				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class='col-12'>
			<h3>Available Products</h3>

		</div>

		<div class="col-12">
			<div class="container-fluid">
				<div class="table-responsive">
				
				<table id="adminProductsTable"
					class="table table-condensed table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</thead>

				</table>
			</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" role="dialog"
		tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<sf:form id="categoryForm" modelAttribute="category"
						action="${contextRoot}/manage/category" class="form-horizontal"
						method="POST">
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category
								Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="category_name"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="category_description" class="control-label col-md-4">Category
								Description</label>
							<div class="col-md-8 validate">
								<sf:textarea path="description" class="form-control"
									id="category_description" cols="" row="5" />
							</div>
						</div>

						<div class="text-right">
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" name="submit" value="Add Category"
										class="btn btn-primary" />
								</div>
							</div>
						</div>
					</sf:form>






				</div>
			</div>
		</div>
	</div>

















</div>