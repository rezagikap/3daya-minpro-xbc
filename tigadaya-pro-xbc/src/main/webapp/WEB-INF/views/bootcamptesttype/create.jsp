<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" minlength="5" required="" arial-required="true" placeholder="Name" required id="name"/>
			<label><span>required</span></label>
		</div>
	</div>
	
	<div class="form-group ">
		<div class="col-md-10">
			<input type="text" rows="5" class="form-control" minlength="5" name="notes" required="" arial-required="true" placeholder="Notes" required />
			<label><span>required</span></label>
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
		message:{
			name:{
				required: "done",
				minlength: "done"
			},
			notes:{
				required: "done",
				minlength: "done"
			}
		}
	}
});
</script>