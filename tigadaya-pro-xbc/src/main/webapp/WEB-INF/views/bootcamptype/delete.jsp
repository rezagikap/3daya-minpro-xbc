<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" name="notes" id="notes" />
	<input type="hidden" name="createdBy" id="createdBy" />
	<input type="hidden" name="createdOn" id="createdOn" />
	<input type="hidden" name="modifiedBy" id="modifiedBy" />
	<input type="hidden" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" name="isDelete" id="isDelete" />
	
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" style="position: relative; right: 275px; padding: 10px 24px"; data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" style="position: relative; right: 120px; padding: 10px 23px"; onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->