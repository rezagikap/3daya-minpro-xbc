<!-- form mulai -->
<form id="form-delete" class="form-horizontal">


	<h3>
		<center>
			<b>Are you sure to delete this data ?</b>
		</center>
	</h3>

	<input type="hidden" class="form-control" name="id"id="id" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left"
			data-dismiss="modal">No</button>
		<button type="button" class="btn btn-danger"
			onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->