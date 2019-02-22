<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="code" placeholder="Code" />
		</div>
	</div>
         
	<div class="form-group">
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" placeholder="Name" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-10">
			<textarea  class="form-control" name="description" placeholder="Description" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->