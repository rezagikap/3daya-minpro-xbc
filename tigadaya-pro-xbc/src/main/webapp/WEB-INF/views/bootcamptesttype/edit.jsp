<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-edit" class="form-horizontal">
<input type="hidden" name="id" id="id" />

	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name"/>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" id="notes"  />
		</div>
	</div>
	
	
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" value="1" />
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="1" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />
	
	
	<div class="modal-footer">
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-primary">SAVE</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">CANCEL</button>
	</div>

</form>