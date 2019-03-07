<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@include file="../shared/flows-header.jsp" %>


<!--  
<script type="text/javascript">
function validatePass(){
	var pass=document.getElementById("password");
	var confpass=document.getElementById("confirmPassword");
	if(pass.equals(confpass)){
		return false;
	}
	 return true;
	
}

</script> -->
			<!-- Page Content -->
<div class="container">
<div class="row">

<div class="col-md-6 col-md-offset-3">
<div class="panel panel-primary">
<div class="panel heading">
<h4>Sign-up Personal</h4>
</div>
<div class="panel-body">

<sf:form method="POST"
class="form-horizontal" id="registerForm" modelAttribute="userr">

<div class="form-group">
<label class="control-label col-md-4">First Name</label>
<div class="col-md-8">
<sf:input type="text" path="firstName" class="form-control" placeholder="First Name"/>
<sf:errors path="firstName" cssClass="help-block" element="em"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-md-4">Last Name</label>
<div class="col-md-8">
<sf:input type="text" path="lastName" class="form-control" placeholder="Last Name"/>
<sf:errors path="lastName" cssClass="help-block" element="em"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-md-4">Email Id</label>
<div class="col-md-8">
<sf:input type="text" path="email" class="form-control" placeholder="e.g. john@ggg.com"/>
<sf:errors path="email" cssClass="help-block" element="em"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">Contact Number</label>
<div class="col-md-8">
<sf:input type="text" path="contactNumber" class="form-control" placeholder="e.g. 7989098765"/>
<sf:errors path="contactNumber" cssClass="help-block" element="em"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-md-4">Password</label>
<div class="col-md-8">
<sf:input type="password" path="password" class="form-control" placeholder="******" id="password"/>
<sf:errors path="password" cssClass="help-block" element="em"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-md-4">Confirm Password</label>
<div class="col-md-8">

<input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="******"/>

<sf:errors id="confirmPassword" cssClass="help-block" element="em"/>
</div>
</div>


<div class="form-group">
<label class="control-label col-md-4">Select Role:</label>
<div class="col-md-8">
<label class="radio-inline">
<sf:radiobutton path="role" value="user" checked="checked"/>User
</label>

<label class="radio-inline">
<sf:radiobutton path="role" value="supplier"/>Supplier
</label>


</div>
</div>

<div class="row">
<div class="form-group">
<div class="col-md-offset-4 col-md-8">

<button type="submit" class="btn btn-primary" name="_eventId_billing">
Next- Billing <span class="glyphicon glyphicon-chevron-right"></span>
</button>
 
</div></div></div>

</sf:form>


</div>

</div>

</div>

</div>

</div>

	<%@include file="../shared/flows-footer.jsp" %>