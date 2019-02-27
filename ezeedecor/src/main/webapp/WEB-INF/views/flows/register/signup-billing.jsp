<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flows-header.jsp" %>
			<!-- Page Content -->
<div class="container">


<div class="row">

<div class="col-md-6 col-md-offset-3">
<div class="panel panel-primary">
<div class="panel heading">
<h4>Sign-up Address</h4>
</div>
<div class="panel-body">

<sf:form method="POST"
class="form-horizontal" id="billingForm" modelAttribute="billing">

<div class="form-group">
<label class="control-label col-md-4">Address Line 1</label>
<div class="col-md-8">
<sf:input type="text" path="addressLine1" class="form-control" placeholder="Address Line 1"/>
<sf:errors path="addressLine1" cssClass="help-block" element="em"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">Address Line 2</label>
<div class="col-md-8">
<sf:input type="text" path="addressLine2" class="form-control" placeholder="Address Line 2"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">City</label>
<div class="col-md-8">
<sf:input type="text" path="city" class="form-control" placeholder="City"/>
<sf:errors path="city" cssClass="help-block" element="em"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-md-4">Postal Code</label>
<div class="col-md-8">
<sf:input type="text" path="postalCode" class="form-control" placeholder="Postal Code"/>
<sf:errors path="postalCode" cssClass="help-block" element="em"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">State</label>
<div class="col-md-8">
<sf:input type="text" path="state" class="form-control" placeholder="State"/>
<sf:errors path="state" cssClass="help-block" element="em"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">Country</label>
<div class="col-md-8">
<sf:input type="text" path="country" class="form-control" placeholder="Country"/>
<sf:errors path="country" cssClass="help-block" element="em"/>
</div>
</div>

<div class="row">
<div class="form-group">
<div class="col-md-offset-4 col-md-8">

<button type="submit" class="btn btn-primary" name="_eventId_personal">
<span class="glyphicon glyphicon-chevron-left"></span>Previous- Personal 
</button>

<button type="submit" class="btn btn-primary" name="_eventId_confirm">
Next -Confirm<span class="glyphicon glyphicon-chevron-right"></span>
</button>
 
</div></div></div>


</sf:form>


</div>

</div>

</div>

</div>


</div>

	<%@include file="../shared/flows-footer.jsp" %>