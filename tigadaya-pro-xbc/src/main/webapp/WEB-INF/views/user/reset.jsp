<!-- form mulai -->
<form id="form-reset" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<div class="form-group">
		<label class="control-label col-md-3">Password</label>
		<div class="col-md-7">
			<input type="password" class="form-control" name="password" id="password" placeholder="password"/>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3">Retype Password</label>
		<div class="col-md-7">
			<input type="password" class="form-control" name="password" id="password" placeholder="re-type password"/>
		</div>
	</div>
	

	<input type="hidden" class="form-control" name="mobileFlag" id="mobileFlag" />
	
	<input type="hidden" class="form-control" name="mobileToken" id="mobileToken" />
	
	<input type="hidden" class="form-control" name="roleId" id="roleId" />
	
	<input type="hidden" class="form-control" name="email" id="email" />
	
	<input type="hidden" class="form-control" name="username" id="username" />
	
	<input type="hidden" class="form-control" name="createdBy" id="createdBy"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" value="false"/>
	
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn"/>
	
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn"/>
	
<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left" onClick="resetData($('#form-reset'))">RESET</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">CLOSE</button>		
</div>
</form>
<!-- Form Selesai -->