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
		<label class="control-label col-md-2">User Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="username" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Password</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="password" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">New Password</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="password" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="mobileFlag" value="false"/>
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-primary pull-left">Simpan</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	</div>
</form>