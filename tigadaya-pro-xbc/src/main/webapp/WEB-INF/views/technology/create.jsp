<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" placeholder="Name" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea  class="form-control" name="notes" placeholder="Notes" style="resize:none"/>
		</div>
	</div>
		<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<br>


	<hr width="80%" color="red">
	<br> <br> <br>

	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-right" onClick="AddTrainer()">+TRAINER</button>		
	</div>
	


	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->
