<!-- Form mulai -->
<form id="form-edit" class="form-horizontal">
	<div class="row">
	
		<div class="col-md-6">
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Code</label>
					<input type="text" class="form-control" name="code" id="code" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Title</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="Title"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Description</label>
					<textarea class="form-control" name="description" id="description" style="resize:none" rows="4" placeholder="Description"></textarea>
				</div>
			</div>
		
		</div>
		
		<div class="col-md-6">
		
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Image URL</label>
					<input type="text" class="form-control" name="imageUrl" id="imageUrl" placeholder="Image URL"/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Menu Order</label>
					<input type="text" class="form-control" name="menuOrder" id="menuOrder" placeholder="Menu Order"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Menu Parent</label>
					<select name="menuParent" class="form-control" id="menuParent">
								<option value="">-Choose Menu Parent-</option>
					</select>
					<!-- <input type="text" class="form-control" name="menuParent" placeholder="Menu Parent"/>-->
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Menu URL</label>
					<input type="text" class="form-control" name="menuUrl" id="menuUrl" placeholder="Menu URL"/>
				</div>
			</div>
			
		</div>
		
	</div>

	<input type="hidden" class="form-control" name="id"id="id"/>
	<input type="hidden" class="form-control" name="code"id="code"/>
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" value="1" />
	<!--  <input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" /> -->
	<input type="hidden" class="form-control" name="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />

	<div class="modal-footer">
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-warning">Save</button>
	</div>
</form>
<!-- Form Selesai -->