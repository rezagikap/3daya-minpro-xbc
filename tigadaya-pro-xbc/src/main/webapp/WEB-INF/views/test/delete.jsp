<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h2>Are you sure to delete this data ?</h2>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" name="createdBy" id="createdBy" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->