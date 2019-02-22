<!-- Form mulai -->
<form id="form-edit" class="form-horizontal">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label col-md-2">Code</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="code" id="code" readonly="readonly"/>
				</div>
			</div>
		
			<div class="form-group">
				<label class="control-label col-md-2">Title</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="title" id="title"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2">Description</label>
				<div class="col-md-10">
					<textarea class="form-control" name="description" id="description" rows="8"
						cols="50"></textarea>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="control-label col-md-2">Image URL</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="imageUrl" id="imageUrl"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2">Menu Order</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="menuOrder" id="menuOrder"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2">Menu Parent</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="menuParent" id="menuParent"/>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2">Menu URL</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="menuUrl" id="menuUrl"/>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" class="form-control" name="code"id="code" value="1" />
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" value="1" />
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />

	<div class="modal-footer">
		<button type="button" onClick="editData($('#form-edit'))"
			class="btn btn-primary">Save</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
	</div>
</form>
<!-- Form Selesai -->