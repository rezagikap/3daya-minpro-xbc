<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />
	<!-- name -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" id="name" placeholder="Name" />
		</div>
	</div>
	<!-- notes -->
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="notes" id="notes" placeholder="Notes"/>
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>

	<div class="modal-footer">
		<button type="button" class="btn btn-basic" style="position: relative; right:160px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-basic" style="position: relative; right:35px" >SAVE</button>
	</div>
</form>
<!-- Form Selesai -->