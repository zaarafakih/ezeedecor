 
<%@include file="../shared/flows-header.jsp" %>
<div class="row">
<div class="col-sm-6">
<div class="panel panel-primary">

<div class="panel-heading">
<h4>Personal Details</h4>
</div>

<div class="panel-body">
<div class="text-center">

<h4>${registerModel.userr.firstName} ${registerModel.userr.lastName}</h4>
<h5>Email Id : ${registerModel.userr.email}</h5>
<h5>Contact Number : ${registerModel.userr.contactNumber}</h5>
<h5>Role : ${registerModel.userr.role}</h5>

</div>

</div>


<div class="panel-footer">
<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
</div>


</div>
</div>

<div class="col-sm-6">
<div class="panel panel-primary">

<div class="panel-heading">
<h4>Billing Details</h4>
</div>

<div class="panel-body">
<div class="text-center">

<h4>Address:${registerModel.billing.addressLine1} ${registerModel.billing.addressLine2}</h4>
<h5>${registerModel.billing.city} - ${registerModel.billing.postalCode}</h5>

<h5>${registerModel.billing.state} - ${registerModel.billing.country}</h5>


</div>
</div>


<div class="panel-footer">

<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
</div>
</div>
</div></div>

<div class="row">
<div class="col-sm-4 col-sm-offset-4">

<div class="text-center">
<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-primary">Confirm</a>

</div>

</div>

</div>

<%@include file="../shared/flows-footer.jsp" %>

