<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<!-- Role Id -->
	<div class="form-group">
		<label class="control-label col-md-3">Role</label>
		<div class="col-md-7">
			<select name="roleId" id="roleId" class="form-control">
				<option value="">=Select Role=</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Email</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="email" id="email" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Username</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="username" id="username" />
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-3">Mobile Flag</label>
		<div class="col-md-7">
			<label class="radio-inline"> 
			<input type="radio" name="mobileFlag" id="mobileFlag" value="false">True</label>
			<label class="radio-inline">
			<input type="radio" name="mobileFlag" id="mobileFlag" value="true">False</label>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Mobile Token</label>
		<div class="col-md-7">
			<input type="text" class="form-control" name="mobileToken"
				id="mobileToken" placeholder="input Mobile Token" />
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="password" id="password" />
	
	<input type="hidden" class="form-control" name="createdBy" id="createdBy"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn"/>
	
<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" onClick="editData($('#form-edit'))">UPDATE</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">CLOSE</button>		
</div>
</form>
<!-- Form Selesai -->