<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-2">Role</label>
		<div class="col-md-10">
			<select name="roleId" id="roleId" class="form-control">
				<option value="">=Select Role=</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Email</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="email" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Username</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="username" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Password</label>
		<div class="col-md-10">
			<input type="password" class="form-control" name="password" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Re-type Password</label>
		<div class="col-md-10">
			<input type="password" class="form-control" name="password" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="mobileFlag" value="false"/>
	
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-success pull-left">SIMPAN</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">CLOSE</button>
	</div>
</form>