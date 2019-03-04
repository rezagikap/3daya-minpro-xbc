<!-- form mulai -->
<form id="form-trainer" class="form-horizontal">
		
	<div class="form-group">
		<label class="control-label col-md-1"></label>
			<div class="col-md-10">
				<select name="trainerId" class="form-control" id="trainerId">
				<option value="">-Choose Trainer-</option>
				</select>
			</div>
	</div>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" style ="position: relative; right: 160px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addTrainer($('#form-trainer'))" class="btn btn-warning" style ="position: relative; right: 35px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->