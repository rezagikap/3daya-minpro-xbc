<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-2">Biodata Name</label>
		<div class="col-md-10">
			<select name="testId" id="testId" class="form-control">
				<option value="">=Choose Biodata Name=</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Idle Date</label>
		<div class="col-md-10">
			<input type="date" class="form-control" name="idleDate" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Last Project At</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="lastProject" placeholder="Last Project at" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Idle Reason</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="idleReason" placeholder="idle Reason"/>
		</div>
	</div>

	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn"/>
	
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-warning pull-left">SIMPAN</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">CLOSE</button>
	</div>
</form>