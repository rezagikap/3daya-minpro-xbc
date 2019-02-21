<!-- form mulai -->
<form id="form-create" class="form-horizontal">
<div class="form-group">
		<label class="control-label col-md-2">Role Id</label>
		<div class="col-md-10">
		<select name="po[roleId]" id="roleId"
								class="form-control">
								<option value="1">Choose Role</option>
							</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2">Email</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="email" id="email" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">User Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="username" id="username" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2">Password</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="password" id="password" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-2"> Re Type Password</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="password" id="password" />
		</div>
	</div>
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))"
			class="btn btn-primary">
			<i class="fa fa-save"></i>
		</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">
			<i class="fa fa-reply"></i>
		</button>
	</div>
</form>
<!-- Form Selesai -->