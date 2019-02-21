<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-edit" class="form-horizontal">
<input type="hidden" name="id" id="id" />

	<div class="form-group">
		<label class="control-label col-md-2"> NAME</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2"> CREATED BY</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="createdBy" id="createdBy"/>
		</div>
	</div>
	<input type="hidden" class="form-control" name="isBootcampTest" value="true" />
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
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-primary"><i class="fa fa-save"></i></button>
		<button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-reply"></i></button>
	</div>

</form>