<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />
	<!-- name -->
	<div class="form-group">
		<label class="control-label col-md-2">Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name" />
		</div>
	</div>
	<!-- notes -->
	<div class="form-group">
		<label class="control-label col-md-2">Notes</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" id="notes"/>
		</div>
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" data-dismiss="modal">CANCEL</button>
		<button type="button" class="btn btn-primary" onClick="editData($('#form-edit'))">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->