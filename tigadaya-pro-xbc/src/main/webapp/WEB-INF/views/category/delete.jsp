<form id="form-delete" class="form-horizontal">
	<center>
		<h3>Are you sure to delete this data?</h3>
	</center>

	<input type="hidden" name="id" id="id" /> <input type="hidden"
		name="code" id="code" /> <input type="hidden" name="name" id="name" />
	<input type="hidden" name="description" id="description" /> <input
		type="hidden" name="createdBy" id="createdBy" /> <input type="hidden"
		name="createdOn" id="createdOn" /> <input type="hidden"
		name="isDelete" id="isDelete" />


	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" data-dismiss="modal">No</button>
		<button type="button" class="btn btn-danger" onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>