<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Online Shopping - ${title}</title>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap template color -->
<link href="${css}/ubuntu.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<!--<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">-->
<!--ini gak perlu karena pake dataTable.bootstrap4.css -->

<!-- Bootstrap data table -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
	
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	

</head>

<body>

	<div class="wrapper">
		
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <a class="navbar-brand" href="${contextRoot}/home">Home</a>
	            </div>
			</div>
		</nav>
		
		<div class="content">
		
			<div class="container">
			
				<div class="row">
				
					<div class="col-12">
						
						<div class="jumbotron">
						
							<h1>${errorTitle}</h1>
							<hr/>
						
							<blockquote style="word-wrap:break-word">
								
								${errorDescription}
							
							</blockquote>						
						
						</div>
						
					</div>
					
				</div>
			
			</div>
		</div>


		<!-- Footer comes here-->
		<%@include file="./shared/footer.jsp"%>

	</div>

</body>

</html>
