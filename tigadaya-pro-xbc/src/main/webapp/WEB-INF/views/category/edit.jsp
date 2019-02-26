<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />
	
	<!-- code -->
	<div class="form-group">
		<label class="control-label col-md-2">Code</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="code" id="code" readonly="readonly"/>
		</div>
	</div>
	
	<!-- name -->
	<div class="form-group">
		<label class="control-label col-md-2">Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2">Description</label>
		<div class="col-md-10">
			<textarea  class="form-control" name="description" id="description"/>
		</div>
	</div>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" onClick="editData($('#form-edit'))">Update</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	</div>
	
	<input type="hidden" name="createdBy" id="createdBy" />
	
	<input type="hidden" name="createdOn" id="createdOn" />
	
	<input type="hidden" name="isDelete" id="isDelete" />
</form>
<!-- Form Selesai -->