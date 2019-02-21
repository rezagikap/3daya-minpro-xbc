<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-2">Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Notes</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" />
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary"><i class="fa fa-save"></i></button>
		<button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-reply"></i></button>
	</div>
</form>
<!-- Form Selesai -->