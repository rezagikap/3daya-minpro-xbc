<!-- form mulai -->
<form id="form-delete" class="form-horizontal">
	
	<center>
	<h3>Are you sure to delete this data ?</h3>
	</center>
	
	<input type="hidden" name="id" id="id" />
	<input type="hidden" name="name" id="name" />
	<input type="hidden" name="notes" id="notes" />
	
	
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->