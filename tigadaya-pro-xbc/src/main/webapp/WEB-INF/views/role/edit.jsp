<%request.setAttribute("contextName", request.getServletContext().getContextPath());%>

<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<!-- code -->
	<div class="form-group">
		<label class="control-label col-md-2">Role Code</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="code" id="code" readonly="readonly" />
		</div>
	</div>
	<!-- name -->
	<div class="form-group">
		<label class="control-label col-md-2">Role Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name" />
		</div>
	</div>
	<!-- description -->
	<div class="form-group">
		<label class="control-label col-md-2">Description</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="description" id="description" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" id="createdBy" value="1"/>
	<input type="hidden" class="form-control" name="createdOn" id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy" value="1"/>
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy" value="1"/>
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" />
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" onClick="editData($('#form-edit'))">Simpan</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
	</div>
	
</form>
<!-- Form Selesai -->