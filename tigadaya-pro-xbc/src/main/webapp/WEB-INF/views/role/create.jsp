<!-- Form mulai -->
<form id="form-create" class="form-horizontal">

	<div class="form-group">
		<label class="control-label col-md-2">Role Code</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="code" placeholder="Role Code" />
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2">Role Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" placeholder="Role Name" />
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2">Description</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="description" placeholder="Description" style="resize:none" />
			
		</div>
	</div>	
	
	<input type="hidden" class="form-control" name="createdBy" id="createdBy" value="1"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy" value="1"/>
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy" value="1"/>
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" value="false" />
	
	
	
	
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">Save</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
	</div>
	
</form>
<!-- Form Selesai -->