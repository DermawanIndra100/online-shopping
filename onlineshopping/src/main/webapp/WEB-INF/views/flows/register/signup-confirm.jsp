<%@include file="../shared/flows-header.jsp"%>

<div class="container">
<div class="row">

	<div class="col-sm-6">

		<div class="card">

			<div class="card-header bg-primary">
				<h4>Personal Details</h4>
			</div>

			<div class="panel-body">
				&nbsp;
						<h3>Name : <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h3>
						<h4>Email : <strong>${registerModel.user.email}</strong></h4>
						<h4>Contact : <strong>${registerModel.user.contactNumber}</strong></h4>
						<h4>Role : <strong>${registerModel.user.role}</strong></h4>
						
				
			</div>			
				&nbsp;
				<a href="${flowExecutionUrl}&_eventId_personal"
					class="btn btn-primary">Edit</a>

		</div>
	</div>

	<div class="col-sm-6">

		<div class="card">

			<div class="card-header bg-primary">
				<h4>Billing Address</h4>
			</div>

			<div class="panel-body">
				&nbsp;
						<h3><strong>${registerModel.billing.addressLineOne}</strong></h3>
						<h4><strong>${registerModel.billing.addressLineTwo} </strong></h4>
						<h4><strong>${registerModel.billing.city} -  ${registerModel.billing.postalCode}</strong></h4>
						<h4><strong>${registerModel.billing.state}</strong></h4>
						<h4><strong>${registerModel.billing.country}</strong></h4>
		
			</div>
				&nbsp;
				<a href="${flowExecutionUrl}&_eventId_billing"
					class="btn btn-primary">Edit</a>
	</div>

</div>

</div>
<br><br>
<!-- to provide the confirm button after displaying the details -->
<div class="row">

	<div class="col-sm-12 col-sm-offset-6">

		<div class="text-center">

			<a href="${flowExecutionUrl}&_eventId_submit"
				class="btn btn-lg btn-primary">Confirm</a>

		</div>

	</div>

</div>


</div>
<%@include file="../shared/flows-footer.jsp"%>
