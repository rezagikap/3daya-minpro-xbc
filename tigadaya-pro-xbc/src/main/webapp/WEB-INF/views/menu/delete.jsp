<!-- form mulai -->
<form id="form-delete" class="form-horizontal">

	<br>
	<h3>
		<center>
			<b>Are you sure to delete this data ?</b>
		</center>
	</h3>
	<br><br>

	<input type="hidden" class="form-control" name="id"id="id" />
	<input type="hidden" class="form-control" name="description"id="description" />
	<input type="hidden" class="form-control" name="title"id="title" />
	<input type="hidden" class="form-control" name="imageUrl"id="imageUrl" />
	<input type="hidden" class="form-control" name="menuOrder"id="menuOrder" />
	<input type="hidden" class="form-control" name="menuParent"id="menuParent" />
	<input type="hidden" class="form-control" name="menuUrl"id="menuUrl" />
	<input type="hidden" class="form-control" name="code"id="code" value="1" />
	<input type="hidden" class="form-control" name="createdBy" id="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy" value="1" />
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" value=true/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left"
			data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success"
			onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->