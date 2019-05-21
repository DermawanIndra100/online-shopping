<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div class="container">

	<div class="row">
		<div class="col-md-offset-4 col-md-8">
			<div class="card ">
				<div class="card-header bg-primary">
					<h4>Product Management</h4>
				</div>
				<div class="card-body">
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product">
					
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter Product Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/>
								<!--  <em class="help-block">Please Enter Product Name!</em> -->
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter Brand Name: </label>
							<div class="col-md-8">	
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control"/>
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Product Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4" class="form-control"
									placeholder="Write a description here!" /> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter Unit Price: </label>
							<div class="col-md-8">	
								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price in IDR" class="form-control"/>
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Quantity Available: </label>
							<div class="col-md-8">	
								<sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available" class="form-control"/>
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Select Category: </label>
							<div class="col-md-8">	
								<sf:select class="form-control" id="categoryId" path="categoryId" 
									items="${categories}"
									itemLabel="name"
									itemValue="id"
								/>
									
								<!-- <em class="help-block">Please Enter Brand Name!</em> -->
							</div>
						</div>
						
						
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="brand" id="submit" value="Submit" class="btn btn-info"/>
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

</div>