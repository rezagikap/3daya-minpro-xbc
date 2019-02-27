<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" placeholder="Name"/>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea  class="form-control" name="notes" placeholder="Notes" style="resize:none"/>
		</div>
	</div>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" style = "position:relative;right:160px;top:2px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-warning" style = "position:relative;right:35px;top:2px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->