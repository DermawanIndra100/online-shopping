<div class="container">

	<!-- Breadcrumb -->
	<div class="row">

		<div class="col-12">

			<ol class="breadcrumb">
				<li class="breadcrumb-item active"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item active"><a href="${contextRoot}/show/all/products">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>
			</ol>
		
		</div>	
	
	</div>
	
	<div class="row">
	
		<!-- Display the product image -->
		<div class="col-12 col-sm-4">
		
			<div class="thumbnail">
							
				<img src="${images}/${product.code}.JPG" class="img img-responsive"/>
						
			</div>
		
		</div>
	
		
		<!-- Display the product description -->	
		<div class="col-12 col-sm-8">
			
			<h3>${product.name}</h3>
			<hr/>
			
			<p>${product.description}</p>
			<hr/>
			
			<h4>Price: <strong> &#82;&#112; ${product.unitPrice}</strong></h4>
			<hr/>
			
			<c:choose>
				
				<c:when test="${product.quantity < 1}">
				
					<h6>Qty. Available: <span style="color:red">Out of Stock!</span></h6>
					
				</c:when>
				<c:otherwise>				
					
					<h6>Qty. Available: ${product.quantity}</h6>
						
				</c:otherwise>
			
			</c:choose>
			
			
			<security:authorize access="hasAuthority('USER')">
			<c:choose>
				
				<c:when test="${product.quantity < 1}">
				
					<a href="javascript:void(0)" class="btn btn-info disabled"><strike>
					<i class="fa fa-shopping-cart"></i> Add to Cart</strike></a>
					
				</c:when>
				<c:otherwise>				
					
					<a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-info">
					<i class="fa fa-shopping-cart"></i> Add to Cart</a>
						
				</c:otherwise>
			
			</c:choose>
			</security:authorize>
			
			<security:authorize access="hasAuthority('ADMIN')">
				<a href="${contextRoot}/manage/${product.id}/product" class="btn btn-warning">
					<i class="fa fa-pencil"></i> Edit</a>
			</security:authorize>
			
			<a href="${contextRoot}/show/all/products" class="btn btn-danger">
				Back</a>
			
		</div>
		
	</div>
	
	
</div>