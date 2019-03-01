<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" minlength="5" required="" arial-required="true" placeholder="Name" required id="name"/>
			
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2">Is BootCamp Test?</label>
		<div class="col-md-10">
			<input type="radio" name="isBootcampTest" id="isBootcampTest" value="true" />Yes
			<input type="radio" name="isBootcampTest" id="isBootcampTest" value="false"/>No
			<label for="isBootcampTest" class="error">Please Select at least one </label>
		</div>
	</div>
	
	<div class="form-group ">
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" minlength="5" required="" arial-required="true" placeholder="Notes" required id="notes"/>
			
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="notes" value="1" />
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" value="1" />
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="1" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />
	
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">CANCEL</button>
	</div>

</form>
<script>
$("#form-create").validate({
	rules:{
		name:{
			required: true,
			minlength:5
		},
		notes:{
			required: true,
			minlength:5
		},
		isBootcampTest:{
			required : "isBootcampTest:checked",
			minlength: 1
		},
		message:{
			name:{
				required: "done",
				minlength:"done"
			},
			notes:{
				required :"done",
				minlength:"done"
			}
		}
	}
});

</script>