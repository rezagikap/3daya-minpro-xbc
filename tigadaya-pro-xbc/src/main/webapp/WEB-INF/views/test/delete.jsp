<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h2>Are you sure to delete this data ?</h2>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" name="isBootcampTest" id="isBootcampTest" />
	<input type="hidden" name="notes" id="notes" />
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	<input type="hidden" name="modifiedBy" id="modifiedBy" />
	<input type="hidden" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" name="isDelete" id="isDelete" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->